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
    @State private var descriptionButton: Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 7)
                .foregroundStyle(.secondaryText)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .opacity(0.5)
            
            ZStack{
                TextField("Description", text: $addExpenceSheetVM.descriptionText)
                    .keyboardType(.default)
                   
                
//                Button{
//                    descriptionButton.toggle()
//                }
//            label: {
//                    HStack{
//                        Text("Descriprion")
//                            .font(.caption)
//                        Spacer()
//                        Image(systemName: "keyboard")
//                    }.padding(10)
//                        .foregroundStyle(.primaryText)
//                        .opacity(descriptionButton == true ? 0 : 1)
//                    
//                }
            }
        }
    }
}

#Preview {
    description(addExpenceSheetVM: AddExpenceSheetVM())
}
