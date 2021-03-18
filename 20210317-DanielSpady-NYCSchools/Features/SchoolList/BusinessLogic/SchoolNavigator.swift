//
//  SchoolNavigator.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-18.
//

import Foundation
import UIKit

class SchoolNavigator: BaseNavigator {
    
    // MARK: - Properties
    private static var sharedSchoolNavigator: SchoolNavigator = {
        let schoolNavigator = SchoolNavigator()

        return schoolNavigator
    }()

    // MARK: - Accessors
    class func shared() -> SchoolNavigator {
        return sharedSchoolNavigator
    }
    
    // MARK: - Screens To Navigate to
    func schoolDetailsViewController(viewController: UIViewController) {
        self.navigateToFeature(feature: AppConstants.mainStoryboard,
                               identifier: AppConstants.details,
                               fromViewController: viewController,
                               transitionType: .baseNavigationTransitionTypeModal)
    }
}
