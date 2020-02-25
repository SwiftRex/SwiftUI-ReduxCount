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
    public init<S, SomeStore: StoreType>(
        _ title: S,
        store: SomeStore,
        event: SomeStore.ActionType
    ) where S : StringProtocol {
        self = Button(title) { store.dispatch(event) }
    }
}
