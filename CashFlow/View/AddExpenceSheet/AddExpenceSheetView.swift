//
//  AddExpenceSheetView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import SwiftUI

struct addExpenceSheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var date: Date = Date()
    
    @State private var transactionType: [String] = ["Money Inn", "Money Out"]
    @State private var transactionTypeSelected: String = "Money Out"
    
    @State private var transactionClass: [String] = ["Asset", "Liability", "Expence"]
    @State private var transactionClassSelected: String = "Expence"
    
    @State private var needLevel: [String] = ["Essential", "Need", "Want"]
    @State private var needLevelSelected: String = "Want"
    
    @State private var toggle: Bool = false
    
    
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea(.all)
            
            VStack{
                //Dismiss and Top text
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
                }
                Spacer()
                
                //Amount
                HStack(alignment: .firstTextBaseline, spacing: 0){
                    Text("-199")
                        .font(.system(size: 45))
                        .bold()
                    Text(",50 ")
                    Text("KR").foregroundStyle(.secondaryText)
                }.font(.system(size: 38))
                    .foregroundStyle(.primaryText)
                
                //Date
                HStack {
                    VStack(alignment:.leading){
                        Text("Date")
                            .font(.caption2)
                            .foregroundStyle(.secondaryText)
                        Text("Today")
                            .font(.caption)
                    }
                    Spacer()
                    
                    ZStack{
                        Image(systemName: "calendar")
                            .font(.title3)
                        Image(systemName: "calendar")
                            .font(.title3)
                            .overlay{
                                DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                            }.blendMode(.destinationOver)
                    }
                        
                }.padding(7)
                .overlay{
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.secondaryText)
                }
                    
                
                
                //Transaction type (Inn or Our)
                Picker("Transaction Type", selection: $transactionTypeSelected){
                    ForEach(transactionType, id:\.self){ type in
                        Text(type)
                    }
                }.pickerStyle(.segmented)
               
                
                
                //Transaction Class (Asset, Liability or Expence) and NeedLevel
                if transactionTypeSelected != transactionType[0]{
                Picker("Transaction Class", selection: $transactionClassSelected){
                    ForEach(transactionClass, id:\.self){ Class in
                        Text(Class)
                    }
                }.pickerStyle(.segmented)
                
                //Need Level (Essential, Need or want)
                    Picker("Need Level", selection: $needLevelSelected){
                        ForEach(needLevel, id:\.self){ need in
                            Text(need)
                        }
                    }.pickerStyle(.segmented)
                }
                
                //Category
                ZStack{
                    RoundedRectangle(cornerRadius: 7)
                        .foregroundStyle(.secondaryText)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .opacity(0.5)
                    
                    HStack{
                        Text("Category")
                            .font(.caption)
                        Spacer()
                        Image(systemName: "rectangle.stack")
                    }.padding(10)
                }
                
                
                // Description
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
                
                //Recurring
                HStack(alignment: .top){
                    VStack{
                        Image(systemName: "calendar.badge.clock")
                        
                    }
                    VStack(alignment:.leading){
                        Text("Add as recuring")
                            .font(.caption)
                            .bold()
                        Text("This transaction will be added again the following months on the same day as today")
                            .font(.caption2)
                               .multilineTextAlignment(.leading)
                               .lineLimit(3)
                    }
                    Toggle("", isOn: $toggle).labelsHidden()
                }.padding(.top)
                
                Spacer()
                // Add Button
                Button{
                    // ADD Transaction
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.primaryGreen)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                        Text("Add Transaction")
                            .foregroundStyle(Color.secondaryGreen)
                        
                    }
                        
                }
                
            }
        }.padding()
    }
}

#Preview {
    addExpenceSheetView()
}
