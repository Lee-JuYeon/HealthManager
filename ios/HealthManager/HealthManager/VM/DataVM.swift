//
//  DataVM.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI

class DataVM: ObservableObject {
    
 
    @Published var currentData : Int = 0
    
}


struct FatModel : Hashable {
    let transFat : Double // 트랜스 지방
    let saturatedFat : Double // 포화 지방
}

struct CarbohydrateModel : Hashable {
    let dietaryFiber : Double // 식이섬유
    let totalSugar : Double // 총 당류
    let includeAddedSugar : Double // 첨가당
}

struct VitaminModel : Hashable {
    let vitaminA : Double // 비타민a
    let vitaminB1 : Double
    let vitaminB2 : Double
    let vitaminB3 : Double
    let vitaminB5 : Double
    let vitaminB6 : Double
    let vitaminB7 : Double
    let vitaminB9 : Double
    let vitaminB12 : Double
    let vitaminC : Double
    let vitaminD : Double
    let vitaminE : Double
    let vitaminK : Double
}
