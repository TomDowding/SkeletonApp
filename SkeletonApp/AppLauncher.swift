//
//  SkeletonAppApp.swift
//  SkeletonApp
//
//  Created by Tom Dowding on 11/12/2023.
//

import SwiftUI

@main
struct AppLauncher {

    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            LiveApp.main()
        } else {
            TestApp.main()
        }
    }
}

struct LiveApp: App {
        
    var body: some Scene {
        WindowGroup {
            let state = State()
            ContentView(state: state)
        }
    }
}

struct TestApp: App {

    var body: some Scene {
        WindowGroup {
            Text("Running Unit Tests")
        }
    }
}
