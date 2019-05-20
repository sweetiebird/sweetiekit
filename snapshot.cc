#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/snapshot.cc"
#else
#include "./Release/snapshot.cc"
#endif
#endif
