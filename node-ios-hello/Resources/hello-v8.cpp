//
//  hello-v8.cpp
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "hello-v8.hpp"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <libplatform/libplatform.h>
#include <v8.h>
#include <src/flags.h>


#include <errno.h>
#include <signal.h>
#include <stdio.h>

#include "include/libplatform/libplatform.h"
#include "src/assembler-arch.h"
#include "src/base/platform/platform.h"
#include "src/flags.h"
#include "src/msan.h"
#include "src/snapshot/embedded-file-writer.h"
#include "src/snapshot/natives.h"
#include "src/snapshot/partial-serializer.h"
#include "src/snapshot/snapshot.h"
#include "src/snapshot/startup-serializer.h"
#include "src/source-position-table.h"


#include "v8-snapshot-blob-arm64-debug.hpp"

extern "C" void iOSLog0(const char* msg);

extern "C" void SerializeV8Blob();

namespace i = v8::internal;

using namespace v8;

void DisableAlwaysOpt() {
    i::FLAG_always_opt = false;
    i::FLAG_predictable = true;
}

extern "C" Isolate* hellov8_init(int argc, char** argv)
{
    v8::base::EnsureConsoleOutput();
    
    // Make mksnapshot runs predictable to create reproducible snapshots.
    i::FLAG_predictable = true;
    //i::Arm64SnapshotBlob();
    
    // Print the usage if an error occurs when parsing the command line
    // flags or if the help flag is set.
    int result = i::FlagList::SetFlagsFromCommandLine(&argc, argv, true);
    if (result > 0 || (argc > 3) || i::FLAG_help) {
        ::printf("Usage: %s --startup_src=... --startup_blob=... [extras]\n",
                 argv[0]);
        i::FlagList::PrintHelp();
        //return !i::FLAG_help;
        return nullptr;
    }
    
    i::CpuFeatures::Probe(true);
    v8::V8::InitializeICUDefaultLocation(argv[0]);
    std::unique_ptr<v8::Platform> platform = v8::platform::NewDefaultPlatform();
    v8::V8::InitializePlatform(platform.get());
    v8::V8::Initialize();
    i::DisableEmbeddedBlobRefcounting();
    //v8::StartupData blob;
    {
        v8::Isolate* isolate = v8::Isolate::Allocate();
        if (i::FLAG_embedded_builtins) {
            // Set code range such that relative jumps for builtins to
            // builtin calls in the snapshot are possible.
            i::Isolate* i_isolate = reinterpret_cast<i::Isolate*>(isolate);
            size_t code_range_size =
            i::kMaximalCodeRangeSize == 0
            ? i::kMaxPCRelativeCodeRangeInMB
            : std::min(i::kMaximalCodeRangeSize / i::MB,
                       i::kMaxPCRelativeCodeRangeInMB);
            i_isolate->heap()->ConfigureHeap(0, 0, code_range_size);
            // The isolate contains data from builtin compilation that needs
            // to be written out if builtins are embedded.
            //i_isolate->RegisterEmbeddedFileWriter(&embedded_writer);
        }
        //v8::SnapshotCreator snapshot_creator(isolate, nullptr, (StartupData*)i::Arm64SnapshotBlob());
        v8::SnapshotCreator snapshot_creator(isolate, nullptr, (StartupData*)i::Snapshot::DefaultSnapshotBlob());
        return isolate;
    }
}

