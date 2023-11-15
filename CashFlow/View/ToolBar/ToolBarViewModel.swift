//
//  ToolBarViewModel.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import Foundation

class ToolBarViewModel: ObservableObject{
    @Published var Icons: [String] = ["house", "clock.arrow.circlepath", "plus", "chart.line.uptrend.xyaxis", "person"]
    @Published var selectedView: String = "house"
    @Published var addTransactionSheet: Bool = false
    
    func SelectView(_ icon: String){
        if icon != "plus"{
            selectedView = icon
        } 
    }
}
