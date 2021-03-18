//
//  SATResponse.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

public struct SATResponse: BaseResponse {
    
    var request: BaseRequest?
    var task: URLSessionDataTask?
    var data: Data?
    var response: HTTPURLResponse?
    var error: Error?
    var result: [SATResult]?
    
    public init() {
        self.request = Request()
        self.task = nil
        self.data = nil
        self.response = nil
        self.error = nil
        result = nil
    }
}
