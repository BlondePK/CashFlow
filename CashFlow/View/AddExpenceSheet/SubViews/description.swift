//
//  description.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct description: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 7)
                .foregroundStyle(.secondaryText)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .opacity(0.5)
            
            HStack{
                Text("Description")
                    .font(.caption)
                Spacer()
                Image(systemName: "keyboard")
            }.padding(10)
        }
    }
}

#Preview {
    description(addExpenceSheetVM: AddExpenceSheetVM())
}
