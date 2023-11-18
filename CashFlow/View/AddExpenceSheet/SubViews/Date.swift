//
//  Date.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct dateComponent: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        HStack {
            VStack(alignment:.leading){
                Text("Date")
                    .font(.caption2)
                    .foregroundStyle(.secondaryText)
                Text("\(addExpenceSheetVM.checkDate())")
                    .font(.caption)
                    .foregroundStyle(.primaryText)
            }
            Spacer()
            
            ZStack{
                Image(systemName: "calendar")
                    .font(.title3)
                Image(systemName: "calendar")
                    .font(.title3)
                    .overlay{
                        DatePicker("", selection: $addExpenceSheetVM.date, in: ...Date(), displayedComponents: .date)
                    }.blendMode(.destinationOver)
            }
            
        }.padding(7)
            .overlay{
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.secondaryText)
            }
    }
}

#Preview {
    dateComponent(addExpenceSheetVM: AddExpenceSheetVM())
}
