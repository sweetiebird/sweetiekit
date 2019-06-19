//
//  NNSURL.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSURL.h"

#define instancetype NSURL
#define js_value_instancetype js_value_NSURL

NNSURL::NNSURL() {}
NNSURL::~NNSURL() {}

JS_INIT_CLASS(NSURL, NSObject);
  // instance members (proto)
#if 0
// NSURLQueryItem
  JS_ASSIGN_STATIC_METHOD(queryItemWithNameValue);
// NSURLComponents
  JS_ASSIGN_STATIC_METHOD(componentsWithURLResolvingAgainstBaseURL);
  JS_ASSIGN_STATIC_METHOD(componentsWithString);
#endif
// NSURL:
  JS_ASSIGN_PROTO_METHOD(getFileSystemRepresentationMaxLength);
  JS_ASSIGN_PROTO_METHOD(checkResourceIsReachableAndReturnError);
  JS_ASSIGN_PROTO_METHOD(isFileReferenceURL);
  JS_ASSIGN_PROTO_METHOD(fileReferenceURL);
  JS_ASSIGN_PROTO_METHOD(getResourceValueForKeyError);
  JS_ASSIGN_PROTO_METHOD(resourceValuesForKeysError);
  JS_ASSIGN_PROTO_METHOD(setResourceValueForKeyError);
  JS_ASSIGN_PROTO_METHOD(setResourceValuesError);
  JS_ASSIGN_PROTO_METHOD(removeCachedResourceValueForKey);
  JS_ASSIGN_PROTO_METHOD(removeAllCachedResourceValues);
  JS_ASSIGN_PROTO_METHOD(setTemporaryResourceValueForKey);
  JS_ASSIGN_PROTO_METHOD(bookmarkDataWithOptionsIncludingResourceValuesForKeysRelativeToURLError);
  JS_ASSIGN_PROTO_METHOD(startAccessingSecurityScopedResource);
  JS_ASSIGN_PROTO_METHOD(stopAccessingSecurityScopedResource);
// NSURL
  JS_ASSIGN_PROTO_METHOD(getPromisedItemResourceValueForKeyError);
  JS_ASSIGN_PROTO_METHOD(promisedItemResourceValuesForKeysError);
  JS_ASSIGN_PROTO_METHOD(checkPromisedItemIsReachableAndReturnError);
#if 0
// NSURLQueryItem
  JS_ASSIGN_PROTO_METHOD(initWithNameValue);
// NSURLComponents
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithURLResolvingAgainstBaseURL);
  JS_ASSIGN_PROTO_METHOD(initWithString);
  JS_ASSIGN_PROTO_METHOD(URLRelativeToURL);
// NSString
  JS_ASSIGN_PROTO_METHOD(stringByAddingPercentEncodingWithAllowedCharacters);
  JS_ASSIGN_PROTO_METHOD(stringByAddingPercentEscapesUsingEncoding);
  JS_ASSIGN_PROTO_METHOD(stringByReplacingPercentEscapesUsingEncoding);
#endif
// NSURL
  JS_ASSIGN_PROTO_METHOD(URLByAppendingPathComponent);
  JS_ASSIGN_PROTO_METHOD(URLByAppendingPathComponentIsDirectory);
  JS_ASSIGN_PROTO_METHOD(URLByAppendingPathExtension);
#if 0
// NSFileSecurity
  JS_ASSIGN_PROTO_METHOD(initWithCoder);
// NSObject
  JS_ASSIGN_PROTO_METHOD(URLResourceDataDidBecomeAvailable);
  JS_ASSIGN_PROTO_METHOD(URLResourceDidFinishLoading);
  JS_ASSIGN_PROTO_METHOD(URLResourceDidCancelLoading);
  JS_ASSIGN_PROTO_METHOD(URLResourceDidFailLoadingWithReason);
