//
//  ContentView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var observed = Observed()
    
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(.all)
            
            VStack{
                Spacer()
                ToolBarView(observed: observed)
            }
            
        }.fullScreenCover(isPresented: $observed.addTransactionSheet){
            addExpenceSheetView(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
        }
    }
}

#Preview {
    ContentView(observed: Observed())
}
