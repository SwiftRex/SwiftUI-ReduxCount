//
//  MainReducer.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 08.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

let mainReducer = countReducer.lift(\MainState.countState)
