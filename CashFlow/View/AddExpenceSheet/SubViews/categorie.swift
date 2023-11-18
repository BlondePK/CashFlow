//
//  categorie.swift
//  CashFlow
//
//  Created by joakim simonsen on 18/11/2023.
//

import Foundation
import SwiftUI

struct categorie: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    @ObservedObject var categories: Categorys
    var body: some View {
        Button{
            categories.AllCatgegories = []
            addExpenceSheetVM.categorySheet.toggle()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 7)
                    .foregroundStyle(.secondaryText)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .opacity(0.5)
                
                HStack{
                    Text(categories.isCategorySelected ? categories.categorySelected.categoryName : "Category")
                        .font(.caption)
                        .foregroundStyle(.primaryText)
                    Spacer()
                    Image(systemName: categories.isCategorySelected ? categories.categorySelected.icon : "rectangle.stack")
                        .foregroundColor(.primaryText)
                }.padding(10)
            }
        }
    }
}

#Preview {
    categorie(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}
