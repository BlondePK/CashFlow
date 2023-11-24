//
//  HistoryView.swift
//  CashFlow
//
//  Created by joakim simonsen on 24/11/2023.
//

import Foundation
import SwiftUI
import SwiftData


struct historyView: View {
    
    @ObservedObject var observed: Observed
    @ObservedObject var addExpenceSheetVM: AddExpenceSheetVM
    @ObservedObject var categories: Categorys
    
    @Environment(\.modelContext) var TransactionData
    @Query var transactions: [Transaction]
    
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea(.all)
            VStack{
                Text("HistoryView")
                    .foregroundStyle(.primaryText)
                Divider()
                
                
                if !transactions.isEmpty{
                    List{
                        ForEach(transactions){transaction in
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 40)
                                        .foregroundStyle(Color(categories.CategoryColors[transaction.colorInt]))
                                    Image(systemName: "\(transaction.icon)")
                                        .foregroundStyle(Color.background)
                                }
                                VStack(alignment: .leading){
                                    
                                    Text("\(transaction.categoryName)")
                                        .bold()
                                        .font(.subheadline)
                                    
                                    
                                    HStack(spacing:0){
                                        Image(systemName:transaction.transactionTypeSelected == "Money Inn" ? "arrow.down" : "arrow.up")
                                            .bold()
                                            .foregroundStyle(transaction.transactionTypeSelected == "Money Inn" ? .green : .red)
                                        
                                        if transaction.transactionTypeSelected != "Money Inn"{
                                            
                                            Text(", ")
                                            if transaction.transactionClassSelected == "Asset"{
                                                Image(systemName: "chart.line.uptrend.xyaxis")
                                                    .foregroundStyle(.green)
                                            }else if transaction.transactionClassSelected == "Liability"{
                                                Image(systemName: "chart.line.downtrend.xyaxis")
                                                    .foregroundStyle(.red)
                                            }else{
                                                Image(systemName: "arrow.right")
                                                    .foregroundStyle(.orange)
                                            }
                                            
                                            if transaction.transactionClassSelected == "Expence"{
                                                if transaction.needLevelSelected == "Essential"{
                                                    Image(systemName: "circle.fill")
                                                        .foregroundStyle(.green)
                                                }else if transaction.needLevelSelected == "Need"{
                                                    Image(systemName: "circle.fill")
                                                        .foregroundStyle(.orange)
                                                }else{
                                                    Text(", ")
                                                    Image(systemName: "circle.fill")
                                                        .foregroundStyle(.red)
                                                }
                                            }
                                        }
                                        
                                    }.font(.caption2)
                                    
                                    Text("\(transaction.descriptionText)")
                                        .font(.caption)
                                        .opacity(0.7)
                                }
                                
                                Spacer()
                                
                                HStack(alignment: .firstTextBaseline, spacing: 0){
                                    Text(transaction.transactionTypeSelected == "Money Inn" ? "" : "-")
                                    Text("\(transaction.amount.formatted(.number))")
                                        .bold()
                                        .font(.title2)
                                    Text(" Kr")
                                }.foregroundStyle(transaction.transactionTypeSelected == "Money Inn" ? .green : .red)
                                
                            }
                            
                            
                        }
                        .onDelete { indexes in
                            for index in indexes{
                                deleteTransaction(transactions[index])
                            }
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                }else{Text("This list is currently emty")}
                
            }
        }
    }
    func deleteTransaction(_ transaction: Transaction){
        TransactionData.delete(transaction)
    }
}

#Preview {
    historyView(observed: Observed(), addExpenceSheetVM: AddExpenceSheetVM(), categories: Categorys())
}
