//
//  MainState.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 08.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation

public struct MainState: Codable, Equatable {
    public let startTime: Date
    public var countState: CountState
}

extension MainState {
    static var initial: MainState {
        .init(startTime: Date(), countState: .init())
    }
}
