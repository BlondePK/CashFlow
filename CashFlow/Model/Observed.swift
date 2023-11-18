//
//  Observed.swift
//  CashFlow
//
//  Created by joakim simonsen on 15/11/2023.
//

import Foundation
import SwiftUI


extension Font{
    static var georgiaFont: Font{
        Font.custom("Georgia", size: 20)
    }
}

class Observed: ObservableObject{
    //MARK: PUBLISHED VARIABLES
    @Published var addTransactionSheet: Bool = false
    
    
    //MARK: FUNCTIONS
    func smallHapticFeedBack(){
        
    }
    
}
