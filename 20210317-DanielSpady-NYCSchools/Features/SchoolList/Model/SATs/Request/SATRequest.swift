//
//  SATRequest.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

class SATRequest: BaseRequest {
    
    override var url: URL? {
        let urlString = BaseService.satEndpoint
        return URL(string: urlString)
    }
}
