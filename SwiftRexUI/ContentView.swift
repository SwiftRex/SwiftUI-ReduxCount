//
//  ContentView.swift
//  SwiftRexUI
//
//  Created by Luiz Rodrigo Martins Barbosa on 08.07.19.
//  Copyright © 2019 Luiz Rodrigo Martins Barbosa. All rights reserved.
//

import CombineRex
import SwiftUI

struct ContentView : View {
    /*
     * Store can be inject using @ObjectBinding
     * (injects only for this view, but you can pass it around)

     ContentView.swift:
         `@ObjectBinding var store: MainStore`
     SceneDelegate.swift:
         `ContentView(store: store)`

     * ---

     * Or using @EnvironmentObject
     * (injects for the whole view hierarchy)

     ContentView:
         `@EnvironmentObject var store: MainStore`
     SceneDelegate:
         `ContentView().environmentObject(store)`
     */
    @ObservedObject var store: ObservableViewModel<UserInputAction, AppState>

    var body: some View {
        VStack {
            HStack {
                Text("Start time:")
                Text("\(DateFormatter.localizedString(from: store.state.startTime, dateStyle: .short, timeStyle: .medium))")
            }

            HStack {
                // With this convenient extension you don't need closures. Please find it at `Button+Extension.swift`
                Button("🔽", store: store, event: .minusTap)
                
                Text("\(store.state.countState.currentCount)")
                Text("since")
                Text("\(DateFormatter.localizedString(from: store.state.countState.lastChange, dateStyle: .short, timeStyle: .medium))")

                // Without the extension is not so bad too
                Button("🔼") {
                    self.store.dispatch(.plusTap)
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: .mock(state: .initial))

            ContentView(store: .mock(state: AppState(
                startTime: Date.distantPast,
                countState: CountState(currentCount: 42, lastChange: Date())
            )))
        }
    }
}
#endif
