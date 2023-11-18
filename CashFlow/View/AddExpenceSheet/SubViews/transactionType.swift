//
//  transactionType.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct transactionType: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        ZStack{
            Picker("Transaction Type", selection: $addExpenceSheetVM.transactionTypeSelected){
                ForEach(addExpenceSheetVM.transactionType, id:\.self){ type in
                    Text(type)
                }
            }.pickerStyle(.segmented)
        }
    }
}

#Preview {
    transactionType(addExpenceSheetVM: AddExpenceSheetVM())
}
