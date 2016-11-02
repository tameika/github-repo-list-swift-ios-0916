//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class GithubAPIClient {
    
    //static so we don't need an instance 
    
    static let urlString = "https://api.github.com/repositories?client_id=\(apiKey)&client_secret=\(apiClientSecret)"
    
    static func getRepositories(with completion: @escaping ([[String : AnyObject]]) -> Void) {
        
        let url = URL(string: urlString)!
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String : AnyObject]]
                
                completion(jsonArray)
                
            } catch { return }
        }
        
        dataTask.resume()
    }
}

