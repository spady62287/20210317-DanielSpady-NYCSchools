//
//  BaseNavigator.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation
import UIKit

// MARK: - Base Navigator protocol
@objc protocol BaseNavigator {
    @objc optional func navigatorWillTransitionToViewController(destinationViewController: UIViewController)
}

// MARK: - Navigation Type
enum BaseNavigationTransitionType {
    case baseNavigationTransitionTypeModal
}

// MARK: - Navigation to Features
extension BaseNavigator {
    
    func navigateToFeature(feature: String, identifier: String, fromViewController: UIViewController, transitionType: BaseNavigationTransitionType) {
        
        let targetStoryboard = UIStoryboard.init(name: feature, bundle: nil)
        let targetVC = targetStoryboard.instantiateViewController(withIdentifier: identifier)
        
        if let delegate = fromViewController as? BaseNavigator {
            delegate.navigatorWillTransitionToViewController!(destinationViewController: targetVC)
        }
        
        switch transitionType {
        case .baseNavigationTransitionTypeModal:
            fromViewController.present(targetVC, animated: true)
        }
    }
}