#endif
// NSURL:
  JS_ASSIGN_PROTO_PROP_READONLY(dataRepresentation);
  JS_ASSIGN_PROTO_PROP_READONLY(absoluteString);
  JS_ASSIGN_PROTO_PROP_READONLY(relativeString);
  JS_ASSIGN_PROTO_PROP_READONLY(baseURL);
  JS_ASSIGN_PROTO_PROP_READONLY(absoluteURL);
  JS_ASSIGN_PROTO_PROP_READONLY(scheme);
  JS_ASSIGN_PROTO_PROP_READONLY(resourceSpecifier);
  JS_ASSIGN_PROTO_PROP_READONLY(host);
  JS_ASSIGN_PROTO_PROP_READONLY(port);
  JS_ASSIGN_PROTO_PROP_READONLY(user);
  JS_ASSIGN_PROTO_PROP_READONLY(password);
  JS_ASSIGN_PROTO_PROP_READONLY(path);
  JS_ASSIGN_PROTO_PROP_READONLY(fragment);
  JS_ASSIGN_PROTO_PROP_READONLY(parameterString);
  JS_ASSIGN_PROTO_PROP_READONLY(query);
  JS_ASSIGN_PROTO_PROP_READONLY(relativePath);
  JS_ASSIGN_PROTO_PROP_READONLY(hasDirectoryPath);
  JS_ASSIGN_PROTO_PROP_READONLY(fileSystemRepresentation);
  JS_ASSIGN_PROTO_PROP_READONLY(isFileURL);
  JS_ASSIGN_PROTO_PROP_READONLY(standardizedURL);
  JS_ASSIGN_PROTO_PROP_READONLY(filePathURL);
#if 0
// NSURLQueryItem
  JS_ASSIGN_PROTO_PROP_READONLY(name);
  JS_ASSIGN_PROTO_PROP_READONLY(value);
// NSURLComponents
  JS_ASSIGN_PROTO_PROP_READONLY(URL);
  JS_ASSIGN_PROTO_PROP_READONLY(string);
  JS_ASSIGN_PROTO_PROP(scheme);
  JS_ASSIGN_PROTO_PROP(user);
  JS_ASSIGN_PROTO_PROP(password);
  JS_ASSIGN_PROTO_PROP(host);
  JS_ASSIGN_PROTO_PROP(port);
  JS_ASSIGN_PROTO_PROP(path);
  JS_ASSIGN_PROTO_PROP(query);
  JS_ASSIGN_PROTO_PROP(fragment);
  JS_ASSIGN_PROTO_PROP(percentEncodedUser);
  JS_ASSIGN_PROTO_PROP(percentEncodedPassword);
  JS_ASSIGN_PROTO_PROP(percentEncodedHost);
  JS_ASSIGN_PROTO_PROP(percentEncodedPath);
  JS_ASSIGN_PROTO_PROP(percentEncodedQuery);
  JS_ASSIGN_PROTO_PROP(percentEncodedFragment);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfScheme);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfUser);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfPassword);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfHost);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfPort);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfPath);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfQuery);
  JS_ASSIGN_PROTO_PROP_READONLY(rangeOfFragment);
  JS_ASSIGN_PROTO_PROP(queryItems);
  JS_ASSIGN_PROTO_PROP(percentEncodedQueryItems);
#endif
// NSURL
  JS_ASSIGN_PROTO_PROP_READONLY(pathComponents);
  JS_ASSIGN_PROTO_PROP_READONLY(lastPathComponent);
  JS_ASSIGN_PROTO_PROP_READONLY(pathExtension);
  JS_ASSIGN_PROTO_PROP_READONLY(URLByDeletingLastPathComponent);
  JS_ASSIGN_PROTO_PROP_READONLY(URLByDeletingPathExtension);
  JS_ASSIGN_PROTO_PROP_READONLY(URLByStandardizingPath);
  JS_ASSIGN_PROTO_PROP_READONLY(URLByResolvingSymlinksInPath);

  // static members (ctor)
  JS_INIT_CTOR(NSURL, NSObject);
// NSURL
  JS_ASSIGN_STATIC_METHOD(fileURLWithPathComponents);
