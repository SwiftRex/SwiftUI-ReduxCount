//
//  Button+Extension.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import SwiftRex
import SwiftUI

extension Button where Label == Text {
    public init<S, StoreType: Store>(_ title: S, store: StoreType, event: EventProtocol) where S : StringProtocol {
        self = Button(title) { store.eventHandler.dispatch(event) }
    }
}
