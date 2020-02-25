//
//  CountReducer.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

/// Main app reducer. Given some action and current state, calculates the new state
let countReducer = Reducer<CountAction, CountState> { action, state in
    switch action {
    case .incrementCount:
        return CountState(currentCount: state.currentCount + 1, lastChange: Date())
    case .decrementCount:
        return CountState(currentCount: state.currentCount - 1, lastChange: Date())
    }
}