// NSURL:
  JS_ASSIGN_PROTO_METHOD(initWithSchemeHostPath);
  JS_ASSIGN_STATIC_METHOD(initFileURLWithPathIsDirectoryRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(initFileURLWithPathRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(initFileURLWithPathIsDirectory);
  JS_ASSIGN_STATIC_METHOD(initFileURLWithPath);
  JS_ASSIGN_STATIC_METHOD(initFileURLWithFileSystemRepresentationIsDirectoryRelativeToURL);
  JS_ASSIGN_PROTO_METHOD(initWithString);
  JS_ASSIGN_PROTO_METHOD(initWithStringRelativeToURL);
  JS_ASSIGN_PROTO_METHOD(initWithDataRepresentationRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(initAbsoluteURLWithDataRepresentationRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(initByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError);
// NSURL:
  JS_ASSIGN_STATIC_METHOD(fileURLWithPathIsDirectoryRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(fileURLWithPathRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(fileURLWithPathIsDirectory);
  JS_ASSIGN_STATIC_METHOD(fileURLWithPath);
  JS_ASSIGN_STATIC_METHOD(fileURLWithFileSystemRepresentationIsDirectoryRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(URLWithString);
  JS_ASSIGN_STATIC_METHOD(URLWithStringRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(URLWithDataRepresentationRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(absoluteURLWithDataRepresentationRelativeToURL);
  JS_ASSIGN_STATIC_METHOD(URLByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError);
  JS_ASSIGN_STATIC_METHOD(resourceValuesForKeysFromBookmarkData);
  JS_ASSIGN_STATIC_METHOD(writeBookmarkDataToURLOptionsError);
  JS_ASSIGN_STATIC_METHOD(bookmarkDataWithContentsOfURLError);
  JS_ASSIGN_STATIC_METHOD(URLByResolvingAliasFileAtURLOptionsError);
#if 0
  JS_ASSIGN_STATIC_PROP_READONLY(URLUserAllowedCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(URLPasswordAllowedCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(URLHostAllowedCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(URLPathAllowedCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(URLQueryAllowedCharacterSet);
  JS_ASSIGN_STATIC_PROP_READONLY(URLFragmentAllowedCharacterSet);
#endif
JS_INIT_CLASS_END(NSURL, NSObject);

NSString* to_value_URLString(Local<Value> value, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (is_value_NSString(value)) {
    return to_value_NSString(value);
  }
  if (is_value_NSURL(value)) {
    return [to_value_NSURL(value) absoluteString];
  }
  if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("Expected String or NSURL");
  }
  return nullptr;
}

bool is_value_URLString(Local<Value> value) {
  if (is_value_NSString(value)) {
    return true;
  }
  if (is_value_NSURL(value)) {
    return true;
  }
  return false;
}

NSURL* to_value_URL(Local<Value> value, bool* _Nullable failed) {
  if (failed) {
    *failed = false;
  }
  if (is_value_NSString(value)) {
    return [[NSURL alloc] initWithString:to_value_NSString(value)];
  }
  if (is_value_NSURL(value)) {
    return to_value_NSURL(value);
  }
  if (failed) {
    *failed = true;
  } else {
    Nan::ThrowError("Expected String or NSURL");
  }
  return nullptr;
}

bool is_value_URL(Local<Value> value) {
  if (is_value_NSString(value)) {
    return true;
  }
  if (is_value_NSURL(value)) {
    return true;
  }
  return false;
}

NAN_METHOD(NNSURL::New) {
  JS_RECONSTRUCT(NSURL);
  @autoreleasepool {
    NSURL* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSURL *)(info[0].As<External>()->Value());
    } else if (is_value_URL(info[0])) {
      NSString* URLString = to_value_URLString(info[0]);
      NSURL* baseURL = nullptr;
      if (is_value_URL(info[1])) {
        baseURL = to_value_URL(info[1]);
      }
      self = [[NSURL alloc] initWithString:URLString relativeToURL:baseURL];
    } else if (info.Length() <= 0) {
      self = [[NSURL alloc] init];
    }
    if (self) {
      NNSURL *wrapper = new NNSURL();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSURL::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSURL::fileURLWithPathIsDirectoryRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_value(BOOL, isDir);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithPath: path isDirectory: isDir relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::fileURLWithPathRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithPath: path relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::fileURLWithPathIsDirectory) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_value(BOOL, isDir);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithPath: path isDirectory: isDir]));
  }
}

NAN_METHOD(NNSURL::fileURLWithPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithPath: path]));
  }
}

NAN_METHOD(NNSURL::fileURLWithFileSystemRepresentationIsDirectoryRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(/*const-char*/ NSString, path);
    declare_value(BOOL, isDir);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithFileSystemRepresentation: [path UTF8String] isDirectory: isDir relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::URLWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    JS_SET_RETURN(js_value_instancetype([NSURL URLWithString: URLString]));
  }
}

NAN_METHOD(NNSURL::URLWithStringRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([NSURL URLWithString: URLString relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::URLWithDataRepresentationRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([NSURL URLWithDataRepresentation: data relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::absoluteURLWithDataRepresentationRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([NSURL absoluteURLWithDataRepresentation: data relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::URLByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSData, bookmarkData);
    declare_value(NSURLBookmarkResolutionOptions, options);
    declare_nullable_pointer(NSURL, relativeURL);
    declare_value(BOOL-pointer-_Nullable, isStale);
    declare_pointer(NSError-pointer, error);
    JS_SET_RETURN(js_value_instancetype([NSURL URLByResolvingBookmarkData: bookmarkData options: options relativeToURL: relativeURL bookmarkDataIsStale: isStale error: error]));
    #endif
  }
}

NAN_METHOD(NNSURL::resourceValuesForKeysFromBookmarkData) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSURLResourceKey>, keys);
    declare_pointer(NSData, bookmarkData);
    JS_SET_RETURN(js_value_NSDictionary/* <NSURLResourceKey, id>*/([NSURL resourceValuesForKeys: keys fromBookmarkData: bookmarkData]));
  }
}

NAN_METHOD(NNSURL::writeBookmarkDataToURLOptionsError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, bookmarkData);
    declare_pointer(NSURL, bookmarkFileURL);
    declare_value(NSURLBookmarkFileCreationOptions, options);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_BOOL([NSURL writeBookmarkData: bookmarkData toURL: bookmarkFileURL options: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::bookmarkDataWithContentsOfURLError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, bookmarkFileURL);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_NSData([NSURL bookmarkDataWithContentsOfURL: bookmarkFileURL error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::URLByResolvingAliasFileAtURLOptionsError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(NSURLBookmarkResolutionOptions, options);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_instancetype([NSURL URLByResolvingAliasFileAtURL: url options: options error: &error]));
    js_panic_NSError(error);
  }
}

#if TODO
NAN_METHOD(NNSURLQueryItem::queryItemWithNameValue) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSString, value);
    JS_SET_RETURN(js_value_instancetype([NSURLQueryItem queryItemWithName: name value: value]));
  }
}

