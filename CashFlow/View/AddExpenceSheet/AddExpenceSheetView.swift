//
//  AddExpenceSheetView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//


import SwiftUI

struct addExpenceSheetView: View {
    @StateObject var addExpenceSheetVM: AddExpenceSheetVM
    @StateObject var categories: Categorys
    
    @Environment(\.dismiss) var dismiss
    
    enum FocusedField{
        case amauntText
    }
    @FocusState private var focusedField: FocusedField?
    
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
                    ZStack{
                        TextField("", value: $addExpenceSheetVM.amauntText, formatter: addExpenceSheetVM.numberFormatter)
                            .focused($focusedField, equals: .amauntText)
                            .keyboardType(.decimalPad)
                            .opacity(0)
                        
                        HStack(alignment: .firstTextBaseline, spacing: 0){
                            Text("\(addExpenceSheetVM.amauntText, specifier: "%.2f")")
                                .font(.system(size: 45))
                                .bold()
                            Text(" KR").foregroundStyle(.secondaryText)
                        }.font(.system(size: 35))
                            .foregroundStyle(.primaryText)
                    }
                    .onAppear{
                        focusedField = .amauntText
                    }
                    .onTapGesture {
                        if focusedField == .amauntText{
                            focusedField = nil
                        } else {
                            focusedField = . amauntText
                        }
                    }
                    
                    
                    
                    
                    //Date
                    HStack {
                        VStack(alignment:.leading){
                            Text("Date")
                                .font(.caption2)
                                .foregroundStyle(.secondaryText)
                            Text("\(addExpenceSheetVM.checkDate())")
                                .font(.caption)
                                .foregroundStyle(.primaryText)
                        }
                        Spacer()
                        
                        ZStack{
                            Image(systemName: "calendar")
                                .font(.title3)
                            Image(systemName: "calendar")
                                .font(.title3)
                                .overlay{
                                    DatePicker("", selection: $addExpenceSheetVM.date, in: ...Date(), displayedComponents: .date)
                                }.blendMode(.destinationOver)
                        }
                        
                    }.padding(7)
                        .overlay{
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.secondaryText)
                        }
                    
                    
                    
                    //Transaction type (Inn or Our)
                    Picker("Transaction Type", selection: $addExpenceSheetVM.transactionTypeSelected){
                        ForEach(addExpenceSheetVM.transactionType, id:\.self){ type in
                            Text(type)
                        }
                    }.pickerStyle(.segmented)
                    
                    
                    
                    //Transaction Class (Asset, Liability or Expence) and NeedLevel
                    if addExpenceSheetVM.transactionTypeSelected != addExpenceSheetVM.transactionType[0]{
                        Picker("Transaction Class", selection: $addExpenceSheetVM.transactionClassSelected){
                            ForEach(addExpenceSheetVM.transactionClass, id:\.self){ Class in
                                Text(Class)
                            }
                        }.pickerStyle(.segmented)
                        
                        //Need Level (Essential, Need or want)
                        Picker("Need Level", selection: $addExpenceSheetVM.needLevelSelected){
                            ForEach(addExpenceSheetVM.needLevel, id:\.self){ need in
                                Text(need)
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    //Category
                    Button{
                        addExpenceSheetVM.categorySheet.toggle()
                    }label: {
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
                        Toggle("", isOn: $addExpenceSheetVM.toggle).labelsHidden()
                    }.padding(.top)
                    
                    Spacer()
                    // Add Button
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
                    
                }.padding()
                .ignoresSafeArea(.keyboard)
                .sheet(isPresented: $addExpenceSheetVM.categorySheet){
                    categoriesView()
                }
        }
    }
}

#Preview {
    addExpenceSheetView(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}
