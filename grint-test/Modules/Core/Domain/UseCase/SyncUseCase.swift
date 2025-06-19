//
//  SyncUseCase.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

protocol SyncUseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) -> Output?
}
