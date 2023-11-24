//
//  Observed.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import Foundation
import SwiftUI
import SwiftData



class Observed: ObservableObject{
    //MARK: PUBLISHED VARIABLES
    @Published var addTransactionSheet: Bool = false
    
    
}

@Model
class Transaction: Identifiable{
    var id = UUID().uuidString
    
    var amount: Double
    var date: Date
    var transactionTypeSelected: String
    var transactionClassSelected: String
    var needLevelSelected: String
    
    var mainCategory: String
    var categoryName: String
    var icon: String
    var colorInt: Int
    var asset: Bool
    var liability: Bool
    
    var descriptionText: String
    var recurring: Bool
    
    
    init(id: String = UUID().uuidString, amount: Double, date: Date, transactionTypeSelected: String, transactionClassSelected: String, needLevelSelected: String, mainCategory: String, categoryName: String, icon: String, colorInt: Int, asset: Bool, liability: Bool, descriptionText: String, recurring: Bool) {
        self.id = id
        self.amount = amount
        self.date = date
        self.transactionTypeSelected = transactionTypeSelected
        self.transactionClassSelected = transactionClassSelected
        self.needLevelSelected = needLevelSelected
        self.mainCategory = mainCategory
        self.categoryName = categoryName
        self.icon = icon
        self.colorInt = colorInt
        self.asset = asset
        self.liability = liability
        self.descriptionText = descriptionText
        self.recurring = recurring
    }
    
    
   
}


struct category{
    struct subCat{
        var id = UUID().uuidString
        var name: String
        var amount: Double?
        var recurring: Bool?
        var recurringFrequancy: Int?
        var recurringDay: Int?
        
        init(id: String = UUID().uuidString,
             name: String,
             amount: Double? = 0,
             recurring: Bool? = false,
             recurringFrequancy: Int? = 0,
             recurringDay: Int? = 0
        ) {
            self.id = id
            self.name = name
            self.amount = amount
            self.recurring = recurring
            self.recurringFrequancy = recurringFrequancy
            self.recurringDay = recurringDay
        }
    }
    
    var id = UUID().uuidString
    
    var mainCategory: String
    var categoryName: String
    var icon: String
    var colorInt: Int
    var asset: Bool
    var liability: Bool
    var subCategoryArray: [subCat]?
    
    
    init(id: String = UUID().uuidString,
         mainCategory: String,
         categoryName: String,
         icon: String,
         colorInt: Int,
         asset: Bool,
         liability: Bool,
         subCategoryArray: [subCat]? = []
    ) {
        self.id = id
        self.mainCategory = mainCategory
        self.categoryName = categoryName
        self.icon = icon
        self.colorInt = colorInt
        self.asset = asset
        self.liability = liability
        self.subCategoryArray = subCategoryArray
    }
    
}


extension Font{
    static var georgiaFont: Font{
        Font.custom("Georgia", size: 20)
    }
}
