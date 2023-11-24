//
//  addButtom.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI
import SwiftData

struct addButton: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var TransactionData
    
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    @ObservedObject var categories: Categorys
    var body: some View {
        Button{
            addTransaction()
            resetTransaction()
            dismiss()
            
        }
    label: {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.primaryGreen)
                .frame(maxWidth: .infinity, maxHeight: 50)
            Text("Add Transaction")
                .foregroundStyle(Color.secondaryGreen)
            
        }
    }
    }
    
    func addTransaction() {
        let mainCategory = categories.categorySelected.mainCategory
        let categoryName = categories.categorySelected.categoryName
        let icon = categories.categorySelected.icon
        let iconColor = categories.categorySelected.colorInt
        let asset = categories.categorySelected.asset
        let liability = categories.categorySelected.liability
        
        let amount = addExpenceSheetVM.amauntText ?? 0
        let date = addExpenceSheetVM.date
        let transactionType = addExpenceSheetVM.transactionTypeSelected
        let transactionClass = addExpenceSheetVM.transactionClassSelected
        let needLevel = addExpenceSheetVM.needLevelSelected
        let recurring = addExpenceSheetVM.recurring
        let descriptionText = addExpenceSheetVM.descriptionText
        
        let newTransaction = Transaction(amount: amount, date: date, transactionTypeSelected: transactionType, transactionClassSelected: transactionClass, needLevelSelected: needLevel, mainCategory: mainCategory, categoryName: categoryName, icon: icon, colorInt: iconColor, asset: asset, liability: liability, descriptionText: descriptionText, recurring: recurring)
        
        TransactionData.insert(newTransaction)
        
    }
    
    func resetTransaction(){
        
    }
    
}

#Preview {
    addButton(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}
