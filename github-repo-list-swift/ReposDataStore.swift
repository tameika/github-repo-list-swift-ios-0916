//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> ()) {
        
        GithubAPIClient.getRepositories { (jsonArray) in
            
            if !self.repositories.isEmpty { self.repositories.removeAll() }
            
            for repoDict in jsonArray {
                
                let gitHubRepo = GithubRepository.init(dictionary: repoDict)
                
                self.repositories.append(gitHubRepo)
                
            }
            
            completion()
        }
        
    }
}