NAN_METHOD(NNSURLComponents::componentsWithURLResolvingAgainstBaseURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(BOOL, resolve);
    JS_SET_RETURN(js_value_instancetype([NSURLComponents componentsWithURL: url resolvingAgainstBaseURL: resolve]));
  }
}

NAN_METHOD(NNSURLComponents::componentsWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    JS_SET_RETURN(js_value_instancetype([NSURLComponents componentsWithString: URLString]));
  }
}
#endif

NAN_METHOD(NNSURL::fileURLWithPathComponents) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSString*>, components);
    JS_SET_RETURN(js_value_NSURL([NSURL fileURLWithPathComponents: components]));
  }
}

NAN_METHOD(NNSURL::initWithSchemeHostPath) {
  JS_UNWRAP_OR_ALLOC(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, scheme);
    declare_nullable_pointer(NSString, host);
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([self initWithScheme: scheme host: host path: path]));
  }
}

NAN_METHOD(NNSURL::initFileURLWithPathIsDirectoryRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_value(BOOL, isDir);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initFileURLWithPath: path isDirectory: isDir relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::initFileURLWithPathRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initFileURLWithPath: path relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::initFileURLWithPathIsDirectory) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    declare_value(BOOL, isDir);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initFileURLWithPath: path isDirectory: isDir]));
  }
}

