//
//  AsyncUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol AsyncUseCase {
    associatedtype Input
    associatedtype Output

    func execute(_ input: Input, _ onCompletion: @escaping (Result<Output, Error>) -> Void)
}
