//
//  NNSBundle.mm
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSBundle.h"

#define instancetype NSBundle
#define js_value_instancetype js_value_NSBundle

NNSBundle::NNSBundle () {}
NNSBundle::~NNSBundle () {}

JS_INIT_CLASS(NSBundle, NSObject);
  // instance members (proto)
  JS_ASSIGN_METHOD(proto, pathForResource);
  JS_ASSIGN_PROTO_METHOD(load);
  JS_ASSIGN_PROTO_METHOD(unload);
  JS_ASSIGN_PROTO_METHOD(preflightAndReturnError);
  JS_ASSIGN_PROTO_METHOD(loadAndReturnError);
  JS_ASSIGN_PROTO_METHOD(URLForAuxiliaryExecutable);
  JS_ASSIGN_PROTO_METHOD(pathForAuxiliaryExecutable);
  JS_ASSIGN_PROTO_METHOD(URLForResourceWithExtension);
  JS_ASSIGN_PROTO_METHOD(URLForResourceWithExtensionSubdirectory);
  JS_ASSIGN_PROTO_METHOD(URLForResourceWithExtensionSubdirectoryLocalization);
  JS_ASSIGN_PROTO_METHOD(URLsForResourcesWithExtensionSubdirectory);
  JS_ASSIGN_PROTO_METHOD(URLsForResourcesWithExtensionSubdirectoryLocalization);
  JS_ASSIGN_PROTO_METHOD(pathForResourceOfType);
  JS_ASSIGN_PROTO_METHOD(pathForResourceOfTypeInDirectory);
  JS_ASSIGN_PROTO_METHOD(pathForResourceOfTypeInDirectoryForLocalization);
  JS_ASSIGN_PROTO_METHOD(pathsForResourcesOfTypeInDirectory);
  JS_ASSIGN_PROTO_METHOD(pathsForResourcesOfTypeInDirectoryForLocalization);
  JS_ASSIGN_PROTO_METHOD(localizedStringForKeyValueTable);
  JS_ASSIGN_PROTO_METHOD(objectForInfoDictionaryKey);
  JS_ASSIGN_PROTO_METHOD(classNamed);
#if TODO
// NSString
  JS_ASSIGN_PROTO_METHOD(variantFittingPresentationWidth);
