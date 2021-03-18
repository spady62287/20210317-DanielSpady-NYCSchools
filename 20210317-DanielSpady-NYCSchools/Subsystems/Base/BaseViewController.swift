//
//  BaseViewController.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseNavigator {
        
    lazy var loadingView: UIView = { [unowned self] in
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black
        view.alpha = 0
        
        view.addSubview(self.loadingSpinner)
        self.loadingSpinner.backgroundColor = UIColor.clear
        self.loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        self.loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.loadingSpinner.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.loadingSpinner.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var loadingSpinner: AnimatedLoader = AnimatedLoader()
    
    func loadData(for tableView: UITableView, errorView: UIView) {
        hideErrorView(with: errorView)
        showLoadingView(animated: true, after: 3.0)
    }
    
    func showErrorView(animated: Bool = true, after delay: TimeInterval? = nil, with errorView: UIView) {
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            errorView.isHidden = false
        })
    }
    
    func hideErrorView(with errorView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            errorView.isHidden = true
        })
    }
        
    func showLoadingView(animated: Bool = true, after delay: TimeInterval? = nil) {
        view.bringSubviewToFront(loadingView)
        loadingSpinner.start()
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            self.loadingView.alpha = 1
        })
    }
    
    func hideLoadingView() {
        self.loadingSpinner.stop()
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingView.alpha = 0
        })
    }
}
