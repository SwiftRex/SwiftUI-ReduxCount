//
//  MainStore.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 08.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Combine
import CombineRex
import Foundation
import SwiftRex
import SwiftUI

@dynamicMemberLookup
public final class MainStore: StoreBase<MainState>, BindableObject {
    private let subject: CurrentValueSubject<MainState, Never>
    public let didChange: AnyPublisher<Void, Never>

    public init<M: Middleware>(initialState: MainState, reducer: Reducer<MainState>, middleware: M)
        where M.StateType == MainState {

        subject = CurrentValueSubject<MainState, Never>(initialState)
        didChange = subject.map { _ in }.eraseToAnyPublisher()
        super.init(subject: ReplayLastSubjectType(currentValueSubject: subject), reducer: reducer, middleware: middleware)
    }
}

extension MainStore {
    public subscript<T>(dynamicMember keyPath: KeyPath<MainState, T>) -> T {
        subject.value[keyPath: keyPath]
    }
}

let store = MainStore(
    initialState: .init(startTime: Date(), countState: .init()),
    reducer: mainReducer,
    middleware: mainMiddleware
)