// NSBundleResourceRequest
  JS_ASSIGN_STATIC_METHOD(init);
  JS_ASSIGN_PROTO_METHOD(initWithTags);
  JS_ASSIGN_PROTO_METHOD(initWithTagsBundle);
  JS_ASSIGN_PROTO_METHOD(beginAccessingResourcesWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(conditionallyBeginAccessingResourcesWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(endAccessingResources);
#endif
// NSBundle
  JS_ASSIGN_PROTO_METHOD(setPreservationPriorityForTags);
  JS_ASSIGN_PROTO_METHOD(preservationPriorityForTag);
  JS_ASSIGN_PROTO_PROP_READONLY(isLoaded);
  JS_ASSIGN_PROTO_PROP_READONLY(bundleURL);
  JS_ASSIGN_PROTO_PROP_READONLY(resourceURL);
  JS_ASSIGN_PROTO_PROP_READONLY(executableURL);
  JS_ASSIGN_PROTO_PROP_READONLY(privateFrameworksURL);
  JS_ASSIGN_PROTO_PROP_READONLY(sharedFrameworksURL);
  JS_ASSIGN_PROTO_PROP_READONLY(sharedSupportURL);
  JS_ASSIGN_PROTO_PROP_READONLY(builtInPlugInsURL);
  JS_ASSIGN_PROTO_PROP_READONLY(appStoreReceiptURL);
  JS_ASSIGN_PROTO_PROP_READONLY(bundlePath);
  JS_ASSIGN_PROTO_PROP_READONLY(resourcePath);
  JS_ASSIGN_PROTO_PROP_READONLY(executablePath);
  JS_ASSIGN_PROTO_PROP_READONLY(privateFrameworksPath);
  JS_ASSIGN_PROTO_PROP_READONLY(sharedFrameworksPath);
  JS_ASSIGN_PROTO_PROP_READONLY(sharedSupportPath);
  JS_ASSIGN_PROTO_PROP_READONLY(builtInPlugInsPath);
  JS_ASSIGN_PROTO_PROP_READONLY(bundleIdentifier);
  JS_ASSIGN_PROTO_PROP_READONLY(infoDictionary);
  JS_ASSIGN_PROTO_PROP_READONLY(localizedInfoDictionary);
  JS_ASSIGN_PROTO_PROP_READONLY(principalClass);
  JS_ASSIGN_PROTO_PROP_READONLY(preferredLocalizations);
  JS_ASSIGN_PROTO_PROP_READONLY(localizations);
  JS_ASSIGN_PROTO_PROP_READONLY(developmentLocalization);
  JS_ASSIGN_PROTO_PROP_READONLY(executableArchitectures);
#if TODO
// NSBundleResourceRequest
  JS_ASSIGN_PROTO_PROP(loadingPriority);
  JS_ASSIGN_PROTO_PROP_READONLY(tags);
  JS_ASSIGN_PROTO_PROP_READONLY(bundle);
  JS_ASSIGN_PROTO_PROP_READONLY(progress);
#endif


//@interface NSBundle(UINibLoadingAdditions)
//- (nullable NSArray *)loadNibNamed:(NSString *)name owner:(nullable id)owner options:(nullable NSDictionary<UINibOptionsKey, id> *)options;
  JS_ASSIGN_PROTO_METHOD(loadNibNamedOwnerOptions);
  JS_ASSIGN_PROTO_METHOD_AS(loadNibNamedOwnerOptions, "loadNibNamed");
//@end

  // static members (ctor)
  JS_INIT_CTOR(NSBundle, NSObject);
  JS_ASSIGN_METHOD(ctor, main);
  JS_ASSIGN_STATIC_PROP_READONLY(mainBundle);
  JS_ASSIGN_STATIC_PROP_READONLY(allBundles);
  JS_ASSIGN_STATIC_PROP_READONLY(allFrameworks);
  JS_ASSIGN_STATIC_METHOD(bundleWithPath);
  JS_ASSIGN_STATIC_METHOD(bundleWithURL);
  JS_ASSIGN_STATIC_METHOD(bundleForClass);
  JS_ASSIGN_STATIC_METHOD(bundleWithIdentifier);
  JS_ASSIGN_STATIC_METHOD(URLForResourceWithExtensionSubdirectoryInBundleWithURL);
  JS_ASSIGN_STATIC_METHOD(URLsForResourcesWithExtensionSubdirectoryInBundleWithURL);
  JS_ASSIGN_STATIC_METHOD_AS(pathForResourceOfTypeInDirectoryStatic, "pathForResourceOfTypeInDirectory");
  JS_ASSIGN_STATIC_METHOD_AS(pathsForResourcesOfTypeInDirectoryStatic, "pathsForResourceOfTypeInDirectory");
  JS_ASSIGN_STATIC_METHOD(preferredLocalizationsFromArray);
  JS_ASSIGN_STATIC_METHOD(preferredLocalizationsFromArrayForPreferences);
  JS_ASSIGN_PROTO_METHOD(initWithPath);
  JS_ASSIGN_PROTO_METHOD(initWithURL);
JS_INIT_CLASS_END(NSBundle, NSObject);

#include "NNSURL.h"

NAN_METHOD(NNSBundle::New) {
  JS_RECONSTRUCT(NSBundle);
  @autoreleasepool {
    NSBundle* self = nullptr;
    
    declare_args();
    if (info[0]->IsExternal()) {
      self = (__bridge NSBundle *)(info[0].As<External>()->Value());
    } else if (is_value_NSString(info[0])) {
      declare_pointer(NSString, path);
      self = [[NSBundle alloc] initWithPath:path];
    } else if (is_value_NSURL(info[0])) {
      declare_pointer(NSURL, url);
      self = [[NSBundle alloc] initWithURL:url];
    } else if (info.Length() <= 0) {
      self = [[NSBundle alloc] init];
    }
    if (self) {
      NNSBundle *wrapper = new NNSBundle();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSBundle::New: invalid arguments");
    }
  }
}

NAN_METHOD(NNSBundle::main) {
  Nan::HandleScope scope;

  NSBundle *main = [NSBundle mainBundle];

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)main)
  };

  Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(main, type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  JS_SET_RETURN(value);
}

