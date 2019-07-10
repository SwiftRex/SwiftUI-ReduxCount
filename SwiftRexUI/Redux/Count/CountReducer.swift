//
//  CountReducer.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

let countReducer = Reducer<CountState> { state, action in
    guard let action = action as? CountAction else { return state }
    switch action {
    case .incrementCount:
        return CountState(currentCount: state.currentCount + 1, lastChange: Date())
    case .decrementCount:
        return CountState(currentCount: state.currentCount - 1, lastChange: Date())
    }
}
