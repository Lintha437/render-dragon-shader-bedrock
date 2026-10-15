// Validate original and rebuilt shader pairs using the Windows D3D12 runtime.
// This probe creates pipeline objects only; it does not render or launch Minecraft.
#include <windows.h>
#include <d3d12.h>
#include <d3d12shader.h>
#include <d3d11shader.h>
#include <d3dcompiler.h>
#include <dxgi1_4.h>
#include <dxcapi.h>
#include <wrl/client.h>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <iostream>
#include <iterator>
#include <d3d12sdklayers.h>
using Microsoft::WRL::ComPtr;
using Bytes = std::vector<char>;
Bytes read(const std::string& p) { std::ifstream f(p, std::ios::binary); return Bytes(std::istreambuf_iterator<char>(f), {}); }
ComPtr<IDxcUtils> utils;
struct Reflection {
    ComPtr<ID3D12ShaderReflection> modern;
    ComPtr<ID3D11ShaderReflection> legacy;
    Reflection(const Bytes& b) {
        DxcBuffer buffer{b.data(), b.size(), 0};
        if (utils) utils->CreateReflection(&buffer, IID_PPV_ARGS(&modern));
        if (!modern) D3DReflect(b.data(), b.size(), IID_PPV_ARGS(&legacy));
    }
    UINT count(bool input) {
        if (modern) { D3D12_SHADER_DESC d{}; modern->GetDesc(&d); return input ? d.InputParameters : d.OutputParameters; }
        if (legacy) { D3D11_SHADER_DESC d{}; legacy->GetDesc(&d); return input ? d.InputParameters : d.OutputParameters; }
        return 0;
    }
    D3D12_SIGNATURE_PARAMETER_DESC parameter(bool input, UINT i) {
        D3D12_SIGNATURE_PARAMETER_DESC d{};
        if (modern) { if (input) modern->GetInputParameterDesc(i, &d); else modern->GetOutputParameterDesc(i, &d); }
        else if (legacy) { D3D11_SIGNATURE_PARAMETER_DESC a{}; if (input) legacy->GetInputParameterDesc(i, &a); else legacy->GetOutputParameterDesc(i, &a); d.SemanticName=a.SemanticName; d.SemanticIndex=a.SemanticIndex; d.Register=a.Register; d.SystemValueType=a.SystemValueType; d.ComponentType=a.ComponentType; d.Mask=a.Mask; }
        return d;
    }
};
DXGI_FORMAT format(D3D_REGISTER_COMPONENT_TYPE t, UINT mask) {
    UINT n=0; while(mask) { n++; mask >>= 1; }
    static const DXGI_FORMAT f[3][4]={{DXGI_FORMAT_R32_UINT,DXGI_FORMAT_R32G32_UINT,DXGI_FORMAT_R32G32B32_UINT,DXGI_FORMAT_R32G32B32A32_UINT},{DXGI_FORMAT_R32_SINT,DXGI_FORMAT_R32G32_SINT,DXGI_FORMAT_R32G32B32_SINT,DXGI_FORMAT_R32G32B32A32_SINT},{DXGI_FORMAT_R32_FLOAT,DXGI_FORMAT_R32G32_FLOAT,DXGI_FORMAT_R32G32B32_FLOAT,DXGI_FORMAT_R32G32B32A32_FLOAT}};
    return f[t==D3D_REGISTER_COMPONENT_UINT32?0:t==D3D_REGISTER_COMPONENT_SINT32?1:2][n?n-1:0];
}
int main(int argc, char** argv) {
    if (argc != 3) return 2;
    auto dll=LoadLibraryA(argv[2]);
    auto create=dll ? reinterpret_cast<DxcCreateInstanceProc>(GetProcAddress(dll,"DxcCreateInstance")) : nullptr;
    if (create) create(CLSID_DxcUtils, IID_PPV_ARGS(&utils));
    ComPtr<ID3D12Debug> debug; if (SUCCEEDED(D3D12GetDebugInterface(IID_PPV_ARGS(&debug)))) debug->EnableDebugLayer();
    ComPtr<IDXGIFactory4> factory; CreateDXGIFactory1(IID_PPV_ARGS(&factory));
    ComPtr<IDXGIAdapter> warp; factory->EnumWarpAdapter(IID_PPV_ARGS(&warp));
    ComPtr<ID3D12Device> device; auto hr=D3D12CreateDevice(warp.Get(),D3D_FEATURE_LEVEL_12_0,IID_PPV_ARGS(&device));
    if (FAILED(hr)) { std::cerr << "Device unavailable " << std::hex << hr; return 3; }
    ComPtr<ID3D12InfoQueue> queue; device.As(&queue);
    D3D12_DESCRIPTOR_RANGE ranges[4][16]{}; D3D12_ROOT_PARAMETER params[4]{};
    const D3D12_DESCRIPTOR_RANGE_TYPE types[]={D3D12_DESCRIPTOR_RANGE_TYPE_CBV,D3D12_DESCRIPTOR_RANGE_TYPE_SRV,D3D12_DESCRIPTOR_RANGE_TYPE_UAV,D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER};
    for(UINT i=0;i<4;i++) { for(UINT space=0;space<16;space++) { auto& range=ranges[i][space];range.RangeType=types[i];range.NumDescriptors=i==3?16:i==0?128:4096;range.RegisterSpace=space==15?99:space;range.OffsetInDescriptorsFromTableStart=D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND; } params[i].ParameterType=D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE; params[i].DescriptorTable={16,ranges[i]}; params[i].ShaderVisibility=D3D12_SHADER_VISIBILITY_ALL; }
    D3D12_ROOT_SIGNATURE_DESC rs{4,params,0,nullptr,D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT};
    ComPtr<ID3DBlob> blob, errors; hr=D3D12SerializeRootSignature(&rs,D3D_ROOT_SIGNATURE_VERSION_1,&blob,&errors);
    if(FAILED(hr)) return 4;
    ComPtr<ID3D12RootSignature> root; device->CreateRootSignature(0,blob->GetBufferPointer(),blob->GetBufferSize(),IID_PPV_ARGS(&root));
    std::ifstream rows(argv[1]); std::string line;
    while(std::getline(rows,line)) {
        std::vector<std::string> cells; std::istringstream stream(line); std::string cell; while(std::getline(stream,cell,'\t')) cells.push_back(cell);
        if(cells.size()!=5) continue;
        for(int rebuilt=0;rebuilt<2;rebuilt++) {
            auto vs=read(cells[rebuilt?3:1]), ps=read(cells[rebuilt?4:2]);
            if(queue) queue->ClearStoredMessages();
            ComPtr<ID3D12PipelineState> state;
            if(cells[2]=="-") {
                D3D12_COMPUTE_PIPELINE_STATE_DESC d{}; d.pRootSignature=root.Get(); d.CS={vs.data(),vs.size()}; hr=device->CreateComputePipelineState(&d,IID_PPV_ARGS(&state));
            } else {
                Reflection vin(vs), pout(ps); std::vector<D3D12_INPUT_ELEMENT_DESC> inputs;
                for(UINT i=0;i<vin.count(true);i++) { auto p=vin.parameter(true,i); if(p.SystemValueType!=D3D_NAME_UNDEFINED) continue; inputs.push_back({p.SemanticName,p.SemanticIndex,format(p.ComponentType,p.Mask),0,D3D12_APPEND_ALIGNED_ELEMENT,D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA,0}); }
                D3D12_GRAPHICS_PIPELINE_STATE_DESC d{}; d.pRootSignature=root.Get(); d.VS={vs.data(),vs.size()}; d.PS={ps.data(),ps.size()}; d.InputLayout={inputs.data(),static_cast<UINT>(inputs.size())};
                d.SampleMask=UINT_MAX; d.RasterizerState.FillMode=D3D12_FILL_MODE_SOLID; d.RasterizerState.CullMode=D3D12_CULL_MODE_NONE; d.RasterizerState.DepthClipEnable=TRUE;
                d.DepthStencilState.DepthFunc=D3D12_COMPARISON_FUNC_ALWAYS; d.PrimitiveTopologyType=D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE; d.SampleDesc.Count=1;
                for(UINT i=0;i<8;i++) { auto& t=d.BlendState.RenderTarget[i]; t.SrcBlend=D3D12_BLEND_ONE; t.DestBlend=D3D12_BLEND_ZERO; t.BlendOp=D3D12_BLEND_OP_ADD; t.SrcBlendAlpha=D3D12_BLEND_ONE; t.DestBlendAlpha=D3D12_BLEND_ZERO; t.BlendOpAlpha=D3D12_BLEND_OP_ADD; t.LogicOp=D3D12_LOGIC_OP_NOOP; t.RenderTargetWriteMask=D3D12_COLOR_WRITE_ENABLE_ALL; }
                for(UINT i=0;i<pout.count(false);i++) { auto p=pout.parameter(false,i); if(p.SystemValueType==D3D_NAME_TARGET && p.SemanticIndex<8) { d.NumRenderTargets=max(d.NumRenderTargets,p.SemanticIndex+1); d.RTVFormats[p.SemanticIndex]=format(p.ComponentType,15); } if(p.SystemValueType==D3D_NAME_DEPTH || p.SystemValueType==D3D_NAME_DEPTH_GREATER_EQUAL || p.SystemValueType==D3D_NAME_DEPTH_LESS_EQUAL) {d.DSVFormat=DXGI_FORMAT_D32_FLOAT;d.DepthStencilState.DepthEnable=TRUE;d.DepthStencilState.DepthWriteMask=D3D12_DEPTH_WRITE_MASK_ALL;} }
                for(UINT i=0;i<d.NumRenderTargets;i++) if(d.RTVFormats[i]==DXGI_FORMAT_UNKNOWN) d.RTVFormats[i]=DXGI_FORMAT_R32G32B32A32_FLOAT;
                hr=device->CreateGraphicsPipelineState(&d,IID_PPV_ARGS(&state));
            }
            std::cout << cells[0] << '\t' << (rebuilt?"rebuilt":"original") << '\t' << std::hex << static_cast<unsigned long>(hr) << std::dec << '\n';
            if(queue && FAILED(hr)) for(UINT64 i=0;i<queue->GetNumStoredMessages();i++) { SIZE_T size=0; queue->GetMessage(i,nullptr,&size); Bytes b(size); auto m=reinterpret_cast<D3D12_MESSAGE*>(b.data()); queue->GetMessage(i,m,&size); std::cout << "  " << m->pDescription << '\n'; }
            std::cout.flush();
        }
    }
}
