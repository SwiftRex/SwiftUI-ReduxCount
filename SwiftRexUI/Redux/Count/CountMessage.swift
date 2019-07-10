//
//  CountEvent.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

enum CountEvent: EventProtocol {
    case minusTap
    case plusTap
}

enum CountAction: ActionProtocol {
    case incrementCount
    case decrementCount
}
