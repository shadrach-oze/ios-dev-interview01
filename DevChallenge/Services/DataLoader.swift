//
//  DataLoader.swift
//  DevChallenge
//
//  Created by mac on 11/01/2021.
//

import Foundation

protocol DataLoaderProtocol {
    func loadNames(users: [Users])
}

class DataLoader {
    var delegate: DataLoaderProtocol?
    
    func getNames() {
        guard let url = URL(string: StringConstants.url) else{ return }
        
        URLSession.shared.dataTask(with:url, completionHandler: { data, _, _ in
            
            var userNames: [Users]?
            do {
                userNames = try JSONDecoder().decode([Users].self, from: data!)
            }
            catch {
                print("\(StringConstants.jsonError) \(error.localizedDescription)")
            }
            
            guard let json = userNames else {
                return
            }
            self.delegate?.loadNames(users: json)
        }).resume()
    }
}
