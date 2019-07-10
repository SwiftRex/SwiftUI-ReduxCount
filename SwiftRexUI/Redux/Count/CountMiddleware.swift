//
//  CountMiddleware.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

public class CountMiddleware: Middleware {
    public var handlers: MessageHandler!

    public func handle(event: EventProtocol, getState: @escaping () -> CountState, next: @escaping (EventProtocol, @escaping () -> CountState) -> Void) {
        defer { next(event, getState) }

        guard let event = event as? CountEvent else { return }

        switch event {
        case .minusTap: handlers.actionHandler.trigger(CountAction.decrementCount)
        case .plusTap: handlers.actionHandler.trigger(CountAction.incrementCount)
        }
    }

    public func handle(action: ActionProtocol, getState: @escaping () -> CountState, next: @escaping (ActionProtocol, @escaping () -> CountState) -> Void) {
        next(action, getState)
    }
}
