//
//  ViewController.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import UIKit

class ViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIStackView!
    
    // MARK: - Properties
    var selectedSchool: SchoolResult?
    var selectedSAT: SATResult?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData(for: tableView, errorView: errorView)
    }
    
    // MARK: - Tableview Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let schools = schoolList {
            return schools.count
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: AppConstants.SchoolCell)
        
        if let schools = schoolList {
            let school = schools[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = school.schoolName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let schools = schoolList {
            self.selectedSchool = schools[(indexPath as NSIndexPath).row]
        }
        
        // MAke sure Sat list is populated
        guard let SATs = satList else {
            return
        }
        
        if let identifier = selectedSchool?.identifier {
            let index = find(value: identifier, in: SATs)
            
            if let index = index {
                self.selectedSAT = SATs[index]
                
                SchoolNavigator.shared().schoolDetailsViewController(viewController: self)
            }
        }
    }
    
    func find(value searchValue: String, in array: [SATResult]) -> Int? {
        for (index, value) in array.enumerated() {
            if value.identifier == searchValue {
                return index
            }
        }

        return nil
    }
    
    // MARK: - Base Navigator Delegate
    func navigatorWillTransitionToViewController(destinationViewController: UIViewController) {
        if destinationViewController.isKind(of: ViewControllerDetails.self) {
            (destinationViewController as? ViewControllerDetails)?.selectedSAT = self.selectedSAT
        }
    }

}
