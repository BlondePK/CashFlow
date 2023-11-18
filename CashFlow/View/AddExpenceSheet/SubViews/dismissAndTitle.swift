//
//  dismissAndTitle.swift
//  CashFlow
//
//  Created by joakim simonsen on 17/11/2023.
//

import Foundation
import SwiftUI

struct dismissAndTitle: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            HStack{
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "delete.left")
                        .foregroundStyle(.primaryText)
                }
                Spacer()
            }
            Text("New Transaction")
        }.padding([.bottom, .horizontal])
    }
}