NAN_METHOD(NNSBundle::pathForResource) {
  Nan::HandleScope scope;

  JS_UNWRAP(NSBundle, bundle);

  std::string resource;
  if (info[0]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
    resource = *utf8Value;
  } else {
    Nan::ThrowError("NNSBundle::PathForResource: invalid argument resource");
  }
  
  std::string type;
  if (info[1]->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(info[1]));
    type = *utf8Value;
  } else {
    Nan::ThrowError("NNSBundle::PathForResource: invalid argument type");
  }

  NSString *path = [bundle pathForResource:[NSString stringWithUTF8String:resource.c_str()] ofType:[NSString stringWithUTF8String:type.c_str()]];

  info.GetReturnValue().Set(JS_STR([path UTF8String]));
}

NAN_METHOD(NNSBundle::bundleWithPath) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([NSBundle bundleWithPath: path]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NNSBundle::bundleWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_instancetype([NSBundle bundleWithURL: url]));
  }
}

NAN_METHOD(NNSBundle::bundleForClass) {
  declare_autoreleasepool {
    declare_args();
    declare_value(id, aClass);
    JS_SET_RETURN(js_value_NSBundle([NSBundle bundleForClass: aClass]));
  }
}

NAN_METHOD(NNSBundle::bundleWithIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_NSBundle([NSBundle bundleWithIdentifier: identifier]));
  }
}

NAN_METHOD(NNSBundle::URLForResourceWithExtensionSubdirectoryInBundleWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_pointer(NSURL, bundleURL);
    JS_SET_RETURN(js_value_NSURL([NSBundle URLForResource: name withExtension: ext subdirectory: subpath inBundleWithURL: bundleURL]));
  }
}

NAN_METHOD(NNSBundle::URLsForResourcesWithExtensionSubdirectoryInBundleWithURL) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_pointer(NSURL, bundleURL);
    JS_SET_RETURN(js_value_NSArray<NSURL*>([NSBundle URLsForResourcesWithExtension: ext subdirectory: subpath inBundleWithURL: bundleURL]));
  }
}

NAN_METHOD(NNSBundle::pathForResourceOfTypeInDirectoryStatic) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_pointer(NSString, bundlePath);
    JS_SET_RETURN(js_value_NSString([NSBundle pathForResource: name ofType: ext inDirectory: bundlePath]));
  }
}

NAN_METHOD(NNSBundle::pathsForResourcesOfTypeInDirectoryStatic) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_pointer(NSString, bundlePath);
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSBundle pathsForResourcesOfType: ext inDirectory: bundlePath]));
  }
}

NAN_METHOD(NNSBundle::preferredLocalizationsFromArray) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSString*>, localizationsArray);
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSBundle preferredLocalizationsFromArray: localizationsArray]));
  }
}

NAN_METHOD(NNSBundle::preferredLocalizationsFromArrayForPreferences) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSString*>, localizationsArray);
    declare_nullable_pointer(NSArray<NSString*>, preferencesArray);
    JS_SET_RETURN(js_value_NSArray<NSString*>([NSBundle preferredLocalizationsFromArray: localizationsArray forPreferences: preferencesArray]));
  }
}

NAN_METHOD(NNSBundle::initWithPath) {
  JS_UNWRAP_OR_ALLOC(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, path);
    JS_SET_RETURN(js_value_instancetype([self initWithPath: path]));
  }
}

NAN_METHOD(NNSBundle::initWithURL) {
  JS_UNWRAP_OR_ALLOC(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: url]));
  }
}

NAN_METHOD(NNSBundle::load) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self load]));
  }
}

NAN_METHOD(NNSBundle::unload) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self unload]));
  }
}

NAN_METHOD(NNSBundle::preflightAndReturnError) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self preflightAndReturnError: &error]));
    check_error();
  }
}

NAN_METHOD(NNSBundle::loadAndReturnError) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self loadAndReturnError: &error]));
    check_error();
  }
}

NAN_METHOD(NNSBundle::URLForAuxiliaryExecutable) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, executableName);
    JS_SET_RETURN(js_value_NSURL([self URLForAuxiliaryExecutable: executableName]));
  }
}

NAN_METHOD(NNSBundle::pathForAuxiliaryExecutable) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, executableName);
    JS_SET_RETURN(js_value_NSString([self pathForAuxiliaryExecutable: executableName]));
  }
}

NAN_METHOD(NNSBundle::URLForResourceWithExtension) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    JS_SET_RETURN(js_value_NSURL([self URLForResource: name withExtension: ext]));
  }
}

