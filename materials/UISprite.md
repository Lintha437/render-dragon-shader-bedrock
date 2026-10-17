# UISprite

Parent: `UI/Fill`.

The JSON recipe's `default_features` fields control `--defaults`. Source lists identify the maintained pipelines; aliases share their implementation instead of copying it.

```powershell
python tools/project.py build --material UISprite --defaults
```

## AlphaTest

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: MultiColorTint=Off.

- [GLSL fragment: UISprite/AlphaTest.fragment.glsl](../GLSL/pipelines/UISprite/AlphaTest.fragment.glsl)
- [HLSL fragment: UISprite/AlphaTest.fragment.hlsl](../HLSL/pipelines/UISprite/AlphaTest.fragment.hlsl)
- [GLSL vertex: UISprite/AlphaTest.vertex.glsl](../GLSL/pipelines/UISprite/AlphaTest.vertex.glsl)
- [HLSL vertex: UISprite/AlphaTest.vertex.hlsl](../HLSL/pipelines/UISprite/AlphaTest.vertex.hlsl)

## Blend

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: MultiColorTint=Off.

- [GLSL fragment: UISprite/Blend.fragment.glsl](../GLSL/pipelines/UISprite/Blend.fragment.glsl)
- [HLSL fragment: UISprite/Blend.fragment.hlsl](../HLSL/pipelines/UISprite/Blend.fragment.hlsl)
- [GLSL vertex: UISprite/AlphaTest.vertex.glsl](../GLSL/pipelines/UISprite/AlphaTest.vertex.glsl)
- [HLSL vertex: UISprite/AlphaTest.vertex.hlsl](../HLSL/pipelines/UISprite/AlphaTest.vertex.hlsl)

## Transparent

Native profiles: `ps_4_0`, `ps_5_0`, `ps_6_3`, `ps_6_5`, `vs_4_0`, `vs_5_0`, `vs_6_3`, `vs_6_5`.

Default features: MultiColorTint=Off.

- [GLSL fragment: UISprite/Transparent.fragment.glsl](../GLSL/pipelines/UISprite/Transparent.fragment.glsl)
- [HLSL fragment: UISprite/Transparent.fragment.hlsl](../HLSL/pipelines/UISprite/Transparent.fragment.hlsl)
- [GLSL vertex: UISprite/AlphaTest.vertex.glsl](../GLSL/pipelines/UISprite/AlphaTest.vertex.glsl)
- [HLSL vertex: UISprite/AlphaTest.vertex.hlsl](../HLSL/pipelines/UISprite/AlphaTest.vertex.hlsl)