NAN_METHOD(NNSURL::initFileURLWithPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initFileURLWithPath: path]));
  }
}

NAN_METHOD(NNSURL::initFileURLWithFileSystemRepresentationIsDirectoryRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(/*const_char*/ NSString, path);
    declare_value(BOOL, isDir);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initFileURLWithFileSystemRepresentation: [path UTF8String] isDirectory: isDir relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::initWithString) {
  JS_UNWRAP_OR_ALLOC(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    JS_SET_RETURN(js_value_instancetype([self initWithString: URLString]));
  }
}

NAN_METHOD(NNSURL::initWithStringRelativeToURL) {
  JS_UNWRAP_OR_ALLOC(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([self initWithString: URLString relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::initWithDataRepresentationRelativeToURL) {
  JS_UNWRAP_OR_ALLOC(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([self initWithDataRepresentation: data relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::initAbsoluteURLWithDataRepresentationRelativeToURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initAbsoluteURLWithDataRepresentation: data relativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSURL::getFileSystemRepresentationMaxLength) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    JS_TODO();
    #if TODO
    declare_pointer(char, buffer);
    declare_value(NSUInteger, maxBufferLength);
    JS_SET_RETURN(js_value_BOOL([self getFileSystemRepresentation: buffer maxLength: maxBufferLength]));
    #endif
  }
}

NAN_METHOD(NNSURL::checkResourceIsReachableAndReturnError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_BOOL([self checkResourceIsReachableAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::isFileReferenceURL) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFileReferenceURL]));
  }
}

NAN_METHOD(NNSURL::fileReferenceURL) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self fileReferenceURL]));
  }
}

NAN_METHOD(NNSURL::getResourceValueForKeyError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(out-id-_Nullable-pointer-_Nonnull, value);
    declare_value(NSURLResourceKey, key);
    declare_value(out-NSError-pointer-pointer-_Nullable, error);
    JS_SET_RETURN(js_value_BOOL([self getResourceValue: value forKey: key error: error]));
    #endif
  }
}

NAN_METHOD(NNSURL::resourceValuesForKeysError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSURLResourceKey>, keys);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_NSDictionary/* <NSURLResourceKey, id>*/([self resourceValuesForKeys: keys error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::setResourceValueForKeyError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_value(NSURLResourceKey, key);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_BOOL([self setResourceValue: value forKey: key error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::setResourceValuesError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSURLResourceKey, id>*/, keyedValues);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_BOOL([self setResourceValues: keyedValues error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::removeCachedResourceValueForKey) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSURLResourceKey, key);
    [self removeCachedResourceValueForKey: key];
  }
}

NAN_METHOD(NNSURL::removeAllCachedResourceValues) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    [self removeAllCachedResourceValues];
  }
}

NAN_METHOD(NNSURL::setTemporaryResourceValueForKey) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, value);
    declare_value(NSURLResourceKey, key);
    [self setTemporaryResourceValue: value forKey: key];
  }
}

NAN_METHOD(NNSURL::bookmarkDataWithOptionsIncludingResourceValuesForKeysRelativeToURLError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSURLBookmarkCreationOptions, options);
    declare_nullable_pointer(NSArray<NSURLResourceKey>, keys);
    declare_nullable_pointer(NSURL, relativeURL);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_NSData([self bookmarkDataWithOptions: options includingResourceValuesForKeys: keys relativeToURL: relativeURL error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::initByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, bookmarkData);
    declare_value(NSURLBookmarkResolutionOptions, options);
    declare_nullable_pointer(NSURL, relativeURL);
//    declare_value(BOOL-pointer-_Nullable, isStale);
    BOOL isStale = false;
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_instancetype([[NSURL alloc] initByResolvingBookmarkData: bookmarkData options: options relativeToURL: relativeURL bookmarkDataIsStale: &isStale error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::startAccessingSecurityScopedResource) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self startAccessingSecurityScopedResource]));
  }
}

