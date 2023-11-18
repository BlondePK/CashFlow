//
//  recuring.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct recuring: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        HStack(alignment: .top){
            VStack{
                Image(systemName: "calendar.badge.clock")
                
            }
            VStack(alignment:.leading){
                Text("Add as recuring")
                    .font(.caption)
                    .bold()
                Text("This transaction will be added again the following months on the same day as today")
                    .font(.caption2)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            Toggle("", isOn: $addExpenceSheetVM.toggle).labelsHidden()
        }.padding(.top)
    }
}

#Preview {
    recuring(addExpenceSheetVM: AddExpenceSheetVM())
}
