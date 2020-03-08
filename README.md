# Swiftagram
[![GitHub](https://img.shields.io/github/license/sbertix/Swiftagram)](LICENSE)
[![PayPal](https://img.shields.io/badge/support-PayPal-blue?style=flat&logo=paypal)](https://www.paypal.me/sbertix)

**Swiftagram** is a client for [**Instagram**](https://instagram.com) written entirely in **Swift**.

<br/>

> How does it work?  

**Swiftagram** relies on Instagram unofficial private APIs, used internally in the Android and iOS apps.  

This is because Instagram's **oficial APIs**, both the [**Instagram Basic Display API**](https://developers.facebook.com/docs/instagram-basic-display-api) and the [**Instagram Graph API**](https://developers.facebook.com/docs/instagram-api/), are either lacking support for even the most mundane of features or limited to a small audience (e.g. _Professional_, i.e. _Creator_ and _Influencer_, accounts).  

> Do I need an API token?

**Swiftagram** requires no token or registration.\
Unofficial APIs, though, are not authorized by Instagram for external use: use them at your own risk.

> Where can I use this?

**Swiftagram** supports **iOS**, **macOS**, **watchOS**, **tvOS** and **Linux**.

## Status
![Status](https://github.com/sbertix/Swiftagram/workflows/Push%20(master)/badge.svg)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/sbertix/Swiftagram)

**Swiftagram is currently under active development and more features are expected to be implemented everyday, which might result in breaking changes.**

## Installation
### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency…` from the menu.
1. Paste `https://github.com/sbertix/Swiftagram.git`.
1. Follow the steps.

**Swiftagram** depends on [KeychainSwift](https://github.com/evgenyneu/keychain-swift) and requires Swift **5.0** or above.

> Why not CocoaPods, or Carthage, or ~blank~?

Supporting multiple _dependency managers_ makes maintaining a library exponentially more complicated and time consuming.\
Furthermore, with the intregration of the **Swift Package Manager** in **Xcode 11** and greater, we expect the need for alternative solutions to fade quickly.

## Usage
Visit the (_auto-generated_) [Wiki](https://github.com/sbertix/Swiftagram/wiki) to learn about use cases.  

### Authentication
Authentication is provided through conformance to the [`Authenticator`](https://github.com/sbertix/Swiftagram/wiki/Authenticator) protocol, which, on success, returns a [`Secret`](https://github.com/sbertix/Swiftagram/wiki/Secret) containing all the cookies needed to sign a [`Request`](https://github.com/sbertix/Swiftagram/wiki/Request).

The library comes with a concrete implementation.
- [`BasicAuthenticator`](https://github.com/sbertix/Swiftagram/wiki/BasicAuthenticator) requires _username_ and _password_, and includes support for checkpoints and two factor authentication.

> What about a web view based approach?

Definitely planned: it'll be here in time for an initial stable release.

### Caching
Caching of `Secret`s is provided through conformance to the [`Storage`](https://github.com/sbertix/Swiftagram/wiki/Storage) protocol.  

The library comes with several concrete implementations.  
- [`TransientStorage`](https://github.com/sbertix/Swiftagram/wiki/TransientStorage) should be used when no caching is necessary.  
- [`UserDefaultsStorage`](https://github.com/sbertix/Swiftagram/wiki/UserDefaultsStorage) allows for faster, out-of-the-box, testing, although it's not recommended for production as private cookies are not encoded.  
- [`KeychainStorage`](https://github.com/sbertix/Swiftagram/wiki/KeychainStorage) (**preferred**) stores them safely in the user's keychain.  


## Contributions
[Pull requests](https://github.com/sbertix/Swiftagram/pulls) and [issues](https://github.com/sbertix/Swiftagram/issues) are more than welcome.
