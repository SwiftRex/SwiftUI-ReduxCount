//
//  LoggerMiddleware.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 26.02.20.
//  Copyright © 2020 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import os.log
import SwiftRex

public class SimpleMiddleware<Action, State>: Middleware {
    private let handler: (Action, @escaping GetState<State>, AnyActionHandler<Action>, inout AfterReducer) -> Void
    private var getState: GetState<State>?
    private var output: AnyActionHandler<Action>?

    public init(_ handler: @escaping (Action, @escaping GetState<State>, AnyActionHandler<Action>, inout AfterReducer) -> Void) {
        self.handler = handler
    }

    public func receiveContext(getState: @escaping GetState<State>, output: AnyActionHandler<Action>) {
        self.getState = getState
        self.output = output
    }

    public func handle(action: Action, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
        guard let getState = getState, let output = output else { return }
        handler(action, getState, output, &afterReducer)
    }
}

enum Logger {
    static func middleware(actionPrint: @escaping (AppAction) -> String? = { "\($0)" },
                           statePrint: @escaping (AppState) -> String? = { "\($0)" }
    ) -> SimpleMiddleware<AppAction, AppState> {
        .init { action, getState, _, afterReducer in
            let stateBefore = getState()
            afterReducer = .do {
                let stateAfter = getState()

                var enabled = false
                if let actionString = actionPrint(action) {
                    enabled = true
                    os_log(.debug, log: .default, "🕹 %{PUBLIC}@", actionString)
                }

                if stateBefore != stateAfter, let stateString = statePrint(stateAfter) {
                    enabled = true
                    os_log(.debug, log: .default, "🏛 %{PUBLIC}@", stateString)
                } else {
                    os_log(.debug, log: .default, "🏛 No state mutation")
                }

                if enabled {
                    os_log(.debug, log: .default, "")
                }
            }
        }
    }
}
