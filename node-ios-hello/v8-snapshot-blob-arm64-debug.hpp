//
//  v8-snapshot-blob-arm64-debug.hpp
//  node-ios-hello
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef v8_snapshot_blob_arm64_debug_hpp
#define v8_snapshot_blob_arm64_debug_hpp

#include <stdio.h>

#include <src/v8.h>
#include <src/base/platform/platform.h>

//#include <src/snapshot/snapshot.h>

namespace v8 {
namespace internal {

extern const v8::StartupData* Arm64SnapshotBlob();

}  // namespace internal
}  // namespace v8

#endif /* v8_snapshot_blob_arm64_debug_hpp */
