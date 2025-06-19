//
//  AnySyncUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class AnySyncUseCase<Input, Output>: SyncUseCase {
    private let _execute: (Input) -> Output?

    init<U: SyncUseCase>(_ useCase: U) where U.Input == Input, U.Output == Output {
        _execute = useCase.execute
    }
    
    func execute(_ input: Input) -> Output? {
        _execute(input)
    }
}
