//
//  NetworkManager.swift
//  testModule
//
//  Created by Anna Sverdlova on 01.02.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getData(_ completion: @escaping (_ result: [String], _ error: Error?) -> Void)  {
        let url = URL(string: "https://api.github.com/users/anya-sverdlova/repos")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            if let error = error {
                completion([], error)
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                        var result: [String] = []
                        for obj in json {
                            if let name = obj["name"] as? String {
                                result.append(name)
                            }
                        }
                        completion(result, nil)
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        })
        
        task.resume()
    }
}
