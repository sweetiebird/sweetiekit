#include <Availability.h>

#if TARGET_OS_UIKITFORMAC
#include "./Snapshot/uikitformac/Release/snapshot.cc"
#else
#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/snapshot.cc"
#else
#include "./Release/snapshot.cc"
#endif
#endif
#endif
