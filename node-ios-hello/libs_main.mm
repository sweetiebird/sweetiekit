//
//  libs_main.mm
//  node-ios-hello
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NNSObject.h"
#include "NNSUserDefaults.h"
#include "NNSMutableParagraphStyle.h"
#include "NNSParagraphStyle.h"
#include "NNSAttributedString.h"
#include "NNSMutableAttributedString.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIViewController.h"
#include "NUIView.h"
#include "NUINib.h"
#include "NUIRefreshControl.h"
#include "NUISwitch.h"
#include "NUIControl.h"
#include "NUIStoryboard.h"
#include "NUIButton.h"
#include "NUITabBarController.h"
#include "NUITabBarItem.h"
#include "NUITabBar.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUILabel.h"
#include "NUIFont.h"
#include "NUISlider.h"
#include "NUITextField.h"
#include "NUINavigationController.h"
#include "NUINavigationBar.h"
#include "NUINavigationItem.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUITableViewController.h"
#include "NUIPresentationController.h"
#include "NUIPopoverPresentationControllerDelegate.h"
#include "NUIPopoverPresentationController.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"
#include "NUITableViewDataSource.h"
#include "NUITouch.h"
#include "NUICollectionReusableView.h"
#include "NUICollectionView.h"
#include "NUICollectionViewController.h"
#include "NUIAlertController.h"
#include "NUIAlertAction.h"
#include "NUICollectionViewCell.h"
#include "NUICollectionViewManager.h"
#include "NUIPageControl.h"
#include "NUIProgressView.h"
#include "NCALayer.h"
#include "NCAEmitterLayer.h"
#include "NCAEmitterCell.h"
#include "NCABasicAnimation.h"
#include "NCAShapeLayer.h"
#include "NUIScrollView.h"
#include "NUIScrollViewDelegate.h"
#include "NUIStackView.h"
#include "NNSLayoutAnchor.h"
#include "NNSLayoutConstraint.h"
#include "NUITableViewManager.h"
#include "NUIPickerView.h"
#include "NUIPickerViewManager.h"
#include "NUIBarButtonItem.h"
#include "NSKView.h"
#include "NARSKView.h"
#include "NSKNode.h"
#include "NSKLabelNode.h"
#include "NARSKViewDelegate.h"
#include "NARSession.h"
#include "NARSCNView.h"
#include "NARSCNViewDelegate.h"
#include "NNSBundle.h"
#include "NAVAudioPlayer.h"
#include "NARLightEstimate.h"
#include "NARConfiguration.h"
#include "NARWorldTrackingConfiguration.h"
#include "NARAnchor.h"
#include "NARCamera.h"
#include "NARFrame.h"
#include "NSCNView.h"
#include "NSCNNode.h"
#include "NSCNScene.h"
#include "NSCNLight.h"
#include "NSCNGeometry.h"
#include "NSCNText.h"
#include "NSKScene.h"
#include "NSKSpriteNode.h"
#include "NSKTexture.h"
#include "NSKPhysicsBody.h"
#include "NSKPhysicsWorld.h"
#include "NSKPhysicsContactDelegate.h"
#include "NSKPhysicsContact.h"
#include "NSKPhysicsWorld.h"
#include "NSKAction.h"
#include "NSKCameraNode.h"
#include "NCLLocationManager.h"
#include "NCLLocationManagerDelegate.h"
#include "NCLLocation.h"
#include "NCLGeocoder.h"
#include "NCLPlacemark.h"
#include "NCLHeading.h"
#include "NMKMapView.h"
#include "NMKAnnotationView.h"
#include "NMKMapViewDelegate.h"
#include "NGif.h"
#include "NGifView.h"
#include "NGifManager.h"
#include "NUIKitGlobals.h"
#include "NCoreGraphicsGlobals.h"
#include <unistd.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"
#include "main.h"

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#import "libs_main.hpp"

extern "C" void iOSLog(const char* format, ...);

namespace node {
    extern std::map<std::string, std::pair<void *, bool>> dlibs;
}
using namespace v8;


#include <array>
#include <deque>
#include <mutex>
#include <thread>


namespace sweetiekit {
  uv_sem_t resSem;
  uv_sem_t reqSem;
  uv_async_t resAsync;
  std::mutex reqMutex;
  std::mutex resMutex;
  std::deque<std::function<void()>> reqCbs;
  std::deque<std::function<void()>> resCbs;
  std::thread reqThead;

