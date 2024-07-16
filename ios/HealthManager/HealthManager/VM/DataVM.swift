//
//  DataVM.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI
import Combine

class DataVM: ObservableObject {
    
 
    @Published var todayNutitionModel : NutrientsModel? = nil
    @Published var todayMyBodyStateModel : MyBodyStateModel
    
    init(){
        // gender : true = 남자, false = 여자.
        todayMyBodyStateModel = MyBodyStateModel(
            currentHeight: 174.0,
            currentWeight: 147.4,
            currentAge: 28,
            currentGender: true,
            goalWeight: 58
        )
        
        
    }
    
   
    func updateNutritents(setModel getModel : NutrientsModel){
        todayNutitionModel = getModel
    }
    
    func updateMyBodyStateModel(setModel getModel : MyBodyStateModel){
        todayMyBodyStateModel = getModel
    }
}
