//
//  NutritionView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

/*
 하루 최소 섭취 권장량
 현재 섭취량
 현재 섭취량을 칼로리로 변환
 */



struct NutritionView : View {
    
    let dummyMyBodyState = MyBodyStateModel(
        currentHeight: 174.0,
        currentWeight: 147.4,
        currentAge: 28,
        currentGender: true,
        goalWeight: 58
    )
    
    @EnvironmentObject private var dataVM : DataVM
    private var carboHeight : CGFloat = 50
    private var carboGram : Int = 50
    private var proteinHeight : CGFloat = 100
    private var proteinGram : Int = 100
    private var fatHeight : CGFloat = 20
    private var fatGram : Int = 20

    //  영양성분 체크 (식단, 영양제)
    @State private var eatKcal = 0
    
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
    
    init(){
        minDailyMacroNutrientModel = calculator.miniumDailyMacroNutrients(myBody: dummyMyBodyState)
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                GradationTextView(
                    setTitleText: "영양정보",
                    setColors: [.blue, .green],
                    setFontSize: 40,
                    setFontWeight: .bold
                )
                
                Image("globe")
                    .resizable()
                    
            }
            
            KcalGraphView(
                setMyBodyStateModel: dummyMyBodyState,
                setKcal: 1520.0
            )
            
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
        .padding(50)
    }
}

#Preview {
    NutritionView()
}