  void RunResInMainThread(uv_async_t *handle) {
    Nan::HandleScope scope;

    std::function<void()> resCb;
    {
      std::lock_guard<std::mutex> lock(reqMutex);

      resCb = resCbs.front();
      resCbs.pop_front();
    }
    if (resCb) {
      resCb();
    }
  }
  
  Local<Value> CallSync(Local<Function> callback, const char* methodName, int argc, Local<Value>* argv)
  {
    Isolate* isolate = callback->GetIsolate();
    Nan::EscapableHandleScope handleScope;
    MicrotasksScope enableMicrotasks(isolate, MicrotasksScope::kRunMicrotasks);
    TryCatchReport reportErrors;
    GetMainThreadMultiIsolatePlatform()->DrainTasks(isolate);
    Local<Value> result;
    if (!callback.IsEmpty()) {
      Local<Object> asyncObject = Nan::New<Object>();
      AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
      auto res = asyncResource.MakeCallback(callback, argc, argv);
      Kick();
      if (res.ToLocal(&result)) {
        if (result->IsPromise()) {
          Local<Promise> promise = result.As<Promise>();
#if 1
          if (!promise->HasHandler()) {
            promise->Then(JS_CONTEXT(),
            (v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
              int argc = info.Length();
              argc = argc;
            }).ToLocalChecked())).ToLocalChecked()->Catch(JS_CONTEXT(),
            (v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
              int argc = info.Length();
              argc = argc;
            }).ToLocalChecked()));
          }
          while (promise->HasHandler() && (promise->State() == Promise::kPending)) {
            //Isolate::GetCurrent()->RunMicrotasks();
            sweetiekit::nodeTick();
          }
#else
          if (promise->State() == Promise::kPending) {
            Nan::ThrowError("Unresolved promise");
          }
#endif
          if (promise->State() == Promise::kRejected) {
            Nan::ThrowError(promise->Result());
          } else {
            result = promise->Result();
          }
        }
      }
    }
    return handleScope.Escape(result);
  }
  
  void Resolve(Nan::Persistent<Function>* cb, bool shouldDelete) {
#if SYNC
    {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([cb, shouldDelete]() -> void {
          if (cb != nullptr)
          {
            Local<Function> callback = Nan::New(*cb);
            if (!callback.IsEmpty()) {
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
              asyncResource.MakeCallback(callback, 0, nullptr);
            }
            if (shouldDelete) {
              delete cb;
            }
          }
      });
    }
    uv_async_send(&sweetiekit::resAsync);
#else
    Nan::HandleScope scope;
    if (cb != nullptr)
    {
      Local<Function> callback = Nan::New(*cb);
      sweetiekit::CallSync(callback, "sweetiekit::Resolve", 0, nullptr);
    }
    if (shouldDelete) {
      delete cb;
    }
#endif
  }
  
  void CallAsync(Nan::Global<Function>& cb, const char* methodName) {
#if SYNC
    {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([&cb, &methodName]() -> void {
          if (!cb.IsEmpty())
          {
            Local<Function> callback = Nan::New(cb);
            if (!callback.IsEmpty()) {
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, methodName);
              asyncResource.MakeCallback(callback, 0, nullptr);
            }
          }
      });
    }
    uv_async_send(&sweetiekit::resAsync);
#else
    if (!cb.IsEmpty())
    {
      Local<Function> callback = Nan::New(cb);
      if (!callback.IsEmpty()) {
        Local<Object> asyncObject = Nan::New<Object>();
        AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, methodName);
        asyncResource.MakeCallback(callback, 0, nullptr);
      }
    }
#endif
  }
  
  Nan::Callback tickKicker;
  
  void Kick() {
    tickKicker();
  }
};


