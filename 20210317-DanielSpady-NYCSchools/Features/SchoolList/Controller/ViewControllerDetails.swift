//
//  ViewControllerDetails.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-18.
//

import Foundation
import UIKit

class ViewControllerDetails: BaseViewController {
    
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var mathSATLabel: UILabel!
    @IBOutlet weak var readingSATLabel: UILabel!
    @IBOutlet weak var writtingSATLabel: UILabel!
    
    // MARK: - Properties
    var selectedSAT: SATResult?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let SAT = selectedSAT {
            schoolNameLabel.text = SAT.schoolName
            mathSATLabel.text = "Average Math Score: \(SAT.averageMathScore ?? "")"
            readingSATLabel.text = "Average Reading Score: \(SAT.averageReadingScore ?? "")"
            writtingSATLabel.text = "Average Writting Score: \(SAT.averageWritingScore ?? "")"
        }
    }
}
