//
//  AppState.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 08.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation

public struct AppState: Codable, Equatable {
    public let startTime: Date
    public var countState: CountState
}

extension AppState {
    static var initial: AppState {
        .init(startTime: Date(), countState: .init())
    }
}
