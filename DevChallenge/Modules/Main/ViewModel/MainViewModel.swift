//
//  MainViewModel.swift
//  DevChallenge
//
//  Created by Muhammad Usman on 07/01/2021.
//

import Combine
import Foundation

protocol MainViewModelType {
    func fetchUsersList()
}
/// ViewModel
class MainViewModel {
    
    // MARK: Properties
    private var useCase: MianUseCaseType
    private var dataSource: [JsonPlaceholderModel] = []
    private var cancellables: [AnyCancellable] = []
    private var error: APIError?
    
    var numberOfRows: Int {
        return dataSource.count
    }
    
    init(useCase: MianUseCaseType) {
        self.useCase = useCase
    }
    
}

extension MainViewModel: MainViewModelType{
    typealias Output = AnyPublisher<Result<[JsonPlaceholderModel], APIError>, Never>
    
    func fetchUsersList(){
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        let outPut = useCase.fetchUsersList()
            .map({ (result) -> Result<[JsonPlaceholderModel], APIError> in
                switch result {
                case .success(let users):
                    self.dataSource = users
                    return .success(users)
                case .failure(let error):
                    self.error = error
                    return .failure(error)
                }
            })
            .eraseToAnyPublisher()
    }
}
