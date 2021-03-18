//
//  SchoolResult.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

struct SchoolResult: BaseCodable {
    var identifier: String?
    var schoolName: String?
    var boroughInitial: String?
    var overview: String?
    var schoolSeats: String?
    var acdOpportunityOne: String?
    var acdOpportunityTwo: String?
    var ellPrograms: String?
    var neighborhood: String?
    var buildingCode: String?
    var location: String?
    var phoneNumber: String?
    var faxNumber: String?
    var schoolEmail: String?
    var website: String?
    var subway: String?
    var bus: String?
    var grades2018: String?
    var finalgrades: String?
    var totalStudents: String?
    var extracurricularActivities: String?
    var schoolSports: String?
    var attendanceRate: String?
    var pctStuEnoughVariety: String?
    var pctStuSafe: String?
    var schoolAccessibilityDescription: String?
    var directions: String?
    var requirementOne: String?
    var requirementTwo: String?
    var requirementThree: String?
    var requirementFour: String?
    var requirementFive: String?
    var offerRate: String?
    var program: String?
    var code: String?
    var interest: String?
    var method: String?
    var seatsOne: String?
    var gradeFilledFlag: String?
    var gradeApplicants: String?
    var seatsTwo: String?
    var primaryAddress: String?
    var city: String?
    var zipCode: String?
    var state: String?
    var latitude: String?
    var longitude: String?
    var borough: String?
}

extension SchoolResult {
    enum CodingKeys: String, CodingKey {
        case identifier = "dbn"
        case schoolName = "school_name"
        case boroughInitial = "boro"
        case overview = "overview_paragraph"
        case schoolSeats = "school_10th_seats"
        case acdOpportunityOne = "academicopportunities1"
        case acdOpportunityTwo = "academicopportunities2"
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case subway
        case bus
        case grades2018
        case finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions = "directions1"
        case requirementOne = "requirement1_1"
        case requirementTwo = "requirement2_1"
        case requirementThree = "requirement3_1"
        case requirementFour = "requirement4_1"
        case requirementFive = "requirement5_1"
        case offerRate = "offer_rate1"
        case program = "program1"
        case code = "code1"
        case interest = "interest1"
        case method = "method1"
        case seatsOne = "seats9ge1"
        case gradeFilledFlag = "grade9gefilledflag1"
        case gradeApplicants = "grade9geapplicants1"
        case seatsTwo = "seats9swd1"
        case primaryAddress = "primary_address_line_1"
        case city
        case zipCode = "zip"
        case state = "state_code"
        case latitude
        case borough
    }
}
