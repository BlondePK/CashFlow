//
//  addButtom.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct addButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button{
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
}

#Preview {
    addButton()
}
