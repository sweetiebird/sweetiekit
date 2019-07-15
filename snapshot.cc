#if TARGET_OS_IPHONE
#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/snapshot.cc"
#else
#include "./Release/snapshot.cc"
#endif
#endif
#endif

#if TARGET_OS_UIKITFORMAC
#include "/Volumes/birdie/opt/native/node-uikitformac/out/Release/obj.target/v8_snapshot/geni/snapshot.cc"
#endif
