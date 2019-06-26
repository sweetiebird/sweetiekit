//
//  NSCNSceneSource.mm
//
//  Created by Shawn Presser on 6/25/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNSceneSource.h"

#define instancetype SCNSceneSource
#define js_value_instancetype js_value_SCNSceneSource

NSCNSceneSource::NSCNSceneSource() {}
NSCNSceneSource::~NSCNSceneSource() {}

#define JS_ASSIGN_ALIAS(newName, oldName) \
  exports->Set(JS_STR(#newName), JS_STR(#oldName))

JS_INIT_CLASS(SCNSceneSource, NSObject);
  JS_ASSIGN_STATIC_METHOD(sceneSourceWithURLOptions);
  JS_ASSIGN_STATIC_METHOD(sceneSourceWithDataOptions);
  JS_ASSIGN_PROTO_METHOD(initWithURLOptions);
  JS_ASSIGN_PROTO_METHOD(initWithDataOptions);
  JS_ASSIGN_PROTO_METHOD(sceneWithOptionsStatusHandler);
  JS_ASSIGN_PROTO_METHOD(sceneWithOptionsError);
  JS_ASSIGN_PROTO_METHOD(propertyForKey);
  JS_ASSIGN_PROTO_METHOD(entryWithIdentifierWithClass);
  JS_ASSIGN_PROTO_METHOD(identifiersOfEntriesWithClass);
  JS_ASSIGN_PROTO_METHOD(entriesPassingTest);
  JS_ASSIGN_PROTO_PROP_READONLY(url);
  JS_ASSIGN_PROTO_PROP_READONLY(data);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNSceneSource, NSObject);
  // constant values (exports)


  /*! @group Scene source properties */
  /*! File contributors. The values are dictionaries populated with keys documented in the "Contributor dictionary keys" group. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetContributorsKey, NSString);
  /*! When the file was created. The value is a NSDate instance. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetCreatedDateKey, NSString);
  /*! When the file was last modified. The value is a NSDate instance. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetModifiedDateKey, NSString);
  /*! The up axis of the file. If the file is oriented Y-up, for example, then this is the string \@"0.0 1.0 0.0" */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetUpAxisKey, NSString);
  /*! The unit used in the file. The value is a dictionary populated with keys documented in the "Unit dictionary keys" group. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetUnitKey, NSString);

  /*! @group Contributor dictionary keys */
  /*! Authoring tool used to create the file. The corresponding value is an NSString. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetAuthoringToolKey, NSString);
  /*! The file's author. The corresponding value is an NSString. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetAuthorKey, NSString);

  /*! @group Unit dictionary keys */
  /*! The name (NSString) of the unit */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetUnitNameKey, NSString);
  /*! A NSNumber encapsulating a floating-point value indicating how many meters the unit is. For example, if the name is \@"centimeter", then this will be 0.01. */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetUnitMeterKey, NSString);

  /*! @group Scene loading options */
  //typedef NSString * SCNSceneSourceLoadingOption NS_STRING_ENUM;

  /*! @constant SCNSceneSourceCreateNormalsIfAbsentKey
    @abstract Enable to try to guess acceptable normals for the vertices if none are given in the file
      @discussion Use this with a boolean value encapsulated in a NSNumber. The default value is NO.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceCreateNormalsIfAbsentKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceCheckConsistencyKey
   @abstract Pass YES in order to perform the document validation. 
   @discussion This option can be set in the options dictionary of the SCNScene and SCNSceneSource loading methods.
   The value for this option should be a boolean NSNumber. If its boolean value is YES (the default is NO),
   SceneKit will attempt to check the document for consistency.
   If the document doesn't pass the consistency check it is then not loaded and an error is returned.
   This is slower, but for security reasons it should be set to YES if you are not sure the files you load are valid and have not been tampered with. 
   */
  JS_ASSIGN_ENUM(SCNSceneSourceCheckConsistencyKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceFlattenSceneKey
   @abstract Pass YES to flatten the scene graph when possible.
   @discussion This option can be set in the options dictionary of the SCNScene and SCNSceneSource loading methods.
   The value for this option should be a boolean NSNumber. If its boolean value is YES (the default is NO),
   SceneKit will attempt to reduce the scene graph by merging the geometries.
   This option is suitable to preview a 3D scene efficiently and when manipulating the scene graph is not needed.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceFlattenSceneKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceUseSafeModeKey
   @abstract Pass YES in order to enable the safe mode.
   @discussion This option can be set in the options dictionary of the SCNScene and SCNSceneSource loading methods.
   The value for this option should be a boolean NSNumber. If its boolean value is YES (the default is NO),
   SceneKit will forbid network accesses, prevent the loading of resources from arbitrary directories, and will not execute
   any code present in the loaded files.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceUseSafeModeKey, SCNSceneSourceLoadingOption); // API_DEPRECATED("No longer supported", macos(10.8, 10.13), ios(8.0, 11.0), tvos(9.0, 11.0), watchos(3.0, 4.0));

  /*!
   @constant SCNSceneSourceAssetDirectoryURLsKey
   @abstract Pass an array of directory URLs where SceneKit should look for resources
   @discussion By default, SceneKit will look for the external resources it cannot find in the parent directory of the imported file.
   You can add additional directories by setting an array of URLs for this key when calling sceneWithOptions:error:.
   This is recommended if you want to construct your scene source from a data object, not from an URL,
   and need to load resources whose paths are not absolute.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAssetDirectoryURLsKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceOverrideAssetURLsKey
   @abstract Pass YES in order to override assets URLs with the directory URLs passed via SCNSceneSourceAssetDirectoryURLsKey.
   @discussion By default, SceneKit will look for the external resources using the paths/urls as described in the imported file.
   You can force SceneKit to only search for extern resources within the directories specified by the SCNSceneSourceAssetDirectoryURLsKey key.
   This can be useful to load a file and its resources from a specific bundle for instance.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceOverrideAssetURLsKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceStrictConformanceKey
   @abstract Pass YES to interpret the 3D format of the file in a strict way.
   @discussion This option defaults to NO. In this case SceneKit will try to read any additional metadata present in the file to
         enable additional features and make the rendering as close as possible to the original intent. If you pass YES,
               SceneKit will instead only consider features which are part of the file format specification.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceStrictConformanceKey, SCNSceneSourceLoadingOption);

  /*!
   @constant SCNSceneSourceConvertUnitsToMetersKey
   @abstract Pass the units you want the scene to be converted to (in meter).
   @discussion Use this with a floating value encapsulated in a NSNumber. The default value is nil which means no conversion done. Passing a non-zero value will convert the scene coordinates so that 1 unit corresponds to N meters. For example pass 0.01 for 1 unit == 1 centimeter, pass 0.3048 for 1 unit == 1 foot...
       For better physics simulation it is recommended to use 1 unit equals to 1 meter.
       This option has no effect for SCN files or if the asset is already compressed by Xcode (use the compression options instead).
   */
  JS_ASSIGN_ENUM(SCNSceneSourceConvertUnitsToMetersKey, SCNSceneSourceLoadingOption); // API_AVAILABLE(macos(10.10), ios(11.0), tvos(11.0), watchos(4.0));

  /*!
   @constant SCNSceneSourceConvertToYUpKey
   @abstract Pass YES if a scene should be converted to Y up if it currently has a different up axis.
   @discussion Use this with a boolean value encapsulated in a NSNumber. The default value is NO.
   This option has no effect for SCN files or if the asset is already compressed by Xcode (use the compression options instead).
   */
  JS_ASSIGN_ENUM(SCNSceneSourceConvertToYUpKey, SCNSceneSourceLoadingOption); // API_AVAILABLE(macos(10.10), ios(11.0), tvos(11.0), watchos(4.0));

  /*!
   @constant SCNSceneSourceAnimationImportPolicyKey
   @abstract Pass one of the value below to specify what to do with loaded animations.
   @discussion See below for the description of each individual key. Defaults to SCNSceneSourceAnimationImportPolicyPlayRepeatedly. On 10.9 and before the behavior is SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase. For compatibility reason if the application was built on 10.9 or before the default behavior is SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAnimationImportPolicyKey, SCNSceneSourceLoadingOption); // API_AVAILABLE(macos(10.10));

  /*!
   @constant SCNSceneSourceLoadingOptionPreserveOriginalTopology
   @abstract Pass YES to make SceneKit preserve the original topology instead of triangulating at load time.
   This can be useful to get better results when subdividing a geometry. Defaults to NO.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceLoadingOptionPreserveOriginalTopology, SCNSceneSourceLoadingOption); // API_AVAILABLE(macos(10.12), ios(10.0), tvos(10.0));

  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionCreateNormalsIfAbsent, SCNSceneSourceCreateNormalsIfAbsentKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionCheckConsistency, SCNSceneSourceCheckConsistencyKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionFlattenScene, SCNSceneSourceFlattenSceneKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionUseSafeMode, SCNSceneSourceUseSafeModeKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionAssetDirectoryURLs, SCNSceneSourceAssetDirectoryURLsKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionOverrideAssetURLs, SCNSceneSourceOverrideAssetURLsKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionStrictConformance, SCNSceneSourceStrictConformanceKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionConvertUnitsToMeters, SCNSceneSourceConvertUnitsToMetersKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionConvertToYUp, SCNSceneSourceConvertToYUpKey);
  JS_ASSIGN_ALIAS(SCNSceneSourceLoadingOptionAnimationImportPolicy, SCNSceneSourceAnimationImportPolicyKey);

  /* Values for SCNSceneSourceLoadingOptionAnimationImportPolicy */
  //typedef NSString * SCNSceneSourceAnimationImportPolicy NS_STRING_ENUM;

  /*!
   @constant SCNSceneSourceAnimationImportPolicyPlay
   @abstract Add animations to the scene and play them once (repeatCount set to 1).
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAnimationImportPolicyPlay, SCNSceneSourceAnimationImportPolicy); // API_AVAILABLE(macos(10.10));

  /*!
   @constant SCNSceneSourceAnimationImportPolicyPlayRepeatedly
   @abstract Add animations to the scene and play them repeatedly (repeatCount set to infinity).
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAnimationImportPolicyPlayRepeatedly, SCNSceneSourceAnimationImportPolicy); // API_AVAILABLE(macos(10.10));

  /*!
   @constant SCNSceneSourceAnimationImportPolicyDoNotPlay
   @abstract Only keep animations in the SCNSceneSource and don't add to the animatable elements of the scene.
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAnimationImportPolicyDoNotPlay, SCNSceneSourceAnimationImportPolicy); // API_AVAILABLE(macos(10.10));

  /*!
   @constant SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase
   @abstract Add animations to the scene and play them using the SCNView/SCNRenderer's scene time (usesSceneTimeBase set to YES)
   */
  JS_ASSIGN_ENUM(SCNSceneSourceAnimationImportPolicyPlayUsingSceneTimeBase, SCNSceneSourceAnimationImportPolicy); // API_AVAILABLE(macos(10.10));


  /*!
   @constant SCNDetailedErrorsKey
   @abstract Key to access the detailed validation errors.
   @discussion This key will be present in the user info dictionary of errors created by the various sceneWithOptions: methods.
               When present, the value associated with it is an array of detailed errors found by the consistency checker
               which represent consistency errors in the 3D file. Some metadata about these detailed errors is available
               in their user info dictionary using the other keys (SCNConsistency*) defined in this file.
   */

  //SCN_EXPORT NSString * const SCNDetailedErrorsKey;

  /*!
   @constant SCNConsistencyElementIDErrorKey
   @abstract For XML-based formats, the ID of the element where the error occurred.
   @discussion When the element does not have an ID, the ID of the closest parent element which has one is returned.
   */

  JS_ASSIGN_ENUM(SCNConsistencyElementIDErrorKey, NSString);

  /*!
   @constant SCNConsistencyElementTypeErrorKey
   @abstract For XML-based formats, the tag name of the element where the error occurred.
   */

  JS_ASSIGN_ENUM(SCNConsistencyElementTypeErrorKey, NSString);

  /*!
   @constant SCNConsistencyLineNumberErrorKey
   @abstract For text-based formats, the line number where an error occurred.
   */

  JS_ASSIGN_ENUM(SCNConsistencyLineNumberErrorKey, NSString);

  /*!
   @enum SCNConsistencyErrorCode
   @abstract Error codes returned by the consistency checker
   @discussion Each of the detailed errors found in the master error's SCNDetailedErrorsKey, when present, will have an error
               code in this enumeration and some additional metadata associated with the SCNConsistency* keys.
   */
  //enum {
    JS_ASSIGN_ENUM(SCNConsistencyInvalidURIError, NSInteger); // = 1000,
    JS_ASSIGN_ENUM(SCNConsistencyInvalidCountError, NSInteger);
    JS_ASSIGN_ENUM(SCNConsistencyInvalidArgumentError, NSInteger);
    JS_ASSIGN_ENUM(SCNConsistencyMissingElementError, NSInteger);
    JS_ASSIGN_ENUM(SCNConsistencyMissingAttributeError, NSInteger);
    JS_ASSIGN_ENUM(SCNConsistencyXMLSchemaValidationError, NSInteger);
  //};

  /*!
   @enum SCNSceneSourceStatus
   @abstract Represents a phase of the loading process.
   @discussion Each of these constants (except SCNSceneSourceStatusError) represents a phase of the loading process. "Parsing" means that the document is being deserialized, "validating" that it's being checked for consistency, "processing" that the resulting object is being loaded. New values might be added to this enumeration to make it more detailed; however the values will always be ordered in the same order as the corresponding phases are executed.
   */
  //typedef NS_ENUM(NSInteger, SCNSceneSourceStatus) {
    JS_ASSIGN_ENUM(SCNSceneSourceStatusError, NSInteger); //      = -1,
    JS_ASSIGN_ENUM(SCNSceneSourceStatusParsing, NSInteger); //    = 4,
    JS_ASSIGN_ENUM(SCNSceneSourceStatusValidating, NSInteger); // = 8,
    JS_ASSIGN_ENUM(SCNSceneSourceStatusProcessing, NSInteger); // = 12,
    JS_ASSIGN_ENUM(SCNSceneSourceStatusComplete, NSInteger); //   = 16
  //};

