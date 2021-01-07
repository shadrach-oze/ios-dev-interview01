//
//  MianUseCase.swift
//  DevChallenge
//
//  Created by Muhammad Usman on 07/01/2021.
//

import Foundation
import Combine

protocol MianUseCaseType {
    func fetchUsersList() -> AnyPublisher<Result<[JsonPlaceholderModel], APIError>, Never>
}

final class MianUseCase {
    // MARK: -  Properties

    var apiClient: APIClientType

    // MARK: - Initializer

    init(apiClient: APIClientType = APIClient()) {
        self.apiClient = apiClient
    }
}

// MARK: - Extension

extension MianUseCase: MianUseCaseType {
    // MARK: - Function to fetch job shedules

    func fetchUsersList() -> AnyPublisher<Result<[JsonPlaceholderModel], APIError>, Never> {
        return apiClient.execute().
    }
}