NAN_METHOD(NNSURL::stopAccessingSecurityScopedResource) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    [self stopAccessingSecurityScopedResource];
  }
}

NAN_METHOD(NNSURL::getPromisedItemResourceValueForKeyError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
//    declare_value(id-_Nullable-pointer-_Nonnull, value);
    id value = nullptr;
    declare_value(NSURLResourceKey, key);
    NSError* error = nullptr;
    BOOL result = [self getPromisedItemResourceValue: &value forKey: key error: &error];
    js_panic_NSError(error);
    if (result) {
      JS_SET_RETURN(js_value_id(value));
    }
  }
}

NAN_METHOD(NNSURL::promisedItemResourceValuesForKeysError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSURLResourceKey>, keys);
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_NSDictionary/* <NSURLResourceKey,id>*/([self promisedItemResourceValuesForKeys: keys error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NNSURL::checkPromisedItemIsReachableAndReturnError) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    NSError* error = nullptr;
    JS_SET_RETURN(js_value_BOOL([self checkPromisedItemIsReachableAndReturnError: &error]));
    js_panic_NSError(error);
  }
}

#if TODO
NAN_METHOD(NNSURLQueryItem::initWithNameValue) {
  JS_UNWRAP_OR_ALLOC(NSURLQueryItem, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_pointer(NSString, value);
    JS_SET_RETURN(js_value_instancetype([self initWithName: name value: value]));
  }
}

NAN_METHOD(NNSURLComponents::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[NSURLComponents alloc] init]));
  }
}

NAN_METHOD(NNSURLComponents::initWithURLResolvingAgainstBaseURL) {
  JS_UNWRAP_OR_ALLOC(NSURLComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(BOOL, resolve);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: url resolvingAgainstBaseURL: resolve]));
  }
}

NAN_METHOD(NNSURLComponents::initWithString) {
  JS_UNWRAP_OR_ALLOC(NSURLComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, URLString);
    JS_SET_RETURN(js_value_instancetype([self initWithString: URLString]));
  }
}

NAN_METHOD(NNSURLComponents::URLRelativeToURL) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSURL, baseURL);
    JS_SET_RETURN(js_value_NSURL([self URLRelativeToURL: baseURL]));
  }
}

NAN_METHOD(NNSString::stringByAddingPercentEncodingWithAllowedCharacters) {
  JS_UNWRAP(NSString, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCharacterSet, allowedCharacters);
    JS_SET_RETURN(js_value_NSString([self stringByAddingPercentEncodingWithAllowedCharacters: allowedCharacters]));
  }
}

NAN_METHOD(NNSString::stringByAddingPercentEscapesUsingEncoding) {
  JS_UNWRAP(NSString, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSStringEncoding, enc);
    JS_SET_RETURN(js_value_NSString([self stringByAddingPercentEscapesUsingEncoding: enc]));
  }
}

NAN_METHOD(NNSString::stringByReplacingPercentEscapesUsingEncoding) {
  JS_UNWRAP(NSString, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSStringEncoding, enc);
    JS_SET_RETURN(js_value_NSString([self stringByReplacingPercentEscapesUsingEncoding: enc]));
  }
}
#endif

NAN_METHOD(NNSURL::URLByAppendingPathComponent) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, pathComponent);
    JS_SET_RETURN(js_value_NSURL([self URLByAppendingPathComponent: pathComponent]));
  }
}

NAN_METHOD(NNSURL::URLByAppendingPathComponentIsDirectory) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, pathComponent);
    declare_value(BOOL, isDirectory);
    JS_SET_RETURN(js_value_NSURL([self URLByAppendingPathComponent: pathComponent isDirectory: isDirectory]));
  }
}

