//
//  CashFlowApp.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI

@main
struct CashFlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(observed: Observed())
        }
    }
}