namespace sweetiekit {
void InitExports(Local<Object> exports) {
  iOSLog("InitExports\n");
      
  tickKicker.SetFunction(v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
}).ToLocalChecked());

  
  uv_sem_init(&sweetiekit::resSem, 0);
  uv_sem_init(&sweetiekit::reqSem, 0);
  uv_async_init(uv_default_loop(), &sweetiekit::resAsync, sweetiekit::RunResInMainThread);
  sweetiekit::reqThead = std::thread([]() -> void {
    for (;;) {
      uv_sem_wait(&sweetiekit::reqSem);

      std::function<void()> reqCb;
      {
        std::lock_guard<std::mutex> lock(sweetiekit::reqMutex);

        if (sweetiekit::reqCbs.size() > 0) {
          reqCb = sweetiekit::reqCbs.front();
          sweetiekit::reqCbs.pop_front();
        }
      }
      if (reqCb) {
        reqCb();
      } else {
        break;
      }
    }
  });


  
        auto N_NSObject = NNSObject::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSObject").ToLocalChecked(), N_NSObject.first);
  
        auto N_NSBundle = NNSBundle::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSBundle").ToLocalChecked(), N_NSBundle.first);
  
         auto N_AVAudioPlayer = NAVAudioPlayer::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("AVAudioPlayer").ToLocalChecked(), N_AVAudioPlayer.first);

        auto N_NSUserDefaults = NNSUserDefaults::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSUserDefaults").ToLocalChecked(), N_NSUserDefaults.first);

        auto N_NSLayoutAnchor = NNSLayoutAnchor::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSLayoutAnchor").ToLocalChecked(), N_NSLayoutAnchor.first);

        auto N_NSLayoutConstraint = NNSLayoutConstraint::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSLayoutConstraint").ToLocalChecked(), N_NSLayoutConstraint.first);

        auto N_UIBarButtonItem = NUIBarButtonItem::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIBarButtonItem").ToLocalChecked(), N_UIBarButtonItem.first);
  
        auto N_UITabBarItem = NUITabBarItem::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBarItem").ToLocalChecked(), N_UITabBarItem.first);

        auto N_UIAlertAction = NUIAlertAction::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIAlertAction").ToLocalChecked(), N_UIAlertAction.first);
  
        auto N_NSParagraphStyle = NNSParagraphStyle::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSParagraphStyle").ToLocalChecked(), N_NSParagraphStyle.first);
  
        auto N_NSMutableParagraphStyle = NNSMutableParagraphStyle::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSMutableParagraphStyle").ToLocalChecked(), N_NSMutableParagraphStyle.first);
  
        auto N_NSAttributedString = NNSAttributedString::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSAttributedString").ToLocalChecked(), N_NSAttributedString.first);
  
        auto N_NSMutableAttributedString = NNSMutableAttributedString::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSMutableAttributedString").ToLocalChecked(), N_NSMutableAttributedString.first);

        // Core Location
  
        auto N_CLHeading = NCLHeading::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLHeading").ToLocalChecked(), N_CLHeading.first);
  
        auto N_CLLocation = NCLLocation::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLLocation").ToLocalChecked(), N_CLLocation.first);

        auto N_CLLocationManager = NCLLocationManager::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLLocationManager").ToLocalChecked(), N_CLLocationManager.first);
  
        auto N_CLLocationManagerDelegate = NCLLocationManagerDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLLocationManagerDelegate").ToLocalChecked(), N_CLLocationManagerDelegate.first);

        auto N_CLGeocoder = NCLGeocoder::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLGeocoder").ToLocalChecked(), N_CLGeocoder.first);

        auto N_CLPlacemark = NCLPlacemark::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CLPlacemark").ToLocalChecked(), N_CLPlacemark.first);

        // UIKit
  
        auto N_UIApplication = NUIApplication::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIApplication").ToLocalChecked(), N_UIApplication.first);
  
        auto N_UIWindow = NUIWindow::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIWindow").ToLocalChecked(), N_UIWindow.first);
  
        auto N_UIResponder = NUIResponder::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIResponder").ToLocalChecked(), N_UIResponder.first);
  
        auto N_UIViewController = NUIViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), N_UIViewController.first);
  
        auto N_UITabBarController = NUITabBarController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBarController").ToLocalChecked(), N_UITabBarController.first);

        auto N_UITableViewController = NUITableViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewController").ToLocalChecked(), N_UITableViewController.first);

        auto N_UICollectionViewController = NUICollectionViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UICollectionViewController").ToLocalChecked(), N_UICollectionViewController.first);

        auto N_UINavigationController = NUINavigationController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINavigationController").ToLocalChecked(), N_UINavigationController.first);

        auto N_UIImagePickerController = NUIImagePickerController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImagePickerController").ToLocalChecked(), N_UIImagePickerController.first);

        auto N_UIPresentationController = NUIPresentationController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPresentationController").ToLocalChecked(), N_UIPresentationController.first);

        auto N_UIPopoverPresentationController = NUIPopoverPresentationController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPopoverPresentationController").ToLocalChecked(), N_UIPopoverPresentationController.first);

        auto N_UIAlertController = NUIAlertController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIAlertController").ToLocalChecked(), N_UIAlertController.first);

        auto N_UIView = NUIView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIView").ToLocalChecked(), N_UIView.first);
  
        auto N_UICollectionReusableView = NUICollectionReusableView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UICollectionReusableView").ToLocalChecked(), N_UICollectionReusableView.first);

        auto N_UIControl = NUIControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIControl").ToLocalChecked(), N_UIControl.first);

        auto N_UISlider = NUISlider::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UISlider").ToLocalChecked(), N_UISlider.first);

        auto N_UIRefreshControl = NUIRefreshControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIRefreshControl").ToLocalChecked(), N_UIRefreshControl.first);

        auto N_UISwitch = NUISwitch::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UISwitch").ToLocalChecked(), N_UISwitch.first);

        auto N_UIStoryboard = NUIStoryboard::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), N_UIStoryboard.first);
  
        auto N_UIButton = NUIButton::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIButton").ToLocalChecked(), N_UIButton.first);
  
        auto N_UITextField = NUITextField::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITextField").ToLocalChecked(), N_UITextField.first);
  
        auto N_UIImage = NUIImage::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImage").ToLocalChecked(), N_UIImage.first);
  
        auto N_UIImageView = NUIImageView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImageView").ToLocalChecked(), N_UIImageView.first);
  
        auto N_UIFont = NUIFont::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIFont").ToLocalChecked(), N_UIFont.first);

        auto N_UILabel = NUILabel::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UILabel").ToLocalChecked(), N_UILabel.first);

        auto N_UITableViewCell = NUITableViewCell::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewCell").ToLocalChecked(), N_UITableViewCell.first);

        auto N_UIScrollView = NUIScrollView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIScrollView").ToLocalChecked(), N_UIScrollView.first);
        
        auto N_UITableView = NUITableView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableView").ToLocalChecked(), N_UITableView.first);

        auto N_UICollectionView = NUICollectionView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UICollectionView").ToLocalChecked(), N_UICollectionView.first);

        auto N_UICollectionViewCell = NUICollectionViewCell::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UICollectionViewCell").ToLocalChecked(), N_UICollectionViewCell.first);

        auto N_UITableViewManager = NUITableViewManager::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewManager").ToLocalChecked(), N_UITableViewManager.first);

        auto N_UICollectionViewManager = NUICollectionViewManager::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UICollectionViewManager").ToLocalChecked(), N_UICollectionViewManager.first);

        auto N_UINib = NUINib::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINib").ToLocalChecked(), N_UINib.first);

        auto N_UITouch = NUITouch::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITouch").ToLocalChecked(), N_UITouch.first);

        auto N_UIPageControl = NUIPageControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPageControl").ToLocalChecked(), N_UIPageControl.first);
  
        auto N_UIPickerView = NUIPickerView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPickerView").ToLocalChecked(), N_UIPickerView.first);
  
        auto N_UIProgressView = NUIProgressView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIProgressView").ToLocalChecked(), N_UIProgressView.first);

        auto N_UITabBar = NUITabBar::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBar").ToLocalChecked(), N_UITabBar.first);
  
        auto N_UIStackView = NUIStackView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIStackView").ToLocalChecked(), N_UIStackView.first);

        // UIKit delegates ========
  
        auto N_UIPopoverPresentationControllerDelegate = NUIPopoverPresentationControllerDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPopoverPresentationControllerDelegate").ToLocalChecked(), N_UIPopoverPresentationControllerDelegate.first);

        auto N_UIPickerViewManager = NUIPickerViewManager::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIPickerViewManager").ToLocalChecked(), N_UIPickerViewManager.first);

        auto N_UIScrollViewDelegate = NUIScrollViewDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIScrollViewDelegate").ToLocalChecked(), N_UIScrollViewDelegate.first);

        auto N_UIImagePickerControllerDelegate = NUIImagePickerControllerDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImagePickerControllerDelegate").ToLocalChecked(), N_UIImagePickerControllerDelegate.first);

        auto N_UITableViewDataSource = NUITableViewDataSource::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewDataSource").ToLocalChecked(), N_UITableViewDataSource.first);

        auto N_UIViewControllerTransitioningDelegate = NUIViewControllerTransitioningDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIViewControllerTransitioningDelegate").ToLocalChecked(), N_UIViewControllerTransitioningDelegate.first);
  
        auto N_UINavigationBar = NUINavigationBar::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINavigationBar").ToLocalChecked(), N_UINavigationBar.first);

        auto N_UINavigationItem = NUINavigationItem::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINavigationItem").ToLocalChecked(), N_UINavigationItem.first);

        // UIKit Custom

        auto N_GifManager = NGifManager::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("GifManager").ToLocalChecked(), N_GifManager.first);
  
        auto N_Gif = NGif::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("Gif").ToLocalChecked(), N_Gif.first);
  
        auto N_GifView = NGifView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("GifView").ToLocalChecked(), N_GifView.first);

        // CoreAnimation
  
        auto N_CALayer = NCALayer::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CALayer").ToLocalChecked(), N_CALayer.first);
  
        auto N_CAShapeLayer = NCAShapeLayer::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CAShapeLayer").ToLocalChecked(), N_CAShapeLayer.first);

        auto N_CABasicAnimation = NCABasicAnimation::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CABasicAnimation").ToLocalChecked(), N_CABasicAnimation.first);
  
         auto N_CAEmitterCell = NCAEmitterCell::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CAEmitterCell").ToLocalChecked(), N_CAEmitterCell.first);

        auto N_CAEmitterLayer = NCAEmitterLayer::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CAEmitterLayer").ToLocalChecked(), N_CAEmitterLayer.first);
        
  
        // SpriteKit

        auto N_SKPhysicsContact = NSKPhysicsContact::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKPhysicsContact").ToLocalChecked(), N_SKPhysicsContact.first);

        auto N_SKView = NSKView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKView").ToLocalChecked(), N_SKView.first);
  
        auto N_SKPhysicsBody = NSKPhysicsBody::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKPhysicsBody").ToLocalChecked(), N_SKPhysicsBody.first);

        auto N_SKNode = NSKNode::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKNode").ToLocalChecked(), N_SKNode.first);
  
        auto N_SKSpriteNode = NSKSpriteNode::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKSpriteNode").ToLocalChecked(), N_SKSpriteNode.first);
  
        auto N_SKLabelNode = NSKLabelNode::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKLabelNode").ToLocalChecked(), N_SKLabelNode.first);

        auto N_SKCameraNode = NSKCameraNode::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKCameraNode").ToLocalChecked(), N_SKCameraNode.first);

        auto N_SKScene = NSKScene::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKScene").ToLocalChecked(), N_SKScene.first);
  
        auto N_SKAction = NSKAction::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKAction").ToLocalChecked(), N_SKAction.first);
  
        auto N_SKTexture = NSKTexture::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKTexture").ToLocalChecked(), N_SKTexture.first);

        auto N_SKPhysicsWorld = NSKPhysicsWorld::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKPhysicsWorld").ToLocalChecked(), N_SKPhysicsWorld.first);
  
        auto N_SKPhysicsContactDelegate = NSKPhysicsContactDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SKPhysicsContactDelegate").ToLocalChecked(), N_SKPhysicsContactDelegate.first);

        // ARKit
  
        auto N_ARLightEstimate = NARLightEstimate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARLightEstimate").ToLocalChecked(), N_ARLightEstimate.first);

        auto N_ARSKView = NARSKView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARSKView").ToLocalChecked(), N_ARSKView.first);

        auto N_ARSession = NARSession::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARSession").ToLocalChecked(), N_ARSession.first);
  
        auto N_ARConfiguration = NARConfiguration::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARConfiguration").ToLocalChecked(), N_ARConfiguration.first);

        auto N_ARWorldTrackingConfiguration = NARWorldTrackingConfiguration::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARWorldTrackingConfiguration").ToLocalChecked(), N_ARWorldTrackingConfiguration.first);

        auto N_ARCamera = NARCamera::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARCamera").ToLocalChecked(), N_ARCamera.first);

        auto N_ARFrame = NARFrame::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARFrame").ToLocalChecked(), N_ARFrame.first);

        auto N_ARAnchor = NARAnchor::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARAnchor").ToLocalChecked(), N_ARAnchor.first);

        auto N_ARSKViewDelegate = NARSKViewDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARSKViewDelegate").ToLocalChecked(), N_ARSKViewDelegate.first);
  
        auto N_ARSCNViewDelegate = NARSCNViewDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARSCNViewDelegate").ToLocalChecked(), N_ARSCNViewDelegate.first);
  
        // SceneKit

        auto N_SCNGeometry = NSCNGeometry::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNGeometry").ToLocalChecked(), N_SCNGeometry.first);

        auto N_SCNText = NSCNText::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNText").ToLocalChecked(), N_SCNText.first);

        auto N_SCNNode = NSCNNode::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNNode").ToLocalChecked(), N_SCNNode.first);

        auto N_SCNScene = NSCNScene::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNScene").ToLocalChecked(), N_SCNScene.first);

        auto N_SCNView = NSCNView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNView").ToLocalChecked(), N_SCNView.first);

        auto N_ARSCNView = NARSCNView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("ARSCNView").ToLocalChecked(), N_ARSCNView.first);

        auto N_SCNLight = NSCNLight::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("SCNLight").ToLocalChecked(), N_SCNLight.first);

        // MapKit
  
        auto N_MKMapView = NMKMapView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("MKMapView").ToLocalChecked(), N_MKMapView.first);

        auto N_MNAnnotationView = NMKAnnotationView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("MNAnnotationView").ToLocalChecked(), N_MNAnnotationView.first);

        auto N_MKMapViewDelegate = NMKMapViewDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("MKMapViewDelegate").ToLocalChecked(), N_MKMapViewDelegate.first);
  
        // misc
  
        auto N_CoreGraphicsGlobals = NCoreGraphicsGlobals::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CoreGraphics").ToLocalChecked(), N_CoreGraphicsGlobals.first);
  
        auto N_UIKitGlobals = NUIKitGlobals::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIKit").ToLocalChecked(), N_UIKitGlobals.first);

        uintptr_t initFunctionAddress = (uintptr_t)InitExports;
        Local<Array> initFunctionAddressArray = Nan::New<Array>(2);
        initFunctionAddressArray->Set(0, Nan::New<Integer>((uint32_t)(initFunctionAddress >> 32)));
        initFunctionAddressArray->Set(1, Nan::New<Integer>((uint32_t)(initFunctionAddress & 0xFFFFFFFF)));
        exports->Set(Nan::New("initFunctionAddress").ToLocalChecked(), initFunctionAddressArray);
        Nan::SetMethod(exports, "UIApplicationMain", NUIApplication::Main);
        
        iOSLog("initialized!\n");
    }
    
    void Init(Local<Object> exports) {
        InitExports(exports);
    }
}

