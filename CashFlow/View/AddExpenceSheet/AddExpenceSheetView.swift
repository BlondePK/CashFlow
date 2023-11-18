//
//  AddExpenceSheetView.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//


import SwiftUI

struct addExpenceSheetView: View {
    @StateObject var addExpenceSheetVM = AddExpenceSheetVM()
    @StateObject var categories = Categorys()
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
                dismissAndTitle()
                
                //Amount -- Need to find a way to extract this view to sub view
                ZStack{
                    TextField("", value: $addExpenceSheetVM.amauntText, format: .number)
                        .focused($focusedField, equals: .amauntText)
                        .keyboardType(.decimalPad)
                        .opacity(0)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0){
                        Text("\(addExpenceSheetVM.amauntText ?? 0, specifier: "%.2f")")
                            .font(.system(size: focusedField == .amauntText ? 55 : 45))
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
                        addExpenceSheetVM.amauntText = 0
                        focusedField = . amauntText
                    }
                }
                
                ZStack{
                    VStack{
                        //Date
                        dateComponent(addExpenceSheetVM: addExpenceSheetVM)
                        
                        //Transaction type (Inn or Our)
                        transactionType(addExpenceSheetVM: addExpenceSheetVM)
                        
                        //Transaction Class (Asset, Liability or Expence) and NeedLevel
                        if addExpenceSheetVM.transactionTypeSelected != addExpenceSheetVM.transactionType[0]{
                            
                            transactionClass(addExpenceSheetVM: addExpenceSheetVM)
                            
                            //Need Level (Essential, Need or want)
                            needLevel(addExpenceSheetVM: addExpenceSheetVM)
                        }
                        
                        //Category
                        categorie(addExpenceSheetVM: addExpenceSheetVM, categories: categories)
                        
                        // Description
                        description(addExpenceSheetVM: addExpenceSheetVM)
                        
                        //Recurring
                        recuring(addExpenceSheetVM: addExpenceSheetVM)
                        
                        Spacer()
                        
                        // Add Button
                        addButton(dismiss: _dismiss)
                        
                    }.padding([.bottom, .horizontal])
                    if focusedField == .amauntText{
                        Rectangle()
                            .ignoresSafeArea(edges: .bottom)
                            .background(.ultraThinMaterial)
                            .opacity(0.6)
                            .onTapGesture {
                                focusedField = nil
                                if !categories.isCategorySelected{
                                    categories.AllCatgegories = []
                                    addExpenceSheetVM.categorySheet.toggle()
                                }
                            }
                    }
                }
                
            }
            
            if addExpenceSheetVM.categorySheet{
                categoriesView(categories: categories, addExpenceSheetVM: addExpenceSheetVM)
            }
            
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    addExpenceSheetView(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}


