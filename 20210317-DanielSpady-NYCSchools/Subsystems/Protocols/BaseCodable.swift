//
//  BaseCodable.swift
//  20210317-DanielSpady-NYCSchools
//
//  Created by Daniel Spady on 2021-03-17.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias JSONArray = [Any]

protocol BaseCodable: Codable {
    // Returns default JSONDecoder. Override in your struct implementation for custom configurations
    static var jsonDecoder: JSONDecoder { get }
    
    // Generic JSON decode of data.
    static func fromJSON<T: Decodable>(_ data: Data?) -> [T]?
    
    // Returns default JSONEncoder. Override for custom configurations
    var jsonEncoder: JSONEncoder { get }
}

// Default implementation of JSON wrapper
extension BaseCodable {
    
    // Returns default JSONDecoder. Override for custom configurations
    public static var jsonDecoder: JSONDecoder {
        let result: JSONDecoder = JSONDecoder()
        
        // make this our default.
        result.dateDecodingStrategy = .formatted(DateFormatter.init())
        
        return result
    }
    
    // Returns Generic JSON
    public static func fromJSON<T: Decodable>(_ data: Data?) -> [T]? {
        guard let data = data else {
            return nil
        }
                
        do {
            return try jsonDecoder.decode([T].self, from: data)
        } catch {
            return nil
        }
    }
    
    /// Returns default JSONEncoder. Override in your struct implementation for custom configurations
    public var jsonEncoder: JSONEncoder {
        let result: JSONEncoder = JSONEncoder()
        
        // make this our default.
        result.dateEncodingStrategy = .formatted(DateFormatter.init())
        
        return result
    }
}
