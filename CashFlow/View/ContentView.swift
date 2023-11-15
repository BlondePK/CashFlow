//
//  ContentView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var observed: Observed
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack{
                Spacer()
                ToolBarView(toolBarViewModel: ToolBarViewModel(), observed: observed)
            }
            
        }.sheet(isPresented: $observed.addTransactionSheet){
            addExpenceSheetView()
        }
    }
}

#Preview {
    ContentView(observed: Observed())
}
