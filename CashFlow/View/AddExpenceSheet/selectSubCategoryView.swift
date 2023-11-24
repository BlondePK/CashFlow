//
//  selectSubCategoryView.swift
//  CashFlow
//
//  Created by joakim simonsen on 23/11/2023.
//

import Foundation
import SwiftUI

struct selectSubCategoryView: View {
    @ObservedObject var categories: Categorys
    var body: some View {
        ZStack{
            Color.background
            
            
            VStack{
                
                ScrollView{
                    LazyVStack{
                        
                        ForEach(0..<categories.Liabilities.count, id: \.self){ i in
                            let sub = categories.Liabilities[i].subCategoryArray
                            ForEach(0..<sub!.count, id: \.self){s in
                                Text("\(sub![s].name)")
                            }
                        }
                        HStack{
                            Text("Add New")
                            Spacer()
                            Image(systemName: "plus")
                        }.padding(.horizontal, 10)
                    }
                }
            }
            
        }
        .ignoresSafeArea(.all)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    selectSubCategoryView(categories: Categorys())
}
