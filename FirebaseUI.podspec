Pod::Spec.new do |s|
  s.name         = "FirebaseUI"
  s.version      = "0.3.1"
  s.summary      = "UI binding libraries for Firebase."
  s.homepage     = "https://github.com/firebase/FirebaseUI-iOS"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Firebase" => "support@firebase.com" }
  s.social_media_url = "https://twitter.com/firebase"
  s.source       = { :git => "https://github.com/firebase/FirebaseUI-iOS.git", :tag => 'v0.3.1' }
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.dependency "Firebase", "~>2.5"
  s.ios.framework = "UIKit"
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Firebase"' }
  s.requires_arc = true

  s.subspec 'Core' do |core|
    core.source_files = "FirebaseUI/{Core,Util}/**/*.{h,m}"
  end

s.subspec 'Auth' do |auth|
    auth.dependency "FirebaseUI/Facebook"
    auth.dependency "FirebaseUI/Google"
    auth.dependency "FirebaseUI/Twitter"
    auth.dependency "FirebaseUI/Password"
  end

s.subspec 'AuthHelper' do |helper|
  helper.source_files = "FirebaseUI/Auth/**/{FirebaseAppDelegate,FirebaseLoginViewController,FirebaseAuthConstants,FirebaseAuthDelegate,FirebaseAuthProvider,FirebaseLoginButton}.{h,m}"
  helper.resources = "FirebaseUI/Auth/Resources/*"
end

s.subspec 'Facebook' do |facebook|
  facebook.source_files = "FirebaseUI/Auth/**/FirebaseFacebookAuthProvider.{h,m}"
  facebook.dependency "FirebaseUI/AuthHelper"
  facebook.dependency "FBSDKCoreKit"
  facebook.dependency "FBSDKLoginKit"
end

s.subspec 'Google' do |google|
  google.source_files = "FirebaseUI/Auth/**/FirebaseGoogleAuthProvider.{h,m}"
  google.dependency "FirebaseUI/AuthHelper"
  google.dependency "Google/SignIn"
end

s.subspec 'Twitter' do |twitter|
  twitter.source_files = "FirebaseUI/Auth/**/{FirebaseTwitterAuthProvider,TwitterAuthDelegate}.{h,m}"
  twitter.dependency "FirebaseUI/AuthHelper"
  twitter.ios.framework = "Accounts"
end

s.subspec 'Password' do |password|
  password.source_files = "FirebaseUI/Auth/**/FirebasePasswordAuthProvider.{h,m}"
  password.dependency "FirebaseUI/AuthHelper"
end
 end
