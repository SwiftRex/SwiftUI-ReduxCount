//
//  CountMiddleware.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 10.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import Foundation
import SwiftRex

/// Main app middleware. Its input type is UserInputAction, meaning that every UI event coming from the user will reach this middleware.
/// In response, this middleware will dispatch actions of type CountAction to the store.
/// Because we don't need to read the state from this middleware, we can set it to Void (it could be CountState if we wanted).
public class CountMiddleware: Middleware {
    public typealias InputActionType = UserInputAction
    public typealias OutputActionType = CountAction
    public typealias StateType = Void // It could be CountState, but this middleware doesn't care about the state actually

    private var output: AnyActionHandler<CountAction>?

    // This is called as soon as the Store configures this Middleware, we can persist these useful parameters
    // However, getState we will ignore because this middleware doesn't need to read the state
    public func receiveContext(getState: @escaping () -> Void, output: AnyActionHandler<CountAction>) {
        self.output = output
        // self.getState = getState --> We don't need to do that because we don't care about the state
    }

    public func handle(action: UserInputAction, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
        // This example is very silly, we wouldn't need a middleware for that.
        // It's only translating Events into Actions. In real-life scenarios this would be a good
        // place to start side-effects and dispatch new actions as the async tasks complete.

        // Our InputActionType is UserInputAction, so this is what we `switch` over
        // Our OutputActionType is CountAction, so this is what we can dispatch
        // These types can be different, or they can point to the same
        switch action {
        case .minusTap:
            output?.dispatch(CountAction.decrementCount)
        case .plusTap:
            output?.dispatch(CountAction.incrementCount)
        }

        // Parameter `dispatcher` gives you insight about who originated this action (presenters, views, other middlewares)
        // This is useful for logs, analytics and debugging

        // Parameter `afterReducer` is useful if you want to execute tasks after your state has been reduced by your reducers.
        // For example:
        // ```
        // afterReducer = .do {
        //     if self.getState().somethingThatHasBeenReducedAlready.shouldExecuteRequest {
        //         URLSession.shared.dataTask(with: someURL) { data, _, _ in
        //             self.output?.dispatch(.someAction(data))
        //         }
        //     }
        // }
        // ```
        //
        // In this case this is useless because we don't care about the state AT ALL (before or after reducers).
        // But sometimes we need to access state information after the reducer and our middleware logic can be inside
        // the afterReducer's do block. By default this is set to .doNothing()
    }
}
