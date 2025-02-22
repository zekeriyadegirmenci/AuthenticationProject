//
//  Utilities.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 22.02.2025.
//

import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init() { }

    func topViewController(controller: UIViewController? = UIApplication.shared.connectedScenes
                                        .compactMap { ($0 as? UIWindowScene)?.windows.first { $0.isKeyWindow } }
                                        .first?
                                        .rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