NAN_METHOD(NNSURL::URLByAppendingPathExtension) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, pathExtension);
    JS_SET_RETURN(js_value_NSURL([self URLByAppendingPathExtension: pathExtension]));
  }
}

#if TODO
NAN_METHOD(NNSFileSecurity::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(NSFileSecurity, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_METHOD(NNSObject::URLResourceDataDidBecomeAvailable) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, sender);
    declare_pointer(NSData, newBytes);
    [self URL: sender resourceDataDidBecomeAvailable: newBytes];
  }
}

NAN_METHOD(NNSObject::URLResourceDidFinishLoading) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, sender);
    [self URLResourceDidFinishLoading: sender];
  }
}

NAN_METHOD(NNSObject::URLResourceDidCancelLoading) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, sender);
    [self URLResourceDidCancelLoading: sender];
  }
}

NAN_METHOD(NNSObject::URLResourceDidFailLoadingWithReason) {
  JS_UNWRAP(NSObject, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, sender);
    declare_pointer(NSString, reason);
    [self URL: sender resourceDidFailLoadingWithReason: reason];
  }
}
#endif

NAN_GETTER(NNSURL::dataRepresentationGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self dataRepresentation]));
  }
}

NAN_GETTER(NNSURL::absoluteStringGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self absoluteString]));
  }
}

NAN_GETTER(NNSURL::relativeStringGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self relativeString]));
  }
}

NAN_GETTER(NNSURL::baseURLGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self baseURL]));
  }
}

NAN_GETTER(NNSURL::absoluteURLGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self absoluteURL]));
  }
}

NAN_GETTER(NNSURL::schemeGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self scheme]));
  }
}

NAN_GETTER(NNSURL::resourceSpecifierGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self resourceSpecifier]));
  }
}

NAN_GETTER(NNSURL::hostGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self host]));
  }
}

NAN_GETTER(NNSURL::portGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self port]));
  }
}

NAN_GETTER(NNSURL::userGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self user]));
  }
}

NAN_GETTER(NNSURL::passwordGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self password]));
  }
}

NAN_GETTER(NNSURL::pathGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self path]));
  }
}

NAN_GETTER(NNSURL::fragmentGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self fragment]));
  }
}

NAN_GETTER(NNSURL::parameterStringGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self parameterString]));
  }
}

NAN_GETTER(NNSURL::queryGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self query]));
  }
}

NAN_GETTER(NNSURL::relativePathGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self relativePath]));
  }
}

NAN_GETTER(NNSURL::hasDirectoryPathGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hasDirectoryPath]));
  }
}

NAN_GETTER(NNSURL::fileSystemRepresentationGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    const char* result = [self fileSystemRepresentation];
    if (result) {
      JS_SET_RETURN(js_value_NSString([[NSString alloc] initWithUTF8String:result]));
    }
  }
}

NAN_GETTER(NNSURL::isFileURLGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isFileURL]));
  }
}

NAN_GETTER(NNSURL::standardizedURLGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self standardizedURL]));
  }
}

NAN_GETTER(NNSURL::filePathURLGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self filePathURL]));
  }
}

#if TODO

NAN_GETTER(NNSURLQueryItem::nameGetter) {
  JS_UNWRAP(NSURLQueryItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}

NAN_GETTER(NNSURLQueryItem::valueGetter) {
  JS_UNWRAP(NSURLQueryItem, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self value]));
  }
}

NAN_GETTER(NNSURLComponents::URLGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URL]));
  }
}

NAN_GETTER(NNSURLComponents::stringGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self string]));
  }
}

NAN_GETTER(NNSURLComponents::schemeGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self scheme]));
  }
}

NAN_SETTER(NNSURLComponents::schemeSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setScheme: input];
  }
}

NAN_GETTER(NNSURLComponents::userGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self user]));
  }
}

NAN_SETTER(NNSURLComponents::userSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setUser: input];
  }
}

NAN_GETTER(NNSURLComponents::passwordGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self password]));
  }
}

