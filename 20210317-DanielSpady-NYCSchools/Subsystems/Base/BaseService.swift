//
//  BaseService.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

class BaseService {
    
    static let sharedSession: URLSession = {
        let config = URLSessionConfiguration.default
        
        return URLSession(configuration: config)
    }()

    /**
     Full Endpoints
     https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2
     https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
    */

    /**
     The School List endpoint.
     */
    static var schoolListEndpoint: String {
        guard let info = Bundle.main.infoDictionary else {
            return ""
        }
        
        guard let endpoint = info["SchoolListUrl"] as? String else {
            return ""
        }
        
        return endpoint
    }
    
    /**
     The SAT endpoint.
     */
    static var satEndpoint: String {
        guard let info = Bundle.main.infoDictionary else {
            return ""
        }
        
        guard let endpoint = info["SATListUrl"] as? String else {
            return ""
        }
        
        return endpoint
    }
    
    static fileprivate let dispatchQueueQueue: DispatchQueue = DispatchQueue(label: "BaseService.dispatchQueueQueue", attributes: .concurrent)
    static fileprivate var _dispatchQueue: DispatchQueue = DispatchQueue.main
    
    static var dispatchQueue: DispatchQueue {
        get {
            var result: DispatchQueue! // force unwrap declaration protected by _dispatchQueue being non-optional
            BaseService.dispatchQueueQueue.sync {
                result = BaseService._dispatchQueue
            }
            return result
        }
        set (newDispatchQueue) {
            BaseService.dispatchQueueQueue.async(flags: .barrier) {
                _dispatchQueue = newDispatchQueue
            }
        }
    }
    
    /**
     Calls the supplied completionHandler on the specified dispatchQueue. If dispatchQueue is nil
     the completion handler is called in the current context.
     */
    static func executeOnQueue(dispatchQueue: DispatchQueue?, completionHandler:@escaping ()->Swift.Void) {
        guard let dispatchQueue = dispatchQueue else {
            completionHandler()
            return
        }
        
        dispatchQueue.async {
            completionHandler()
        }
    }
}

// Utilities for making requests and processing errors on the service
extension BaseService {
    static func makeRequest<T: BaseRequest>(with baseRequest: T,
                                            urlRequest: URLRequest,
                                            completeOn dispatchQueue: DispatchQueue?,
                                            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        return BaseService.sharedSession.dataTask(with: urlRequest) { (data, response, error) in
            self.executeOnQueue(dispatchQueue: dispatchQueue) {
                completionHandler(data, response, error)
            }
        }
    }
    
    static func makeGetRequest<T: BaseRequest>(with baseRequest: T,
                                               completeOn dispatchQueue: DispatchQueue?,
                                               completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask? {
        guard let urlRequest = baseRequest.getRequest else {
            return nil
        }
        
        return makeRequest(with: baseRequest, urlRequest: urlRequest, completeOn: dispatchQueue, completionHandler: completionHandler)
    }
}
