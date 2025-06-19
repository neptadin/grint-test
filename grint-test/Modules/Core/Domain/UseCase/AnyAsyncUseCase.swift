//
//  AnyAsyncUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class AnyAsyncUseCase<Input, Output>: AsyncUseCase {
    private let _execute: (Input, @escaping (Result<Output, Error>) -> Void) -> Void

    init<U: AsyncUseCase>(_ useCase: U) where U.Input == Input, U.Output == Output {
        self._execute = useCase.execute
    }

    func execute(_ input: Input, _ onCompletion: @escaping (Result<Output, any Error>) -> Void) {
        _execute(input, onCompletion)
    }
}
