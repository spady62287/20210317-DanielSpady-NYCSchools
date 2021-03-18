//
//  SchoolUtillity.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

class SchoolUtillity: BaseService {
    /**
     Retrieve list of Schools
     
     
     - parameter request: BaseRequest
     - parameter dispatchQueue: The queue used to execute the completionHandler. If nil, the completionHandler will execute on the same queue as the request. The default queue is the BaseService dispatchQueue
     - parameter completionHandler: (SchoolResponse) -> ()
     - returns: URLSessionDataTask?
     
     */
    @discardableResult static public func schoolList(_ request: BaseRequest = BaseRequest(), dispatchQueue: DispatchQueue? = BaseService.dispatchQueue, completionHandler: @escaping (SchoolResponse) -> Void) -> URLSessionDataTask? {
        
        var task: URLSessionDataTask?

        task = makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
                        
            let response = SchoolResponse(request: request,
                                                     task: task,
                                                     data: data,
                                                     response: response as? HTTPURLResponse,
                                                     error: error,
                                                     result: SchoolResult.fromJSON(data))
            
            completionHandler(response)
        }

        task?.resume()

        return task
    }
    
    /**
     Retrieve list of SATs
     
     
     - parameter request: BaseRequest
     - parameter dispatchQueue: The queue used to execute the completionHandler. If nil, the completionHandler will execute on the same queue as the request. The default queue is the BaseService dispatchQueue
     - parameter completionHandler: (SATResponse) -> ()
     - returns: URLSessionDataTask?
     
     */
    @discardableResult static public func satList(_ request: BaseRequest = BaseRequest(), dispatchQueue: DispatchQueue? = BaseService.dispatchQueue, completionHandler: @escaping (SATResponse) -> Void) -> URLSessionDataTask? {
        
        var task: URLSessionDataTask?

        task = makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
                        
            let response = SATResponse(request: request,
                                                     task: task,
                                                     data: data,
                                                     response: response as? HTTPURLResponse,
                                                     error: error,
                                                     result: SATResult.fromJSON(data))
                        
            completionHandler(response)
        }

        task?.resume()

        return task
    }
}