NAN_METHOD(NNSBundle::URLForResourceWithExtensionSubdirectory) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    JS_SET_RETURN(js_value_NSURL([self URLForResource: name withExtension: ext subdirectory: subpath]));
  }
}

NAN_METHOD(NNSBundle::URLForResourceWithExtensionSubdirectoryLocalization) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_nullable_pointer(NSString, localizationName);
    JS_SET_RETURN(js_value_NSURL([self URLForResource: name withExtension: ext subdirectory: subpath localization: localizationName]));
  }
}

NAN_METHOD(NNSBundle::URLsForResourcesWithExtensionSubdirectory) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    JS_SET_RETURN(js_value_NSArray<NSURL*>([self URLsForResourcesWithExtension: ext subdirectory: subpath]));
  }
}

NAN_METHOD(NNSBundle::URLsForResourcesWithExtensionSubdirectoryLocalization) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_nullable_pointer(NSString, localizationName);
    JS_SET_RETURN(js_value_NSArray<NSURL*>([self URLsForResourcesWithExtension: ext subdirectory: subpath localization: localizationName]));
  }
}

NAN_METHOD(NNSBundle::pathForResourceOfType) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    JS_SET_RETURN(js_value_NSString([self pathForResource: name ofType: ext]));
  }
}

NAN_METHOD(NNSBundle::pathForResourceOfTypeInDirectory) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    JS_SET_RETURN(js_value_NSString([self pathForResource: name ofType: ext inDirectory: subpath]));
  }
}

NAN_METHOD(NNSBundle::pathForResourceOfTypeInDirectoryForLocalization) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, name);
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_nullable_pointer(NSString, localizationName);
    JS_SET_RETURN(js_value_NSString([self pathForResource: name ofType: ext inDirectory: subpath forLocalization: localizationName]));
  }
}

NAN_METHOD(NNSBundle::pathsForResourcesOfTypeInDirectory) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self pathsForResourcesOfType: ext inDirectory: subpath]));
  }
}

NAN_METHOD(NNSBundle::pathsForResourcesOfTypeInDirectoryForLocalization) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, ext);
    declare_nullable_pointer(NSString, subpath);
    declare_nullable_pointer(NSString, localizationName);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self pathsForResourcesOfType: ext inDirectory: subpath forLocalization: localizationName]));
  }
}

NAN_METHOD(NNSBundle::localizedStringForKeyValueTable) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    declare_nullable_pointer(NSString, value);
    declare_nullable_pointer(NSString, tableName);
    JS_SET_RETURN(js_value_NSString([self localizedStringForKey: key value: value table: tableName]));
  }
}

NAN_METHOD(NNSBundle::objectForInfoDictionaryKey) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self objectForInfoDictionaryKey: key]));
  }
}

NAN_METHOD(NNSBundle::classNamed) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, className);
    JS_SET_RETURN(js_value_Class([self classNamed: className]));
  }
}

#if TODO
NAN_METHOD(NNSString::variantFittingPresentationWidth) {
  JS_UNWRAP(NSString, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSInteger, width);
    JS_SET_RETURN(js_value_NSString([self variantFittingPresentationWidth: width]));
  }
}

NAN_METHOD(NNSBundleResourceRequest::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[NSBundleResourceRequest alloc] init]));
  }
}

NAN_METHOD(NNSBundleResourceRequest::initWithTags) {
  JS_UNWRAP_OR_ALLOC(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet<NSString*>, tags);
    JS_SET_RETURN(js_value_instancetype([self initWithTags: tags]));
  }
}

NAN_METHOD(NNSBundleResourceRequest::initWithTagsBundle) {
  JS_UNWRAP_OR_ALLOC(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet<NSString*>, tags);
    declare_pointer(NSBundle, bundle);
    JS_SET_RETURN(js_value_instancetype([self initWithTags: tags bundle: bundle]));
  }
}

NAN_METHOD(NNSBundleResourceRequest::beginAccessingResourcesWithCompletionHandler) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(void-^-NSError-pointer,_Nullable,error, completionHandler);
    [self beginAccessingResourcesWithCompletionHandler: completionHandler];
  }
}

NAN_METHOD(NNSBundleResourceRequest::conditionallyBeginAccessingResourcesWithCompletionHandler) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(void-^-BOOL,resourcesAvailable, completionHandler);
    [self conditionallyBeginAccessingResourcesWithCompletionHandler: completionHandler];
  }
}

