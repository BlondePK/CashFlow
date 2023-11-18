//
//  descriprionSheet.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct descriptionSheetView: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea(.all)
            TextField("Add Description Here", text: $addExpenceSheetVM.descriptionText)
                .multilineTextAlignment(.leading)
                .keyboardType(.default)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
        }
    }
}

#Preview {
    descriptionSheetView(addExpenceSheetVM: AddExpenceSheetVM())
}
