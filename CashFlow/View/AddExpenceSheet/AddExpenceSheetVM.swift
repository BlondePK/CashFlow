//
//  AddExpenceSheetViewModel.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import Foundation


class AddExpenceSheetVM: ObservableObject{
    @Published var amauntText: Double = 0
    
    @Published var date: Date = Date()
    
    @Published var transactionType: [String] = ["Money Inn", "Money Out"]
    @Published var transactionTypeSelected: String = "Money Out"
    
    @Published var transactionClass: [String] = ["Asset", "Liability", "Expence"]
    @Published var transactionClassSelected: String = "Expence"
    
    @Published var needLevel: [String] = ["Essential", "Need", "Want"]
    @Published var needLevelSelected: String = "Want"
    
    @Published var toggle: Bool = false
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    func checkDate()-> String{
        let selecteDdate = date
        let selecteDay = selecteDdate.formatted(.dateTime.day())
        let selecteMonth = selecteDdate.formatted(.dateTime.month())
        let selecteYear = selecteDdate.formatted(.dateTime.year())
        
        let currentDate = Date()
        let currentDay = currentDate.formatted(.dateTime.day())
        let currentMonth = currentDate.formatted(.dateTime.month())
        let currentYear = currentDate.formatted(.dateTime.year())
        
        let selectedDateString = String("\(selecteDay) " + "\(selecteMonth) " + "\(selecteYear)")
        let currentDateString = String("\(currentDay) " + "\(currentMonth) " + "\(currentYear)")
        
        if currentDateString == selectedDateString{
            return "Today"
        } else {
            return selectedDateString
        }
    }
    
}
