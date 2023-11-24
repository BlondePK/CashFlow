//
//  ContentView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var observed = Observed()
    @StateObject var toolBarModel = ToolBarViewModel()
    @StateObject var addExpenceSheetVM = AddExpenceSheetVM()
    @StateObject var categories = Categorys()
    @Environment(\.modelContext) var TransactionData
    @Query var transactions: [Transaction]
    
    var body: some View {
        ZStack {
            
            //Views
            if toolBarModel.selectedView == "house"{
                // Home View
            }else if toolBarModel.selectedView == "clock.arrow.circlepath"{
                historyView(observed: observed, addExpenceSheetVM: addExpenceSheetVM, categories: categories)
            }else if toolBarModel.selectedView == "chart.line.uptrend.xyaxis"{
                //
            }else if toolBarModel.selectedView == "person"{
                //profil View
            }
                
            
            VStack{
                Spacer()
                ToolBarView(toolBarViewModel: toolBarModel, observed: observed)
            }
            
        }.fullScreenCover(isPresented: $observed.addTransactionSheet){
            addExpenceSheetView(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
        }
    }
}

#Preview {
    ContentView(observed: Observed(), toolBarModel: ToolBarViewModel())
}
