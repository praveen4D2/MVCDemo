//
//  WebServices.swift
//  MVCDemo
//
//  Created by Adaps on 06/01/20.
//  Copyright © 2020 CrazyTricks. All rights reserved.
//

import Foundation
struct APIService {
    
    let baseURL = URL(string: "http://test.oye.direct/")!
    static let shared = APIService()
    let decoder = JSONDecoder()
    
    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
        case internetError(error: Error)
       }
    
    enum Endpoint {
        case getUserList
        case getPlayers

        func path() -> String {
            switch self {
            case .getUserList:
                return "getUser_list"
            case .getPlayers:
                return "players.json"
            }
        }
    }
    
    
    /// ---------------------------------
    /// POST Request
    /// ---------------------------------
    
    func POST<T: Codable>(endpoint: Endpoint,
                         params: [String: Any],
                         completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return
        }
        
        var request = URLRequest(url: queryURL)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        
        task.resume()
    }
    
    
    /// ---------------------------------
    /// GET Request
    /// ---------------------------------
    
    func GET<T: Codable>(endpoint: Endpoint, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var request = URLRequest(url: queryURL)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        task.resume()
    }
    
}
