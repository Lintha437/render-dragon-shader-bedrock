// Preserve deferred discard across helper-function boundaries.
#ifndef RD_FRAGMENT_CONTROL_INCLUDED
#define RD_FRAGMENT_CONTROL_INCLUDED
#ifndef RD_FRAGMENT_GLOBAL_STORAGE
#define RD_FRAGMENT_GLOBAL_STORAGE
#endif
RD_FRAGMENT_GLOBAL_STORAGE bool isFragmentDiscarded;
void discardIfRequested()
{
    if (isFragmentDiscarded)
    {
        discard;
    }
}
#endif
