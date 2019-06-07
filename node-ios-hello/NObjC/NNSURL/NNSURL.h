//
//  NNSURL.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSURL_h
#define NNSURL_h    

#include "NNSObject.h"

#define js_value_NSURL(x) js_value_wrapper(x, NSURL)
#define to_value_NSURL(x) to_value_wrapper(x, NSURL)
#define is_value_NSURL(x) is_value_wrapper(x, NSURL)

// Foundation enums
#define js_value_NSURLResourceKey(x) JS_ENUM(NSURLResourceKey, NSString, x)
#define to_value_NSURLResourceKey(x) TO_ENUM(NSURLResourceKey, NSString, x)
#define is_value_NSURLResourceKey(x) IS_ENUM(NSURLResourceKey, NSString, x)

#define js_value_NSURLBookmarkFileCreationOptions(x) JS_OPTS(NSURLBookmarkFileCreationOptions, NSUInteger, x)
#define to_value_NSURLBookmarkFileCreationOptions(x) TO_OPTS(NSURLBookmarkFileCreationOptions, NSUInteger, x)
#define is_value_NSURLBookmarkFileCreationOptions(x) IS_OPTS(NSURLBookmarkFileCreationOptions, NSUInteger, x)

#define js_value_NSURLBookmarkCreationOptions(x) JS_OPTS(NSURLBookmarkCreationOptions, NSUInteger, x)
#define to_value_NSURLBookmarkCreationOptions(x) TO_OPTS(NSURLBookmarkCreationOptions, NSUInteger, x)
#define is_value_NSURLBookmarkCreationOptions(x) IS_OPTS(NSURLBookmarkCreationOptions, NSUInteger, x)

#define js_value_NSURLBookmarkResolutionOptions(x) JS_OPTS(NSURLBookmarkResolutionOptions, NSUInteger, x)
#define to_value_NSURLBookmarkResolutionOptions(x) TO_OPTS(NSURLBookmarkResolutionOptions, NSUInteger, x)
#define is_value_NSURLBookmarkResolutionOptions(x) IS_OPTS(NSURLBookmarkResolutionOptions, NSUInteger, x)

JS_WRAP_CLASS(NSURL, NSObject);
// NSURL:
  JS_STATIC_METHOD(fileURLWithPathIsDirectoryRelativeToURL);
  JS_STATIC_METHOD(fileURLWithPathRelativeToURL);
  JS_STATIC_METHOD(fileURLWithPathIsDirectory);
  JS_STATIC_METHOD(fileURLWithPath);
  JS_STATIC_METHOD(fileURLWithFileSystemRepresentationIsDirectoryRelativeToURL);
  JS_STATIC_METHOD(URLWithString);
  JS_STATIC_METHOD(URLWithStringRelativeToURL);
  JS_STATIC_METHOD(URLWithDataRepresentationRelativeToURL);
  JS_STATIC_METHOD(absoluteURLWithDataRepresentationRelativeToURL);
  JS_STATIC_METHOD(URLByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError);
  JS_STATIC_METHOD(resourceValuesForKeysFromBookmarkData);
  JS_STATIC_METHOD(writeBookmarkDataToURLOptionsError);
  JS_STATIC_METHOD(bookmarkDataWithContentsOfURLError);
  JS_STATIC_METHOD(URLByResolvingAliasFileAtURLOptionsError);
#if 0
// NSURLQueryItem
  JS_STATIC_METHOD(queryItemWithNameValue);
// NSURLComponents
  JS_STATIC_METHOD(componentsWithURLResolvingAgainstBaseURL);
  JS_STATIC_METHOD(componentsWithString);
#endif
// NSURL
  JS_STATIC_METHOD(fileURLWithPathComponents);
  JS_STATIC_METHOD(initWithSchemeHostPath);
  JS_STATIC_METHOD(initFileURLWithPathIsDirectoryRelativeToURL);
  JS_STATIC_METHOD(initFileURLWithPathRelativeToURL);
  JS_STATIC_METHOD(initFileURLWithPathIsDirectory);
  JS_STATIC_METHOD(initFileURLWithPath);
  JS_STATIC_METHOD(initFileURLWithFileSystemRepresentationIsDirectoryRelativeToURL);
  JS_STATIC_METHOD(initWithString);
  JS_STATIC_METHOD(initWithStringRelativeToURL);
  JS_STATIC_METHOD(initWithDataRepresentationRelativeToURL);
  JS_STATIC_METHOD(initAbsoluteURLWithDataRepresentationRelativeToURL);
  JS_METHOD(getFileSystemRepresentationMaxLength);
  JS_METHOD(checkResourceIsReachableAndReturnError);
  JS_METHOD(isFileReferenceURL);
  JS_METHOD(fileReferenceURL);
  JS_METHOD(getResourceValueForKeyError);
  JS_METHOD(resourceValuesForKeysError);
  JS_METHOD(setResourceValueForKeyError);
  JS_METHOD(setResourceValuesError);
  JS_METHOD(removeCachedResourceValueForKey);
  JS_METHOD(removeAllCachedResourceValues);
  JS_METHOD(setTemporaryResourceValueForKey);
  JS_METHOD(bookmarkDataWithOptionsIncludingResourceValuesForKeysRelativeToURLError);
  JS_STATIC_METHOD(initByResolvingBookmarkDataOptionsRelativeToURLBookmarkDataIsStaleError);
  JS_METHOD(startAccessingSecurityScopedResource);
  JS_METHOD(stopAccessingSecurityScopedResource);
  JS_METHOD(getPromisedItemResourceValueForKeyError);
  JS_METHOD(promisedItemResourceValuesForKeysError);
  JS_METHOD(checkPromisedItemIsReachableAndReturnError);
