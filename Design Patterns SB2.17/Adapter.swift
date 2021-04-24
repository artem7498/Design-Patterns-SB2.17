//
//  Adapter..swift
//  Design Patterns SB2.17
//
//  Created by Артём on 4/23/21.
//

import UIKit

//Adapter (структурный) - Позволяет объектам с несовместимыми интерфейсами работать вместе.

// В игре - это может бфыть авторизацией в игре через социальные сети. Facebook & Twitter имеют разные методы авторизации.


class AdapterRealWorldimport {

    func testAdapterRealWorld() {

        print("Starting an authorization via Facebook")
        startAuthorization(with: FacebookAuthSDK())

        print("Starting an authorization via Twitter.")
        startAuthorization(with: TwitterAuthSDK())
    }

    func startAuthorization(with service: AuthService) {

        /// The current top view controller of the app
        let topViewController = UIViewController()

        service.presentAuthFlow(from: topViewController)
    }
}

protocol AuthService {

    func presentAuthFlow(from viewController: UIViewController)
}

class FacebookAuthSDK {

    func presentAuthFlow(from viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Facebook WebView has been shown.")
    }
}

class TwitterAuthSDK {

    func startAuthorization(with viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Twitter WebView has been shown. Users will be happy :)")
    }
}

extension TwitterAuthSDK: AuthService {

    /// This is an adapter

    func presentAuthFlow(from viewController: UIViewController) {
        print("The Adapter is called! Redirecting to the original method...")
        self.startAuthorization(with: viewController)
    }
}

extension FacebookAuthSDK: AuthService {
    /// This extension just tells a compiler that both SDKs have the same
    /// interface.
}