NAN_SETTER(NNSURLComponents::passwordSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPassword: input];
  }
}

NAN_GETTER(NNSURLComponents::hostGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self host]));
  }
}

NAN_SETTER(NNSURLComponents::hostSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setHost: input];
  }
}

NAN_GETTER(NNSURLComponents::portGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self port]));
  }
}

NAN_SETTER(NNSURLComponents::portSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSNumber, input);
    [self setPort: input];
  }
}

NAN_GETTER(NNSURLComponents::pathGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self path]));
  }
}

NAN_SETTER(NNSURLComponents::pathSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPath: input];
  }
}

NAN_GETTER(NNSURLComponents::queryGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self query]));
  }
}

NAN_SETTER(NNSURLComponents::querySetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setQuery: input];
  }
}

NAN_GETTER(NNSURLComponents::fragmentGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self fragment]));
  }
}

NAN_SETTER(NNSURLComponents::fragmentSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setFragment: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedUserGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedUser]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedUserSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedUser: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedPasswordGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedPassword]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedPasswordSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedPassword: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedHostGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedHost]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedHostSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedHost: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedPathGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedPath]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedPathSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedPath: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedQueryGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedQuery]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedQuerySetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedQuery: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedFragmentGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self percentEncodedFragment]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedFragmentSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setPercentEncodedFragment: input];
  }
}

NAN_GETTER(NNSURLComponents::rangeOfSchemeGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfScheme]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfUserGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfUser]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfPasswordGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfPassword]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfHostGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfHost]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfPortGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfPort]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfPathGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfPath]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfQueryGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfQuery]));
  }
}

NAN_GETTER(NNSURLComponents::rangeOfFragmentGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSRange([self rangeOfFragment]));
  }
}

NAN_GETTER(NNSURLComponents::queryItemsGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSURLQueryItem*>([self queryItems]));
  }
}

NAN_SETTER(NNSURLComponents::queryItemsSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSURLQueryItem*>, input);
    [self setQueryItems: input];
  }
}

NAN_GETTER(NNSURLComponents::percentEncodedQueryItemsGetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSURLQueryItem*>([self percentEncodedQueryItems]));
  }
}

NAN_SETTER(NNSURLComponents::percentEncodedQueryItemsSetter) {
  JS_UNWRAP(NSURLComponents, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSURLQueryItem*>, input);
    [self setPercentEncodedQueryItems: input];
  }
}

NAN_GETTER(NNSString::stringByRemovingPercentEncodingGetter) {
  JS_UNWRAP(NSString, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self stringByRemovingPercentEncoding]));
  }
}
#endif

#if TODO

NAN_GETTER(NNSCharacterSet::URLUserAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLUserAllowedCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::URLPasswordAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLPasswordAllowedCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::URLHostAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLHostAllowedCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::URLPathAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLPathAllowedCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::URLQueryAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLQueryAllowedCharacterSet]));
  }
}

NAN_GETTER(NNSCharacterSet::URLFragmentAllowedCharacterSetGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSCharacterSet([NSCharacterSet URLFragmentAllowedCharacterSet]));
  }
}
#endif

NAN_GETTER(NNSURL::pathComponentsGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self pathComponents]));
  }
}

NAN_GETTER(NNSURL::lastPathComponentGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self lastPathComponent]));
  }
}

NAN_GETTER(NNSURL::pathExtensionGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self pathExtension]));
  }
}

NAN_GETTER(NNSURL::URLByDeletingLastPathComponentGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URLByDeletingLastPathComponent]));
  }
}

NAN_GETTER(NNSURL::URLByDeletingPathExtensionGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URLByDeletingPathExtension]));
  }
}

NAN_GETTER(NNSURL::URLByStandardizingPathGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URLByStandardizingPath]));
  }
}

NAN_GETTER(NNSURL::URLByResolvingSymlinksInPathGetter) {
  JS_UNWRAP(NSURL, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self URLByResolvingSymlinksInPath]));
  }
}
