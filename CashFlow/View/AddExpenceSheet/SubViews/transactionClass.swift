//
//  transactionClass.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct transactionClass: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        ZStack{
            Picker("Transaction Class", selection: $addExpenceSheetVM.transactionClassSelected){
                ForEach(addExpenceSheetVM.transactionClass, id:\.self){ Class in
                    Text(Class)
                }
            }.pickerStyle(.segmented)
        }
    }
}

#Preview {
    transactionClass(addExpenceSheetVM: AddExpenceSheetVM())
}
