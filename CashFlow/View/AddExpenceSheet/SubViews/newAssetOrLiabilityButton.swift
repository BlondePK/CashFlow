//
//  newAssetOrLiabilityButton.swift
//  CashFlow
//
//  Created by joakim simonsen on 23/11/2023.
//

import Foundation
import SwiftUI

struct newAssetOrLiabilityButton: View {
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    @ObservedObject var categories: Categorys
    var body: some View {
        if !isItNew(categories.categorySelected){
            Button{
                //
            }label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 7)
                        //.foregroundStyle(.secondaryText)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        //.opacity(0.5)
                    
                    
                    HStack(spacing:0){
                        Text("Add new ")
                        if addExpenceSheetVM.transactionClassSelected == addExpenceSheetVM.transactionClass[0]{
                            Text("Asset?")
                        }else{
                            Text("Liability?")
                        }
                        Spacer()
                        
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(Color.background)
                    }
                    .font(.caption2)
                    .padding(.horizontal, 10)
                    .foregroundStyle(Color.background)
                }
            }
        }
    }
    
    
    func isItNew(_ cat: category) -> Bool{
        if categories.isCategorySelected{
            var catSelected = cat
            
            // if Money inn is not selected
            if addExpenceSheetVM.transactionTypeSelected != addExpenceSheetVM.transactionType[0]{
                //if Asset is selected
                if addExpenceSheetVM.transactionClassSelected == addExpenceSheetVM.transactionClass[0]{
                    //if Assets is not emty
                    if !categories.Assets.isEmpty{
                        // Loop over all Assets
                        for a in (0..<categories.Assets.count){
                            // checking if selected asset is in Array
                            if categories.Assets[a].categoryName == cat.categoryName{
                                //if it is there, return true
                                return true
                            }else{
                                //if it is not there, return false = showing "add new Asset"
                                return false
                            }
                        }
                    }
                    
                    
                    
                } else if addExpenceSheetVM.transactionClassSelected == addExpenceSheetVM.transactionClass[1]{
                    //if Liabilities is not emty
                    if !categories.Liabilities.isEmpty{
                        // Loop over all Liabilities
                        for l in (0..<categories.Liabilities.count){
                            // checking if selected Liabilities is in Array
                            if categories.Liabilities[l].categoryName == cat.categoryName{
                                //if it is there, return true
                                return true
                            }else{
                                //if it is not there, return false = showing "add new Asset"
                                return false
                            }
                        }
                    } else {
                        return false
                    }
                }
            }
            // if money inn is not selected
            
            
        }
         
        return true
    }
}

#Preview {
    newAssetOrLiabilityButton(addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}
