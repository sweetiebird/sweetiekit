//
//  NNSBundle.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSBundle_h
#define NNSBundle_h

#include "NNSObject.h"

#define js_value_NSBundle(x) js_value_wrapper(x, NSBundle)
#define to_value_NSBundle(x) to_value_wrapper(x, NSBundle)
#define is_value_NSBundle(x) is_value_wrapper(x, NSBundle)

JS_WRAP_CLASS(NSBundle, NSObject);
  JS_METHOD(pathForResource);
  JS_METHOD(main);
  
  JS_STATIC_METHOD(bundleWithPath);
  JS_STATIC_METHOD(bundleWithURL);
  JS_STATIC_METHOD(bundleForClass);
  JS_STATIC_METHOD(bundleWithIdentifier);
  JS_STATIC_METHOD(URLForResourceWithExtensionSubdirectoryInBundleWithURL);
  JS_STATIC_METHOD(URLsForResourcesWithExtensionSubdirectoryInBundleWithURL);
  JS_STATIC_METHOD(pathForResourceOfTypeInDirectory);
  JS_STATIC_METHOD(pathsForResourcesOfTypeInDirectory);
  JS_STATIC_METHOD(preferredLocalizationsFromArray);
  JS_STATIC_METHOD(preferredLocalizationsFromArrayForPreferences);
  JS_METHOD(initWithPath);
  JS_METHOD(initWithURL);
  JS_METHOD(load);
  JS_METHOD(unload);
  JS_METHOD(preflightAndReturnError);
  JS_METHOD(loadAndReturnError);
  JS_METHOD(URLForAuxiliaryExecutable);
  JS_METHOD(pathForAuxiliaryExecutable);
  JS_METHOD(URLForResourceWithExtension);
  JS_METHOD(URLForResourceWithExtensionSubdirectory);
  JS_METHOD(URLForResourceWithExtensionSubdirectoryLocalization);
  JS_METHOD(URLsForResourcesWithExtensionSubdirectory);
  JS_METHOD(URLsForResourcesWithExtensionSubdirectoryLocalization);
  JS_METHOD(pathForResourceOfType);
  JS_METHOD(pathForResourceOfTypeInDirectoryStatic);
  JS_METHOD(pathForResourceOfTypeInDirectoryForLocalization);
  JS_METHOD(pathsForResourcesOfTypeInDirectoryStatic);
  JS_METHOD(pathsForResourcesOfTypeInDirectoryForLocalization);
  JS_METHOD(localizedStringForKeyValueTable);
  JS_METHOD(objectForInfoDictionaryKey);
  JS_METHOD(classNamed);
  
  //@interface NSBundle(UINibLoadingAdditions)
  //- (nullable NSArray *)loadNibNamed:(NSString *)name owner:(nullable id)owner options:(nullable NSDictionary<UINibOptionsKey, id> *)options;
  JS_METHOD(loadNibNamedOwnerOptions);
  //@end
#if TODO
// NSString
  JS_METHOD(variantFittingPresentationWidth);
// NSBundleResourceRequest
  JS_STATIC_METHOD(init);
  JS_METHOD(initWithTags);
  JS_METHOD(initWithTagsBundle);
  JS_METHOD(beginAccessingResourcesWithCompletionHandler);
  JS_METHOD(conditionallyBeginAccessingResourcesWithCompletionHandler);
  JS_METHOD(endAccessingResources);
#endif
// NSBundle
  JS_METHOD(setPreservationPriorityForTags);
  JS_METHOD(preservationPriorityForTag);
  JS_STATIC_PROP_READONLY(mainBundle);
  JS_STATIC_PROP_READONLY(allBundles);
  JS_STATIC_PROP_READONLY(allFrameworks);
  JS_PROP_READONLY(isLoaded);
  JS_PROP_READONLY(bundleURL);
  JS_PROP_READONLY(resourceURL);
  JS_PROP_READONLY(executableURL);
  JS_PROP_READONLY(privateFrameworksURL);
  JS_PROP_READONLY(sharedFrameworksURL);
  JS_PROP_READONLY(sharedSupportURL);
  JS_PROP_READONLY(builtInPlugInsURL);
  JS_PROP_READONLY(appStoreReceiptURL);
  JS_PROP_READONLY(bundlePath);
  JS_PROP_READONLY(resourcePath);
  JS_PROP_READONLY(executablePath);
  JS_PROP_READONLY(privateFrameworksPath);
  JS_PROP_READONLY(sharedFrameworksPath);
  JS_PROP_READONLY(sharedSupportPath);
  JS_PROP_READONLY(builtInPlugInsPath);
  JS_PROP_READONLY(bundleIdentifier);
  JS_PROP_READONLY(infoDictionary);
  JS_PROP_READONLY(localizedInfoDictionary);
  JS_PROP_READONLY(principalClass);
  JS_PROP_READONLY(preferredLocalizations);
  JS_PROP_READONLY(localizations);
  JS_PROP_READONLY(developmentLocalization);
  JS_PROP_READONLY(executableArchitectures);
#if TODO
// NSBundleResourceRequest
  JS_PROP(loadingPriority);
  JS_PROP_READONLY(tags);
  JS_PROP_READONLY(bundle);
  JS_PROP_READONLY(progress);
#endif

JS_WRAP_CLASS_END(NSBundle);

#endif /* NNSBundle_h */
