//
//  DataFetchProtocol.swift
//  DevChallenge
//
//  Created by Mojisola Adebiyi on 18/01/2021.
//

import Foundation

protocol DataFetchProtocol {
    func onFetchCompleted()
    func onFetchFailed(error: Error)
}
