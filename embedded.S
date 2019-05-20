#if !NODE_IOS_SIMULATOR
#ifdef DEBUG
#include "./Debug/embedded.S"
#else
#include "./Release/embedded.S"
#endif
#endif