JS_INIT_CLASS_END(SCNSceneSource, NSObject);

NAN_METHOD(NSCNSceneSource::New) {
  JS_RECONSTRUCT(SCNSceneSource);
  @autoreleasepool {
    SCNSceneSource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNSceneSource *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNSceneSource alloc] init];
    }
    if (self) {
      NSCNSceneSource *wrapper = new NSCNSceneSource();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNSceneSource::New: invalid arguments");
    }
  }
}

#include "NNSURL.h"

NAN_METHOD(NSCNSceneSource::sceneSourceWithURLOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([SCNSceneSource sceneSourceWithURL: url options: options]));
  }
}

NAN_METHOD(NSCNSceneSource::sceneSourceWithDataOptions) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([SCNSceneSource sceneSourceWithData: data options: options]));
  }
}

NAN_METHOD(NSCNSceneSource::initWithURLOptions) {
  JS_UNWRAP_OR_ALLOC(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: url options: options]));
  }
}

NAN_METHOD(NSCNSceneSource::initWithDataOptions) {
  JS_UNWRAP_OR_ALLOC(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithData: data options: options]));
  }
}

#include "NSCNScene.h"
#include "NNSError.h"

NAN_METHOD(NSCNSceneSource::sceneWithOptionsStatusHandler) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    declare_callback(statusHandler);
    JS_SET_RETURN(js_value_SCNScene([self sceneWithOptions: options statusHandler:^(float totalProgress, SCNSceneSourceStatus status, NSError * _Nullable error, BOOL * _Nonnull stop) {
      dispatch_main(^{
        if (statusHandler) {
          [statusHandler jsFunction]->Call("NSCNSceneSource::sceneWithOptionsStatusHandler",
            js_value_float(totalProgress),
            js_value_SCNSceneSourceStatus(status),
            js_value_NSError(error)); // TODO: also pass a 'stop' function
        }
      });
    }]));
  }
}

