#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC
#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/embedded.S"
#else
#include "./Release/embedded.S"
#endif
#endif
#endif

#if TARGET_OS_UIKITFORMAC
#include "/Volumes/birdie/opt/native/node-uikitformac/out/Release/obj.target/v8_snapshot/geni/embedded.S"
#endif
