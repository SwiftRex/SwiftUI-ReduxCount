//
//  MainStore.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 13.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import CombineRex
import Foundation
import SwiftRex

private let mainReducer = countReducer.lift(\MainState.countState)
private let mainMiddleware = CountMiddleware().lift(\MainState.countState)

typealias MainStore = BindableStore<MainState>
let store = MainStore(
    initialState: .initial,
    reducer: mainReducer,
    middleware: mainMiddleware
)