NAN_METHOD(NNSBundleResourceRequest::endAccessingResources) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    [self endAccessingResources];
  }
}
#endif

NAN_METHOD(NNSBundle::setPreservationPriorityForTags) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(double, priority);
    declare_pointer(NSSet/* <NSString*>*/, tags);
    [self setPreservationPriority: priority forTags: tags];
  }
}

NAN_METHOD(NNSBundle::preservationPriorityForTag) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, tag);
    JS_SET_RETURN(js_value_double([self preservationPriorityForTag: tag]));
  }
}

NAN_GETTER(NNSBundle::mainBundleGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSBundle([NSBundle mainBundle]));
  }
}

NAN_GETTER(NNSBundle::allBundlesGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSBundle*>([NSBundle allBundles]));
  }
}

NAN_GETTER(NNSBundle::allFrameworksGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSBundle*>([NSBundle allFrameworks]));
  }
}

NAN_GETTER(NNSBundle::isLoadedGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLoaded]));
  }
}

NAN_GETTER(NNSBundle::bundleURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self bundleURL]));
  }
}

NAN_GETTER(NNSBundle::resourceURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self resourceURL]));
  }
}

NAN_GETTER(NNSBundle::executableURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self executableURL]));
  }
}

NAN_GETTER(NNSBundle::privateFrameworksURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self privateFrameworksURL]));
  }
}

NAN_GETTER(NNSBundle::sharedFrameworksURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self sharedFrameworksURL]));
  }
}

NAN_GETTER(NNSBundle::sharedSupportURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self sharedSupportURL]));
  }
}

NAN_GETTER(NNSBundle::builtInPlugInsURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self builtInPlugInsURL]));
  }
}

NAN_GETTER(NNSBundle::appStoreReceiptURLGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self appStoreReceiptURL]));
  }
}

NAN_GETTER(NNSBundle::bundlePathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self bundlePath]));
  }
}

NAN_GETTER(NNSBundle::resourcePathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self resourcePath]));
  }
}

NAN_GETTER(NNSBundle::executablePathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self executablePath]));
  }
}

NAN_GETTER(NNSBundle::privateFrameworksPathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self privateFrameworksPath]));
  }
}

NAN_GETTER(NNSBundle::sharedFrameworksPathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self sharedFrameworksPath]));
  }
}

NAN_GETTER(NNSBundle::sharedSupportPathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self sharedSupportPath]));
  }
}

NAN_GETTER(NNSBundle::builtInPlugInsPathGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self builtInPlugInsPath]));
  }
}

NAN_GETTER(NNSBundle::bundleIdentifierGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self bundleIdentifier]));
  }
}

NAN_GETTER(NNSBundle::infoDictionaryGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self infoDictionary]));
  }
}

NAN_GETTER(NNSBundle::localizedInfoDictionaryGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self localizedInfoDictionary]));
  }
}

NAN_GETTER(NNSBundle::principalClassGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Class([self principalClass]));
  }
}

NAN_GETTER(NNSBundle::preferredLocalizationsGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self preferredLocalizations]));
  }
}

NAN_GETTER(NNSBundle::localizationsGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self localizations]));
  }
}

NAN_GETTER(NNSBundle::developmentLocalizationGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self developmentLocalization]));
  }
}

NAN_GETTER(NNSBundle::executableArchitecturesGetter) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self executableArchitectures]));
  }
}

#if TODO
NAN_GETTER(NNSBundleResourceRequest::loadingPriorityGetter) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self loadingPriority]));
  }
}

NAN_SETTER(NNSBundleResourceRequest::loadingPrioritySetter) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setLoadingPriority: input];
  }
}

NAN_GETTER(NNSBundleResourceRequest::tagsGetter) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet<NSString*>([self tags]));
  }
}

NAN_GETTER(NNSBundleResourceRequest::bundleGetter) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSBundle([self bundle]));
  }
}

NAN_GETTER(NNSBundleResourceRequest::progressGetter) {
  JS_UNWRAP(NSBundleResourceRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSProgress([self progress]));
  }
}
#endif

NAN_METHOD(NNSBundle::loadNibNamedOwnerOptions) {
  JS_UNWRAP(NSBundle, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_nullable_value(id, owner);
    declare_nullable_pointer(NSDictionary, options);
    JS_SET_RETURN(js_value_NSArray([self loadNibNamed:name owner:owner options:options]));
  }
}
