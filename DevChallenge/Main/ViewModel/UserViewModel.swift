//
//  UserViewModel.swift
//  DevChallenge
//
//  Created by Mojisola Adebiyi on 18/01/2021.
//

import Foundation

class UserViewModel {
    var users:[User] = []
    var fetchCompletedDelegate: DataFetchProtocol?

    func fetchUserData(){
        URLSession.shared.dataTask(with:URL(string: "https://jsonplaceholder.typicode.com/users")!) { data, _, _ in
            do {
                let decoder = JSONDecoder()
                let decodedUsers = try decoder.decode([User].self, from: data!)
                self.users = decodedUsers
                self.fetchCompletedDelegate?.onFetchCompleted()
            } catch {
                self.fetchCompletedDelegate?.onFetchFailed(error: error)
            }
        }.resume()
    }
}
