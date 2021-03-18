//
//  SATResult.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

struct SATResult: BaseCodable {
    var identifier: String?
    var schoolName: String?
    var testTakerCount: String?
    var averageReadingScore: String?
    var averageMathScore: String?
    var averageWritingScore: String?
}

extension SATResult {
    enum CodingKeys: String, CodingKey {
        case identifier = "dbn"
        case schoolName = "school_name"
        case testTakerCount = "num_of_sat_test_takers"
        case averageReadingScore = "sat_critical_reading_avg_score"
        case averageMathScore = "sat_math_avg_score"
        case averageWritingScore = "sat_writing_avg_score"
    }
}
