//
//  CountState.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation

public struct CountState: Codable, Equatable {
    public let currentCount: Int
    public let lastChange: Date

    public init(currentCount: Int, lastChange: Date) {
        self.currentCount = currentCount
        self.lastChange = lastChange
    }

    public init() {
        currentCount = 0
        lastChange = Date()
    }
}