#if 0
// NSURLQueryItem
  JS_STATIC_METHOD(initWithNameValue);
// NSURLComponents
  JS_STATIC_METHOD(init);
  JS_STATIC_METHOD(initWithURLResolvingAgainstBaseURL);
  JS_STATIC_METHOD(initWithString);
  JS_METHOD(URLRelativeToURL);
// NSString
  JS_METHOD(stringByAddingPercentEncodingWithAllowedCharacters);
  JS_METHOD(stringByAddingPercentEscapesUsingEncoding);
  JS_METHOD(stringByReplacingPercentEscapesUsingEncoding);
#endif
// NSURL
  JS_METHOD(URLByAppendingPathComponent);
  JS_METHOD(URLByAppendingPathComponentIsDirectory);
  JS_METHOD(URLByAppendingPathExtension);
#if 0
// NSFileSecurity
  JS_STATIC_METHOD(initWithCoder);
// NSObject
  JS_METHOD(URLResourceDataDidBecomeAvailable);
  JS_METHOD(URLResourceDidFinishLoading);
  JS_METHOD(URLResourceDidCancelLoading);
  JS_METHOD(URLResourceDidFailLoadingWithReason);
#endif
// NSURL
  JS_PROP_READONLY(dataRepresentation);
  JS_PROP_READONLY(absoluteString);
  JS_PROP_READONLY(relativeString);
  JS_PROP_READONLY(baseURL);
  JS_PROP_READONLY(absoluteURL);
  JS_PROP_READONLY(scheme);
  JS_PROP_READONLY(resourceSpecifier);
  JS_PROP_READONLY(host);
  JS_PROP_READONLY(port);
  JS_PROP_READONLY(user);
  JS_PROP_READONLY(password);
  JS_PROP_READONLY(path);
  JS_PROP_READONLY(fragment);
  JS_PROP_READONLY(parameterString);
  JS_PROP_READONLY(query);
  JS_PROP_READONLY(relativePath);
  JS_PROP_READONLY(hasDirectoryPath);
  JS_PROP_READONLY(fileSystemRepresentation);
  JS_PROP_READONLY(isFileURL);
  JS_PROP_READONLY(standardizedURL);
  JS_PROP_READONLY(filePathURL);
#if 0
// NSURLQueryItem
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(value);
// NSURLComponents
  JS_PROP_READONLY(URL);
  JS_PROP_READONLY(string);
  JS_PROP(scheme);
  JS_PROP(user);
  JS_PROP(password);
  JS_PROP(host);
  JS_PROP(port);
  JS_PROP(path);
  JS_PROP(query);
  JS_PROP(fragment);
  JS_PROP(percentEncodedUser);
  JS_PROP(percentEncodedPassword);
  JS_PROP(percentEncodedHost);
  JS_PROP(percentEncodedPath);
  JS_PROP(percentEncodedQuery);
  JS_PROP(percentEncodedFragment);
  JS_PROP_READONLY(rangeOfScheme);
  JS_PROP_READONLY(rangeOfUser);
  JS_PROP_READONLY(rangeOfPassword);
  JS_PROP_READONLY(rangeOfHost);
  JS_PROP_READONLY(rangeOfPort);
  JS_PROP_READONLY(rangeOfPath);
  JS_PROP_READONLY(rangeOfQuery);
  JS_PROP_READONLY(rangeOfFragment);
  JS_PROP(queryItems);
  JS_PROP(percentEncodedQueryItems);
  // NSCharacterSet
  JS_STATIC_PROP_READONLY(URLUserAllowedCharacterSet);
  JS_STATIC_PROP_READONLY(URLPasswordAllowedCharacterSet);
  JS_STATIC_PROP_READONLY(URLHostAllowedCharacterSet);
  JS_STATIC_PROP_READONLY(URLPathAllowedCharacterSet);
  JS_STATIC_PROP_READONLY(URLQueryAllowedCharacterSet);
  JS_STATIC_PROP_READONLY(URLFragmentAllowedCharacterSet);
#endif
#if 0
// NSString
  JS_PROP_READONLY(stringByRemovingPercentEncoding);
#endif
// NSURL
  JS_PROP_READONLY(pathComponents);
  JS_PROP_READONLY(lastPathComponent);
  JS_PROP_READONLY(pathExtension);
  JS_PROP_READONLY(URLByDeletingLastPathComponent);
  JS_PROP_READONLY(URLByDeletingPathExtension);
  JS_PROP_READONLY(URLByStandardizingPath);
  JS_PROP_READONLY(URLByResolvingSymlinksInPath);

JS_WRAP_CLASS_END(NSURL);

#endif /* NNSURL_h */
