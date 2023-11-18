//
//  needLevel.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct needLevel: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        Picker("Need Level", selection: $addExpenceSheetVM.needLevelSelected){
            ForEach(addExpenceSheetVM.needLevel, id:\.self){ need in
                Text(need)
            }
        }.pickerStyle(.segmented)
    }
}

#Preview {
    needLevel(addExpenceSheetVM: AddExpenceSheetVM())
}
