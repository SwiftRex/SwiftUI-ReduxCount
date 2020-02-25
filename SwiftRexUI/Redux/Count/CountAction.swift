//
//  CountAction.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

/// App Actions that will run through the Store in order to trigger side-effects or help reducing the state
public enum CountAction {
    case incrementCount
    case decrementCount
}
