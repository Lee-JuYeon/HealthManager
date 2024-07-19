//
//  NutritionModel.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutrientsModel : Hashable {
    var calrories : Double // 열량, 칼로리
    var protein : Double // 단백질
    var carbo : CarbohydrateModel // 탄수화물
    var fat : FatModel // 지방
    var sodium : Double // 나트륨
    var cholesterol : Double // 콜레스테롤
    var iron : Double // 철분
    var calcium : Double // 칼슘
    var potassium : Double // 칼륨
    var vitamin : VitaminModel // 비타민
    
    func totalCarbo() -> Double {
        return carbo.dietaryFiber + carbo.totalSugar + carbo.includeAddedSugar
    }
    
    func totalFat() -> Double{
        return fat.saturatedFat + fat.transFat
    }
}