extern "C" {
    void node_register_module_sweetiekit(Local<Object> exports, Local<Value> module, Local<Context> context) {
        sweetiekit::Init(exports);
    }
}

inline void registerDlibs(std::map<std::string, std::pair<void *, bool>> &dlibs) {
    dlibs["std:sweetiekit.node"] = std::pair<void *, bool>((void *)&node_register_module_sweetiekit, false);
}

extern "C" void registerNodeDLibs() {
    registerDlibs(node::dlibs);
}

extern "C" void UIKit_PumpEvents() {
  const CFTimeInterval seconds = 0.000002;
  SInt32 result;
  do {
    result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds, TRUE);
  } while (result == kCFRunLoopRunHandledSource);
  
  do {
    result = CFRunLoopRunInMode((CFStringRef)UITrackingRunLoopMode, seconds, TRUE);
  } while (result == kCFRunLoopRunHandledSource);
}


void UIKit_PumpQuick(CFTimeInterval seconds = 0.000002, bool returnAfterHandled = FALSE) {
  if (![NSThread isMainThread]) {
    CFRunLoopWakeUp(CFRunLoopGetMain());
  } else {
    SInt32 result;
    do {
      result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds/2, returnAfterHandled);
    } while (result == kCFRunLoopRunHandledSource);
    
    do {
      result = CFRunLoopRunInMode((CFStringRef)UITrackingRunLoopMode, seconds/2, returnAfterHandled);
    } while (result == kCFRunLoopRunHandledSource);
  }
}


