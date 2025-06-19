//
//  AsyncUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol AsyncUseCase {
    associatedtype Input
    associatedtype Output
    associatedtype Error: Swift.Error

    func execute(_ input: Input) async -> Result<Output, Error>
}
