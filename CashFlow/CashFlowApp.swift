//
//  CashFlowApp.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI
import SwiftData

@main
struct CashFlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Transaction.self)
    }
}
