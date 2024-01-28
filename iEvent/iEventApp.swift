//
//  iEventApp.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//

import SwiftUI
import SwiftData

@main
struct iEventApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Event.self)
    }
}
