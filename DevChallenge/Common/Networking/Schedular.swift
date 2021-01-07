//
//  Schedular.swift
//  DevChallenge
//
//  Created by Muhammad Usman on 07/01/2021.
//

import Combine
import Foundation

// MARK: - Class

/// Scheduler class to manage Background Oprations
final class Scheduler {
    static let mainScheduler = RunLoop.main

    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()
}
