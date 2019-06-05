//
//  hello-node.cpp
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include "hello-node.hpp"

#include <assert.h>
#include <pthread.h>

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <Client/Client.h>


extern "C" void iOSLog0(const char* msg);
extern "C" void iOSTrap();

void* grok_PosixThreadMainRoutine(void* args)
{
    // Do some work here.
    iOSLog0("pre-grok\n");
    //ClientMain();
    iOSLog0("post-grok\n");
    
    return NULL;
}

void* node_PosixThreadMainRoutine(void* args)
{
    // Do some work here.
    iOSLog0("pre-node\n");
    hello_node((const char*)args);
    iOSLog0("post-node\n");
    
    return NULL;
}

#include <stdio.h>
#include <string.h>

extern "C" void grok_async()
{
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    
    char* args1 = nullptr;
    
    int threadError = pthread_create(&posixThreadID, &attr, &grok_PosixThreadMainRoutine, (void*)args1);
    
    returnVal = pthread_attr_destroy(&attr);
    assert(!returnVal);
    if (threadError != 0)
    {
        // Report an error.
        iOSLog0("thread error!\n");
        iOSTrap();
    }
}

extern "C" void hello_node_async(const char* args)
{
    grok_async();
    char* args_end = (char*)args;
    while (*args_end != '\0') {
        args_end += strlen(args_end) + 1;
    }
    args_end += 1;
    
    size_t n = (size_t)(args_end - args);
    char* args1 = (char*)malloc(n);
    memcpy(args1, args, n);
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    
    int threadError = pthread_create(&posixThreadID, &attr, &node_PosixThreadMainRoutine, (void*)args1);
    
    returnVal = pthread_attr_destroy(&attr);
    assert(!returnVal);
    if (threadError != 0)
    {
        // Report an error.
        iOSLog0("thread error!\n");
        iOSTrap();
    }
}

#include <v8.h>
#include <node.h>
#include <unistd.h>

extern "C" void hello_node(const char* args)
{
    char* args1 = (char*)args;
    std::vector<char*> arg;
    while (*args1 != '\0') {
        arg.push_back((char*)args1);
        args1 += strlen(args1) + 1;
        if (arg.size() > 100)
            __builtin_trap();
    }
    arg.push_back(nullptr);
    /*
    if (!isatty(STDERR_FILENO)) {
        char* path = (char*)malloc(4096);
        snprintf(path, 4096, "%s/Documents/stderr.log", getenv("HOME"));
        freopen(path, "a+", stderr);
    }
    if (!isatty(STDOUT_FILENO)) {
        char* path = (char*)malloc(4096);
        snprintf(path, 4096, "%s/Documents/stdout.log", getenv("HOME"));
        freopen(path, "a+", stdout);
    }*/
    node::Start((int)arg.size()-1, &arg[0]);
}
