//
//  NutritionModel.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutrientsModel : Hashable {
    let calrories : Double // 열량, 칼로리
    let protein : Double // 단백질
    let carbo : CarbohydrateModel // 탄수화물
    let fat : FatModel // 지방
    let sodium : Double? // 나트륨
    let cholesterol : Double? // 콜레스테롤
    let iron : Double? // 철분
    let calcium : Double? // 칼슘
    let potassium : Double? // 칼륨
    let vitamin : VitaminModel? // 비타민
    
    func totalCarbo() -> Double {
        return carbo.dietaryFiber + carbo.totalSugar + carbo.includeAddedSugar
    }
    
    func totalFat() -> Double{
        return fat.saturatedFat + fat.transFat
    }
}
