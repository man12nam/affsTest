# Affise Attribution iOS Library

| Pod  | Version |
| ---- |:-------:|
| AffiseAttributionLib  | [1.1.7](https://github.com/CocoaPods/Specs/tree/master/Specs/a/9/3/AffiseAttributionLib) |
| AffiseSKAdNetwork  | [1.1.7](https://github.com/CocoaPods/Specs/tree/master/Specs/3/6/f/AffiseSKAdNetwork) |

- [Affise Attribution iOS Library](#affise-attribution-ios-library)
- [Description](#description)
  - [Quick start](#quick-start)
  - [Integration](#integration)
    - [Integrate as Cocoapods](#integrate-as-cocoapods)
    - [Initialize](#initialize)
  - [StoreKit Ad Network](#storekit-ad-network)
- [Features](#features)
  - [Device identifiers collection](#device-identifiers-collection)
  - [Events tracking](#events-tracking)
  - [Custom events tracking](#custom-events-tracking)
  - [Predefined event parameters](#predefined-event-parameters)
  - [Events buffering](#events-buffering)
  - [Push token tracking](#push-token-tracking)
  - [Reinstall Uninstall tracking](#reinstall-uninstall-tracking)
  - [Deeplinks](#deeplinks)
  - [Get random user Id](#get-random-user-id)
  - [Get random device Id](#get-random-device-id)
  - [Webview tracking](#webview-tracking)
    - [Initialize webview](#initialize-webview)
    - [Events tracking JS](#events-tracking-js)
    - [Predefined event parameters JS](#predefined-event-parameters-js)
    - [Custom events JS](#custom-events-js)

# Description

Affise SDK is a software you can use to collect app usage statistics, device identifiers, deeplink usage, track install
referrer.

## Quick start

## Integration

### Integrate as Cocoapods

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
// Get pod from repository
pod 'AffiseAttributionLib', '~> 1.1.7'

// Get source directly from GitHub
pod 'AffiseAttributionLib', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.1.7'
```

### Initialize

After library is added as dependency sync project with gradle files and initialize.

For swift use:

```swift
import AffiseAttributionLib

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let properties = AffiseInitProperties(affiseAppId: "Your appId", //Change to your app id
                                              partParamName: nil, //Change to your partParamName
                                              partParamNameToken: nil, //Change to your partParamNameToken
                                              appToken: nil, //Change to your appToken
                                              isProduction: false, // Add your custom rule to determine if this is a production build
                                              secretId: "Your secretId" //Change to your appToken
                                              )
        Affise.shared.load(app: application, initProperties: properties, launchOptions: launchOptions)

        return true
    }
}
```

For objective-c use:

```objective-c
#import "AppDelegate.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    AffiseInitProperties *initProperties = [[AffiseInitProperties alloc] initWithAffiseAppId:@"Your appId" //Change to your app id
                                                                               partParamName:@"Your partParamName" //Change to your partParamName
                                                                          partParamNameToken:@"Your partParamNameToken" //Change to your partParamNameToken
                                                                                    appToken:@"Your appToken" //Change to your appToken
                                                                                isProduction:NO // Add your custom rule to determine if this is a production build
                                                                                    secretId:@"Your secretId" //Change to your appToken
                                                                                    ];
    [Affise.shared loadWithApp:application initProperties:initProperties launchOptions:launchOptions];

    return YES;
}
@end
```

## StoreKit Ad Network

To add the SDK using Cocoapods, specify the version you want to use in your Podfile:

```ruby
// Get pod from repository
pod 'AffiseSKAdNetwork', '~> 1.1.5'

// Get source directly from GitHub
pod 'AffiseSKAdNetwork', :git => 'https://github.com/affise/sdk-ios.git', :tag => '1.1.5'
```

For use:

For ios prior `15.4`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.registerAppForAdNetworkAttribution(completionHandler: { error in                
    // Handle error
})

AffiseSKAdNetwork.shared()?.updateConversionValue(conversionValue, completionHandler: { error in
    // Handle error
})
```

For ios `15.4`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, completionHandler: { error in
    // Handle error
})
```

For ios `16.1`

```swift
import AffiseSKAdNetwork

AffiseSKAdNetwork.shared()?.updatePostbackConversionValue(fineValue, coarseValue, completionHandler: { error in
    // Handle error
})
```

Configure your app to send postback copies to Affise:

Add key `NSAdvertisingAttributionReportEndpoint` to `Info.plist`
Set key value to `https://affise-skadnetwork.com/`

Example: `example/ios/Runner/Info.plist`

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
      <key>NSAdvertisingAttributionReportEndpoint</key>
      <string>https://affise-skadnetwork.com/</string>
    </dict>
</array>
```

# Features

## Device identifiers collection

To match users with events and data library is sending, these identifiers are collected:

- `AFFISE_APP_ID`
- `AFFISE_PKG_APP_NAME`
- `AFFISE_APP_NAME_DASHBOARD`
- `APP_VERSION`
- `APP_VERSION_RAW`
- `STORE`
- `TRACKER_TOKEN`
- `TRACKER_NAME`
- `FIRST_TRACKER_TOKEN`
- `FIRST_TRACKER_NAME`
- `LAST_TRACKER_TOKEN`
- `LAST_TRACKER_NAME`
- `OUTDATED_TRACKER_TOKEN`
- `INSTALLED_TIME`
- `FIRST_OPEN_TIME`
- `INSTALLED_HOUR`
- `FIRST_OPEN_HOUR`
- `INSTALL_BEGIN_TIME`
- `INSTALL_FINISH_TIME`
- `REFERRAL_TIME`
- `CREATED_TIME`
- `CREATED_TIME_MILLI`
- `CREATED_TIME_HOUR`
- `UNINSTALL_TIME`
- `REINSTALL_TIME`
- `LAST_SESSION_TIME`
- `CONNECTION_TYPE`
- `CPU_TYPE`
- `HARDWARE_NAME`
- `NETWORK_TYPE`
- `DEVICE_MANUFACTURER`
- `PROXY_IP_ADDRESS`
- `DEEPLINK_CLICK`
- `DEVICE_ATLAS_ID`
- `AFFISE_DEVICE_ID`
- `AFFISE_ALT_DEVICE_ID`
- `ADID`
- `ANDROID_ID`
- `ANDROID_ID_MD5`
- `MAC_SHA1`
- `MAC_MD5`
- `GAID_ADID`
- `GAID_ADID_MD5`
- `OAID`
- `OAID_MD5`
- `REFTOKEN`
- `REFTOKENS`
- `REFERRER`
- `USER_AGENT`
- `MCCODE`
- `MNCODE`
- `ISP`
- `REGION`
- `COUNTRY`
- `LANGUAGE`
- `DEVICE_NAME`
- `DEVICE_TYPE`
- `OS_NAME`
- `PLATFORM`
- `API_LEVEL_OS`
- `AFFISE_SDK_VERSION`
- `OS_VERSION`
- `RANDOM_USER_ID`
- `AFFISE_SDK_POS`
- `TIMEZONE_DEV`
- `LAST_TIME_SESSION`
- `TIME_SESSION`
- `AFFISE_SESSION_COUNT`
- `LIFETIME_SESSION_COUNT`
- `AFFISE_DEEPLINK`
- `AFFISE_PART_PARAM_NAME`
- `AFFISE_PART_PARAM_NAME_TOKEN`
- `AFFISE_APP_TOKEN`
- `LABEL`
- `AFFISE_SDK_SECRET_ID`
- `UUID`
- `AFFISE_APP_OPENED`
- `PUSHTOKEN`
- `EVENTS`
- `AFFISE_EVENTS_COUNT`

## Events tracking

For example, we want to track what items usually user adds to shopping cart. To send event first create it with
following code

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]
        Affise.shared.sendEvent(event: AddToCartEvent(addToCartObject: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "groceries").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESCRIPTION, value: "best before 2029")
        })
    }
}
```

For objective-c use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] initWithAddToCartObject:items
                                                   timeStampMillis:NSDate.date.timeIntervalSince1970
                                                          userData:@"groceries"];
    [event addPredefinedParameterWithParameter:PredefinedParametersADREV_AD_TYPE value:@"best before 2029"];

    [Affise.shared sendEventWithEvent: event];
}
```

With above example you can implement other events:

- `AchieveLevel`
- `AddPaymentInfo`
- `AddToCart`
- `AddToWishlist`
- `ClickAdv`
- `CompleteRegistration`
- `CompleteStream`
- `CompleteTrial`
- `CompleteTutorial`
- `ContentItemsView`
- `ConvertedOffer`
- `ConvertedOfferFromRetry`
- `ConvertedTrial`
- `ConvertedTrialFromRetry`
- `DeepLinked`
- `FailedOfferFromRetry`
- `FailedOfferise`
- `FailedSubscription`
- `FailedSubscriptionFromRetry`
- `FailedTrial`
- `FailedTrialFromRetry`
- `InitialOffer`
- `InitialSubscription`
- `InitialTrial`
- `InitiatePurchase`
- `InitiateStream`
- `Invite`
- `LastAttributedTouch`
- `ListView`
- `Login`
- `OfferInRetry`
- `OpenedFromPushNotification`
- `Purchase`
- `Rate`
- `ReEngage`
- `ReactivatedSubscription`
- `RenewedSubscription`
- `RenewedSubscriptionFromRetry`
- `Reserve`
- `Sales`
- `Search`
- `Share`
- `SpendCredits`
- `StartRegistration`
- `StartTrial`
- `StartTutorial`
- `Subscribe`
- `Subscription`
- `SubscriptionInRetry`
- `TravelBooking`
- `TrialInRetry`
- `UnlockAchievement`
- `Unsubscribe`
- `Unsubscription`
- `Update`
- `ViewAdv`
- `ViewCart`
- `ViewItem`
- `ViewItems`

## Custom events tracking

Use any of custom events if default doesn't fit your scenario:

- `CustomId01`
- `CustomId02`
- `CustomId03`
- `CustomId04`
- `CustomId05`
- `CustomId06`
- `CustomId07`
- `CustomId08`
- `CustomId09`
- `CustomId10`

## Predefined event parameters

To enrich your event with another dimension, you can use predefined parameters for most common cases.
Add it to any event:

```swift
class Presenter {
    func onUserAddsItemsToCart(items: String) {
        let items = [
            ("items", "cookies, potato, milk")
        ]
        Affise.shared.sendEvent(event: AddToCartEvent(addToCartObject: items, timeStampMillis: Int64(Date().timeIntervalSince1970 * 1000), userData: "groceries").apply {
            $0.addPredefinedParameter(parameter: PredefinedParameters.DESCRIPTION, value: "best before 2029")
        })
    }
}
```

For objective-c use:

```objective-c
- (void)onUserAddsItemsToCart:(NSString *)itemsToCart {
    NSArray *items = @[
        @{"items", itemsToCart}
    ];

    Event *event = [[AddToCartEvent alloc] initWithAddToCartObject:items
                                                   timeStampMillis:NSDate.date.timeIntervalSince1970
                                                          userData:@"groceries"];
    [event addPredefinedParameterWithParameter:PredefinedParametersADREV_AD_TYPE value:@"best before 2029"];

    [Affise.shared sendEventWithEvent: event];
}
```

In examples above `PredefinedParameters.DESCRIPTION` is used, but many others is available:

- `ADREV_AD_TYPE`
- `CITY`
- `COUNTRY`
- `REGION`
- `CLASS`
- `CONTENT`
- `CONTENT_ID`
- `CONTENT_LIST`
- `CONTENT_TYPE`
- `CURRENCY`
- `CUSTOMER_USER_ID`
- `DATE_A`
- `DATE_B`
- `DEPARTING_ARRIVAL_DATE`
- `DEPARTING_DEPARTURE_DATE`
- `DESCRIPTION`
- `DESTINATION_A`
- `DESTINATION_B`
- `DESTINATION_LIST`
- `HOTEL_SCORE`
- `LEVEL`
- `MAX_RATING_VALUE`
- `NUM_ADULTS`
- `NUM_CHILDREN`
- `NUM_INFANTS`
- `ORDER_ID`
- `PAYMENT_INFO_AVAILABLE`
- `PREFERRED_NEIGHBORHOODS`
- `PREFERRED_NUM_STOPS`
- `PREFERRED_PRICE_RANGE`
- `PREFERRED_STAR_RATINGS`
- `PRICE`
- `PURCHASE_CURRENCY`
- `QUANTITY`
- `RATING_VALUE`
- `RECEIPT_ID`
- `REGISTRATION_METHOD`
- `RETURNING_ARRIVAL_DATE`
- `RETURNING_DEPARTURE_DATE`
- `REVENUE`
- `SCORE`
- `SEARCH_STRING`
- `SUBSCRIPTION_ID`
- `SUCCESS`
- `SUGGESTED_DESTINATIONS`
- `SUGGESTED_HOTELS`
- `TRAVEL_START`
- `TRAVEL_END`
- `USER_SCORE`
- `VALIDATED`
- `ACHIEVEMENT_ID`
- `COUPON_CODE`
- `CUSTOMER_SEGMENT`
- `DEEP_LINK`
- `EVENT_START`
- `EVENT_END`
- `LAT`
- `LONG`
- `NEW_VERSION`
- `OLD_VERSION`
- `REVIEW_TEXT`
- `TUTORIAL_ID`
- `VIRTUAL_CURRENCY_NAME`
- `PARAM_01`
- `PARAM_02`
- `PARAM_03`
- `PARAM_04`
- `PARAM_05`
- `PARAM_06`
- `PARAM_07`
- `PARAM_08`
- `PARAM_09`

## Events buffering

Affise library will send any pending events with first opportunity,
but if there is no network connection or device is disabled, events are kept locally for 7 days before deletion.

## Push token tracking

To let affise track push token you need to receive it from your push service provider, and pass to Affise library.
First add firebase integration to your app completing theese steps: https://firebase.google.com/docs/cloud-messaging/ios/client

After you have done with firebase inegration, add to your cloud messaging service `onNewToken` method `Affise.share.addPushToken(token)`

```swift
func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
  print("Firebase registration token: \(String(describing: fcmToken))")

  // New token generated
  Affise.share.addPushToken(fcmToken)
}
```

## Reinstall Uninstall tracking

Affise automaticly track reinstall events by using silent-push technology, to make this feature work, pass push token when it is recreated by user and on you application starts up

```kotlin
Affise.share.addPushToken(token)
```

## Deeplinks

To integrate deeplink support You can find out how to set up deeplinks in the [official documentation](https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app).

Register deeplink callback right after Affise.share.init(..)

```swift
Affise.share.init(..)
Affise.shared.registerDeeplinkCallback { url in
    let component = URLComponents(string: url.absoluteString)!
    let screen = component.queryItems?.first(where: {$0.name == "screen"})?.value
    if let screen = screen, screen == "special_offer" {
        // open special offer activity
    } else {
        // open another activity
    }
}
```

Add deeplink handler to `AppDelegate.swift` as in `app/app/AppDelegate.swift`

```swift
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    Affise.shared.handleDeeplink(url: url)
    return true
}
```

Add key `CFBundleURLTypes` to `Info.plist`

Example: `app/app/Info.plist`

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>YOUR_AFFISE_APP_ID.affattr.com</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>affise</string>
        </array>
    </dict>
</array>
```

## Get random user Id

Use the next public method of SDK

```swift
Affise.shared.getRandomUserId()
```

## Get random device Id

Use the next public method of SDK

```swift
Affise.shared.getRandomDeviceId()
```

## Webview tracking

### Initialize webview

To integrate the library into the JavaScript environment, we added a bridge between JavaScript and the native SDK. Now you can send events and use the functionality of the native library directly from Webview.
Here are step by step instructions:

```swift
// retreive webview from view hierarhy
@IBOutlet weak var webView: WKWebView!

// make sure javascript is enabled
override func viewDidLoad() {
    super.viewDidLoad()

    webView.configuration.preferences.javaScriptEnabled = true
}

// initialize webview with Affise native library
Affise.shared.registerWebView(webView)

```

Other Javascript enviroment features is described below.

### Events tracking JS

after webview is initialized you send events from JavaScript enviroment

```javascript
var event = new AddPaymentInfoEvent(
    { card: 4138, type: 'phone' },
     Date.now(),
    'taxi'
);

event.addPredefinedParameter('affise_p_purchase_currency', 'USD');

Affise.sendEvent(event);
```

Just like with native SDK, javascript enviroment also provides default events that can be passed from webview:

- `AchieveLevelEvent`
- `AddPaymentInfoEvent`
- `AddToCartEvent`
- `AddToWishlistEvent`
- `ClickAdvEvent`
- `CompleteRegistrationEvent`
- `CompleteStreamEvent`
- `CompleteTrialEvent`
- `CompleteTutorialEvent`
- `ContentItemsViewEvent`
- `ConvertedOfferEvent`
- `ConvertedOfferFromRetryEvent`
- `ConvertedTrialEvent`
- `ConvertedTrialFromRetryEvent`
- `CustomId01Event`
- `CustomId02Event`
- `CustomId03Event`
- `CustomId04Event`
- `CustomId05Event`
- `CustomId06Event`
- `CustomId07Event`
- `CustomId08Event`
- `CustomId09Event`
- `CustomId10Event`
- `DeepLinkedEvent`
- `FailedOfferFromRetryEvent`
- `FailedOfferiseEvent`
- `FailedSubscriptionEvent`
- `FailedSubscriptionFromRetryEvent`
- `FailedTrialEvent`
- `FailedTrialFromRetryEvent`
- `InitialOfferEvent`
- `InitialSubscriptionEvent`
- `InitialTrialEvent`
- `InitiatePurchaseEvent`
- `InitiateStreamEvent`
- `InviteEvent`
- `LastAttributedTouchEvent`
- `ListViewEvent`
- `LoginEvent`
- `OfferInRetryEvent`
- `OpenedFromPushNotificationEvent`
- `PurchaseEvent`
- `RateEvent`
- `ReEngageEvent`
- `ReactivatedSubscriptionEvent`
- `RenewedSubscriptionEvent`
- `RenewedSubscriptionFromRetryEvent`
- `ReserveEvent`
- `SalesEvent`
- `SearchEvent`
- `ShareEvent`
- `SpendCreditsEvent`
- `StartRegistrationEvent`
- `StartTrialEvent`
- `StartTutorialEvent`
- `SubscribeEvent`
- `SubscriptionEvent`
- `SubscriptionInRetryEvent`
- `TravelBookingEvent`
- `TrialInRetryEvent`
- `UnlockAchievementEvent`
- `UnsubscribeEvent`
- `UnsubscriptionEvent`
- `UpdateEvent`
- `ViewAdvEvent`
- `ViewCartEvent`
- `ViewItemEvent`
- `ViewItemsEvent`

### Predefined event parameters JS

Each event can be extended with custom event parameters. By calling `addPredefinedParameter` function you can pass predefined parameters name and value, for example:

```javascript
var event = ...

event.addPredefinedParameter('affise_p_purchase_currency', 'USD');

Affise.sendEvent(event);
```

### Custom events JS

If above event functionality still limits your usecase, you can allways extend `Event` class to override fields you are missing

```javascript
class AchieveLevelEvent extends Event {
    constructor(level, timeStampMillis, userData) {
        super('AchieveLevel');

        this.affise_event_first_for_user = false;
        this.affise_event_user_data = userData;
        this.affise_event_data = {
            affise_event_achieve_level: level,
            affise_event_achieve_level_timestamp: timeStampMillis
        };
    }
};
```