extern "C" void hellov8(const char* program_name)
{
#if 1
    iOSLog0("Initialize V8\n");
    // Initialize V8.
    V8::InitializeICUDefaultLocation(program_name);
    V8::InitializeExternalStartupData(program_name);
    
#if 1
    i::FLAG_profile_deserialization = true;
    i::FLAG_interpreted_frames_native_stack = true;
    i::FLAG_jitless = true;
#ifdef DEBUG
    i::FLAG_print_ast = true;
#endif
    i::FLAG_print_bytecode = true;
    i::FLAG_log_function_events = true;
    i::FLAG_abort_on_stack_or_string_length_overflow = true;
    i::FLAG_expose_wasm = true;
    
    
    i::FLAG_predictable = true;
    i::FLAG_always_opt = false;
#endif

    iOSLog0("Initialize Platform\n");
    std::unique_ptr<Platform> platform = platform::NewDefaultPlatform();
    V8::InitializePlatform(platform.get());
    
    iOSLog0("V8::Initialize\n");
    V8::Initialize();
    iOSLog0("V8::Initialize done\n");
    
    //SerializeV8Blob();
    
    // Create a new Isolate and make it the current one.
    Isolate::CreateParams create_params;
    create_params.array_buffer_allocator = ArrayBuffer::Allocator::NewDefaultAllocator();
    //i::Arm64SnapshotBlob();
    //create_params.snapshot_blob = (v8::StartupData*)i::Arm64SnapshotBlob();
    iOSLog0("Isolate::New\n");
    Isolate* isolate = Isolate::New(create_params);
    iOSLog0("Isolate::New done\n");
    
#else
    char* argv[] = {strdup(program_name)};
    Isolate* isolate = hellov8_init(1, argv);
    if (isolate == nullptr) {
        __builtin_trap();
        return;
    }
#endif
    
    {
        iOSLog0("Isolate::Scope\n");
        Isolate::Scope isolate_scope(isolate);
        
        // Create a stack-allocated handle scope.
        iOSLog0("HandleScope\n");
        HandleScope handle_scope(isolate);
        
        // Create a new context.
        iOSLog0("Context::New\n");
        Local<Context> context = Context::New(isolate);
        
        // Enter the context for compiling and running the hello world script.
        iOSLog0("Context::Scope\n");
        Context::Scope context_scope(context);
        
        {
            iOSLog0("String::NewFromUtf8\n");
            // Create a string containing the JavaScript source code.
            Local<String> source =
            String::NewFromUtf8(isolate, "'Hello' + ', World!'",
                                NewStringType::kNormal)
            .ToLocalChecked();
            
            iOSLog0("Script::Compile\n");
            // Compile the source code.
            Local<Script> script =
            Script::Compile(context, source).ToLocalChecked();
            
            // Run the script to get the result.
            iOSLog0("script->Run\n");
            Local<Value> result = script->Run(context).ToLocalChecked();
            
            // Convert the result to an UTF8 string and print it.
            iOSLog0("String::Utf8Value utf8(isolate, result)\n");
            String::Utf8Value utf8(isolate, result);
            printf("result: %s\n", *utf8);
            iOSLog0(*utf8);
        }
        
        if (/* DISABLES CODE */ (0))
        {
            // Use the JavaScript API to generate a WebAssembly module.
            //
            // |bytes| contains the binary format for the following module:
            //
            //     (func (export "add") (param i32 i32) (result i32)
            //       get_local 0
            //       get_local 1
            //       i32.add)
            //
            const char* csource = R"(
            let bytes = new Uint8Array([
                                        0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00, 0x01, 0x07, 0x01,
                                        0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f, 0x03, 0x02, 0x01, 0x00, 0x07,
                                        0x07, 0x01, 0x03, 0x61, 0x64, 0x64, 0x00, 0x00, 0x0a, 0x09, 0x01,
                                        0x07, 0x00, 0x20, 0x00, 0x20, 0x01, 0x6a, 0x0b
                                        ]);
            let module = new WebAssembly.Module(bytes);
            let instance = new WebAssembly.Instance(module);
            instance.exports.add(3, 4);
            )";
            
            // Create a string containing the JavaScript source code.
            Local<String> source =
            String::NewFromUtf8(isolate, csource, NewStringType::kNormal)
            .ToLocalChecked();
            
            // Compile the source code.
            Local<Script> script =
            Script::Compile(context, source).ToLocalChecked();
            
            // Run the script to get the result.
            Local<Value> result = script->Run(context).ToLocalChecked();
            
            // Convert the result to a uint32 and print it.
            uint32_t number = result->Uint32Value(context).ToChecked();
            printf("3 + 4 = %u\n", number);
        }
    }
    
    // Dispose the isolate and tear down V8.
    isolate->Dispose();
    V8::Dispose();
    V8::ShutdownPlatform();
    //delete create_params.array_buffer_allocator;
}


#include <assert.h>
#include <pthread.h>

void* PosixThreadMainRoutine(void* program_name)
{
    // Do some work here.
    iOSLog0("pre-hellov8\n");
    hellov8((const char*)program_name);
    iOSLog0("post-hellov8\n");
    
    return NULL;
}

extern "C" void hellov8async(const char* program_name)
{
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    
    int     threadError = pthread_create(&posixThreadID, &attr, &PosixThreadMainRoutine, (void*)program_name);
    
    returnVal = pthread_attr_destroy(&attr);
    assert(!returnVal);
    if (threadError != 0)
    {
        printf("thread error!");
        // Report an error.
        exit(42); // TODO
    }
}