NAN_METHOD(NSCNSceneSource::sceneWithOptionsError) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSDictionary/* <SCNSceneSourceLoadingOption, id>*/, options);
    declare_error();
    JS_SET_RETURN(js_value_SCNScene([self sceneWithOptions: options error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NSCNSceneSource::propertyForKey) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_id([self propertyForKey: key]));
  }
}

NAN_METHOD(NSCNSceneSource::entryWithIdentifierWithClass) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, uid);
    declare_value(id/* Class*/, entryClass);
    JS_SET_RETURN(js_value_id([self entryWithIdentifier: uid withClass: entryClass]));
  }
}

NAN_METHOD(NSCNSceneSource::identifiersOfEntriesWithClass) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id/* Class*/, entryClass);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self identifiersOfEntriesWithClass: entryClass]));
  }
}

NAN_METHOD(NSCNSceneSource::entriesPassingTest) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(predicate);
    JS_SET_RETURN(js_value_NSArray<id>([self entriesPassingTest:^BOOL(id  _Nonnull entry, NSString * _Nonnull identifier, BOOL * _Nonnull stop) {
      __block BOOL result = YES;
      dispatch_main(^{
        if (predicate) {
          Local<Value> JS_RESULT([predicate jsFunction]->Call("NSCNSceneSource::entriesPassingTest",
            js_value_id(entry),
            js_value_NSString(identifier))); // TODO: also pass a 'stop' function
          result = is_value_BOOL(JS_RESULT) ? to_value_BOOL(JS_RESULT) : result;
        }
      });
      return result;
    }]));
  }
}

NAN_GETTER(NSCNSceneSource::urlGetter) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self url]));
  }
}

NAN_GETTER(NSCNSceneSource::dataGetter) {
  JS_UNWRAP(SCNSceneSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