#define HAVE_KQUEUE 1

#if defined(HAVE_KQUEUE) || defined(HAVE_EPOLL)

#if defined(HAVE_KQUEUE)
# include <sys/types.h>
# include <sys/event.h>
# include <sys/time.h>
#endif

#if defined(HAVE_EPOLL)
# include <sys/epoll.h>
#endif

#endif

static uv_thread_t embed_thread;
static uv_sem_t embed_sem;
static uv_timer_t embed_timer;
static uv_async_t embed_async;
static volatile int embed_closed;

static int embed_timer_called;

namespace sweetiekit {

  void nodePump(Isolate* isolate) {
    TryCatchReport tryCatch;
    {
      MicrotasksScope microScope(isolate, MicrotasksScope::kRunMicrotasks);

      GetMainThreadMultiIsolatePlatform()->DrainTasks(isolate);
      uv_run(uv_default_loop(), UV_RUN_NOWAIT);
      isolate->RunMicrotasks();
    }
  }
  
  Isolate* nodeIsolate;
  
  uint64_t nodeTick() {
    auto start = uv_hrtime();
#if 1
    dispatch_sync(dispatch_get_main_queue(), ^{
      if (nodeIsolate) {
        Isolate* isolate = nodeIsolate;
        nodeIsolate = nullptr;
        isolate->Enter();
      }
      Isolate* isolate = Isolate::GetCurrent();
      //Isolate* isolate = nodeIsolate;
      Local<Context> context = isolate->GetCurrentContext();
      v8::Locker locker(isolate);
      v8::Isolate::Scope isolateScope(isolate);
      Nan::HandleScope handleScope;
      nodePump(isolate);
    });
#else
    CFRunLoopWakeUp(CFRunLoopGetMain());
#endif
    auto now = uv_hrtime();
    auto elapsed = now - start;
    return elapsed;
  }
}

