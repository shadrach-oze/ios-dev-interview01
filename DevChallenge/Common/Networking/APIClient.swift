//
//  APIClient.swift
//  DevChallenge
//
//  Created by Muhammad Usman on 07/01/2021.
//

import Foundation
import Combine


enum APIError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}

protocol APIClientType : AnyObject{
    @discardableResult
    func execute<T>() -> AnyPublisher<Result<[T], APIError>, Never> where T: Decodable
}

final class APIClient: APIClientType {
  
    // MARK: - Function
    
    @discardableResult
    func execute<T>() -> AnyPublisher<Result<[T], APIError>, Never> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: URL(string: "")!))
            .mapError { _ in APIError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return .fail(APIError.invalidResponse)
                }

                guard 200..<300 ~= response.statusCode else {
                    return .fail(APIError.dataLoadingError(statusCode: response.statusCode, data: data))
                }
                return .just(data)
            }
            .decode(type: [T].self, decoder: JSONDecoder())
        .map { .success($0) }
        .catch ({ error -> AnyPublisher<Result<[T], APIError>, Never> in
            return .just(.failure(APIError.jsonDecodingError(error: error)))
        })
        .eraseToAnyPublisher()
    }
}
