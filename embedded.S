#include <Availability.h>

#if TARGET_OS_UIKITFORMAC
#include "./Snapshot/uikitformac/Release/embedded.S"
#else
#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/embedded.S"
#else
#include "./Release/embedded.S"
#endif
#endif
#endif
