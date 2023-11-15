//
//  ToolBarView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI

struct ToolBarView: View {
    @StateObject var toolBarViewModel: ToolBarViewModel
    @ObservedObject var observed = Observed()
    var body: some View {
        VStack{
            //DIVIDER
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.6)
                .foregroundStyle(.secondaryText)
            
            
            //TOOLBAR
            HStack{
                ForEach(toolBarViewModel.Icons, id:\.self){ icon in
                    Button{
                        if icon != "plus"{
                            toolBarViewModel.SelectView(icon)
                        }else{
                            observed.addTransactionSheet.toggle()
                        }
                    }label: {
                        VStack(alignment: .center, spacing: 0) {
                            //ICON
                            Image(systemName: icon)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .foregroundStyle(icon == "plus" ? .secondaryGreen : .primaryText)
                                .background(Circle().foregroundStyle(icon == "plus" ? Color.primaryGreen : Color.background))
                                .font(toolBarViewModel.selectedView == icon ? .title2 : .title3)
                            
                            //Dot to indicate screen
                            if toolBarViewModel.selectedView == icon{
                                Circle()
                                    .frame(maxWidth: 5)
                                    .foregroundStyle(.primaryGreen)
                            }
                            
                        }
                    }
                }
                
            }.padding(.horizontal)
        }
        
    }
    
}

#Preview {
    ToolBarView(toolBarViewModel: ToolBarViewModel(), observed: Observed())
}

