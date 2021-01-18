//
//  UserModelModel.swift
//  DevChallenge
//
//  Created by Mojisola Adebiyi on 18/01/2021.
//

import Foundation

struct User: Codable {
    let name: String
    let url: String
    
    enum CodingKeys : String, CodingKey {
        case url = "website", name
    }

}
