//
//  MacroNutrientsViews.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/14/24.
//

import SwiftUI

struct MacroNutrientsViews: View {
    
    private let calculator = Calculator()
    private var minDailyMacroNutrientModel : MacroNutrientsModel = MacroNutrientsModel(
        carbs: CarbohydrateModel(
            dietaryFiber: 0.0,
            totalSugar: 0.0,
            includeAddedSugar: 0.0
        ),
        protein: 0.0,
        fat: FatModel(
            transFat: 0.0,
            saturatedFat: 0.0
        )
    )
    let dummyMyBodyState = MyBodyStateModel(
        currentHeight: 174.0,
        currentWeight: 147.4,
        currentAge: 28,
        currentGender: true,
        goalWeight: 58
    )
    
    private var carboHeight : CGFloat = 50
    private var carboGram : Int = 50
    private var proteinHeight : CGFloat = 100
    private var proteinGram : Int = 100
    private var fatHeight : CGFloat = 20
    private var fatGram : Int = 20

    init(){
        minDailyMacroNutrientModel = calculator.miniumDailyMacroNutrients(myBody: dummyMyBodyState)
    }
    
    var body: some View {
        GeometryReader{ proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            
            HStack(alignment: VerticalAlignment.top, spacing: 10){
                NutritionGraphView(
                 setWidth: width/3,
                 setHeight: height/2,
                 setBarHeight: carboHeight,
                 setColour: Color.green,
                 setTitle: "🌾 Carbs",
                 setGramCount: carboGram,
                 setMinGram: Int(minDailyMacroNutrientModel.carbs.dietaryFiber + minDailyMacroNutrientModel.carbs.includeAddedSugar + minDailyMacroNutrientModel.carbs.totalSugar)

                )
                
                NutritionGraphView(
                 setWidth: width/3,
                 setHeight: height/2,
                 setBarHeight: proteinHeight,
                 setColour: Color.brown,
                 setTitle: "💪🏻 Protein",
                 setGramCount: proteinGram,
                 setMinGram: Int(minDailyMacroNutrientModel.protein)
                )
                
                NutritionGraphView(
                 setWidth: width/3,
                 setHeight: height/2,
                 setBarHeight: fatHeight,
                 setColour: Color.yellow,
                 setTitle: "🧈 Fat",
                 setGramCount: fatGram,
                 setMinGram: Int(
                    minDailyMacroNutrientModel.fat.saturatedFat +
                    minDailyMacroNutrientModel.fat.transFat
                 )
                )
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity
        )
    }
}

