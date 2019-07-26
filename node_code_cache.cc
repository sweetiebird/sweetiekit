#include <Availability.h>

#define NODE_WANT_INTERNALS 1

#if TARGET_OS_UIKITFORMAC
#include "./Snapshot/uikitformac/Release/node_code_cache.cc"
#else
#if !NODE_IOS_SIMULATOR || 1
#ifdef DEBUG
#include "./Debug/node_code_cache.cc"
#else
#include "./Release/node_code_cache.cc"
#endif
#endif
#endif

#include "node_main_instance.h"

namespace node {

v8::StartupData* NodeMainInstance::GetEmbeddedSnapshotBlob() {
  return nullptr;
}

const std::vector<size_t>* NodeMainInstance::GetIsolateDataIndexes() {
  return nullptr;
}

}  // namespace node