static void embed_thread_runner(void* arg) {
  int r;
  int fd;
  int timeout;

  while (!embed_closed) {
    fd = uv_backend_fd(uv_default_loop());
    timeout = uv_backend_timeout(uv_default_loop());
    timeout = 1000;

    do {
#if defined(HAVE_KQUEUE)
      struct timespec ts;
      ts.tv_sec = timeout / 1000;
      ts.tv_nsec = (timeout % 1000) * 1000000;
      r = kevent(fd, NULL, 0, NULL, 0, &ts);
      //r = kevent(fd, NULL, 0, NULL, 0, NULL);
#elif defined(HAVE_EPOLL)
      {
        struct epoll_event ev;
        r = epoll_wait(fd, &ev, 1, timeout);
      }
#endif
    } while (r == -1 && errno == EINTR);
    auto elapsed = sweetiekit::nodeTick();
    
    if (elapsed < 0.005*NSEC_PER_SEC) {
      usleep((0.005*NSEC_PER_SEC - elapsed) / 1000);
    }
  }
}


static void embed_cb(uv_async_t* async) {
  uv_run(uv_default_loop(), UV_RUN_ONCE);

  uv_sem_post(&embed_sem);
}

extern "C" void embed_start() {
  //uv_loop_t external;

  //assert(0 == uv_loop_init(&external));

  embed_timer_called = 0;
  embed_closed = 0;

  //uv_async_init(&external, &embed_async, embed_cb);

  /* Start timer in default loop */
  //uv_timer_init(uv_default_loop(), &embed_timer);
  //uv_timer_start(&embed_timer, embed_timer_cb, 250, 0);

  /* Start worker that will interrupt external loop */
  uv_sem_init(&embed_sem, 0);
  uv_thread_create(&embed_thread, embed_thread_runner, NULL);


}


extern "C" void hello_node(const char* args);

//int main(int argc, char** argv)
//{
//#if 1
//    registerNodeDLibs();
//    chdir(getenv("HOME"));
//    chdir("Documents");
//
//    NSString* entry = [ScriptGetter GetWithName:@"demo"];
//    if (entry == nullptr) {
//      __builtin_trap();
//    }
//    auto args = [NSString stringWithFormat:@"node\0--jitless\0--builtins-in-stack-traces\0--abort-on-uncaught-exception\0%@\0\0", entry];
//    fprintf(stderr, "%s\n", [entry UTF8String]);
//    fprintf(stderr, "%s\n", [args UTF8String]);
//    hello_node([args UTF8String]);
//
//#else
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
//#endif
//}
