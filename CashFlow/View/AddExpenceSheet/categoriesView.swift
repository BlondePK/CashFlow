//
//  AmountAsseet.swift
//  CashFlow
//
//  Created by joakim simonsen on 16/11/2023.
//


import SwiftUI

struct categoriesView: View {
    @ObservedObject var categories: Categorys
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    
    @Environment(\.dismiss) var dismiss
    
    
    let columns = [
        GridItem(.adaptive(minimum: 75))
    ]
    
    
    var body: some View {
        ZStack{
            VStack{
                
                //Title and backButton
                
                ZStack{
                    Button{
                        addExpenceSheetVM.categorySheet.toggle()
                    }label: {
                        HStack{
                            Image(systemName: "delete.left")
                                .foregroundColor(Color.primaryText)
                            Spacer()
                        }
                    }
                    Text("Categories")
                        .font(.title2)
                        .foregroundStyle(.primaryText)
                }
                
                //Search Field
                
                   
                //Categories
                ScrollView{
                    ForEach(0..<categories.AllCatgegories.count, id: \.self){i in
                        let subCat = categories.AllCatgegories[i]
                        
                        VStack{
                            HStack{
                                Text("\(subCat[0].mainCategory)")
                                    .font(.subheadline)
                                Spacer()
                            }.padding(.top,10)
                            Divider().padding(.vertical,10)
                            
                            LazyVGrid(columns: columns, alignment: .center, spacing: 25){
                                ForEach(0..<subCat.count, id: \.self){ s in
                                    Button{
                                        //Button action--
                                        categories.categorySelected = subCat[s]
                                        categories.isCategorySelected = true
                                        addExpenceSheetVM.categorySheet.toggle()
                                        
                                        
                                    }label: {
                                        VStack{
                                            ZStack{
                                                Circle()
                                                    .frame(width: 45, alignment: .center)
                                                    .foregroundStyle(categories.CategoryColors[subCat[s].colorInt])
                                                
                                                Image(systemName: "\(subCat[s].icon)")
                                                    .font(.subheadline)
                                                    .foregroundStyle(Color.white)
                                            }
                                            Text(subCat[s].categoryName)
                                                .font(.caption2)
                                                .foregroundStyle(Color.primaryText)
                                                
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .padding([.bottom, .horizontal])
            .background(.ultraThinMaterial)
            
        }
        .onAppear{
            if categories.AllCatgegories.isEmpty{
                categories.combineAllCategories()
            }
        }.ignoresSafeArea(edges: .bottom)
        
    }
}

#Preview {
    categoriesView(categories: Categorys(), addExpenceSheetVM: AddExpenceSheetVM())
}
