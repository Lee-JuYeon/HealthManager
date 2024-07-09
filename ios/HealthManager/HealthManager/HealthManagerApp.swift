//
//  HealthManagerApp.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI

@main
struct HealthManagerApp: App {
    
    @StateObject private var screenVM = ScreenVM()
    @StateObject private var dataVM = DataVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(screenVM)
                .environmentObject(dataVM)
        }
    }
}
