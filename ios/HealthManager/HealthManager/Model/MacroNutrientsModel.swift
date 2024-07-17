//
//  MacroNutrients.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/13/24.
//

import SwiftUI

struct MacroNutrientsModel : Hashable {
    let carbs: CarbohydrateModel
    let protein: Double
    let fat: FatModel
    

    func totalCarbs() -> Double {
        return carbs.dietaryFiber + carbs.totalSugar + carbs.includeAddedSugar
    }
    
    func totalFats() -> Double{
        return fat.saturatedFat + fat.transFat
    }
}


