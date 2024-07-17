//
//  NutritionGraphView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutritionGraphView: View {
    private var getHeight: CGFloat
    private var getWidth: CGFloat
    private var getColour : Color
    private var getType : MacroNutrientType
    private var getVM : DataVM
    
    enum MacroNutrientType {
        case carbo
        case protein
        case fat
    }
    
    init(
        setWidth: CGFloat,
        setHeight: CGFloat,
        setColour: Color,
        setType: MacroNutrientType,
        setVM : DataVM
    ){
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getColour = setColour
        self.getType = setType
        self.getVM = setVM
    }
    
    private let calculator = Calculator()
    private func calculateHeight() -> CGFloat {
        let dailyMacroNutrientModel = calculator.dailyMacroNutrients(myBody: getVM.todayMyBodyStateModel)
        let carbs = dailyMacroNutrientModel.totalCarbs()
        let protein = dailyMacroNutrientModel.protein
        let fat = dailyMacroNutrientModel.totalFats()

        let proteinHeight = getHeight * CGFloat(min(setGram(setType: getType) / protein, 1.0))
        let carboHeight = getHeight * CGFloat(min(setGram(setType: getType) / carbs, 1.0))
        let fatHeight = getHeight * CGFloat(min(setGram(setType: getType) / fat, 1.0))
        return switch getType {
        case .carbo :
            carboHeight
        case .protein :
            proteinHeight
        case .fat :
            fatHeight
        }
    }
    
    private func macroNutrientsTitle(setType getType : MacroNutrientType ) -> String {
        return switch getType {
        case .carbo :
            "🌾 Carbs"
        case .protein :
            "💪🏻 Protein"
        case .fat :
            "🧈 Fat"
        }
    }

    private func setGram(setType getType : MacroNutrientType) -> Double {
        return switch getType {
        case .carbo :
            getVM.todayNutitionModel.totalCarbo()
        case .protein :
            getVM.todayNutitionModel.protein
        case .fat :
            getVM.todayNutitionModel.totalFat()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 바깥쪽 사각형
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: getWidth, height: getHeight)
            
            // 안쪽 사각형
            Rectangle()
                .fill(getColour)
                .frame(width: getWidth, height: calculateHeight())
            
            // 텍스트
            VStack {
                Text(macroNutrientsTitle(setType: getType))
                    .font(.system(size: 13, weight: .bold))
                    .padding(EdgeInsets(
                        top: 5, leading: 5, bottom: 5, trailing: 5
                    ))
                Spacer()
            }
            
            // 그램 수 텍스트
            VStack(alignment: HorizontalAlignment.center, spacing: 5){
                Spacer()
                Text("\(setGram(setType: getType), specifier: "%.1f")g")
                    .font(.system(size: 15, weight: .bold))
                    .padding(EdgeInsets(
                        top: 5, leading: 5, bottom: 5, trailing: 5
                    ))
            }
            
            // 최소 권장 선
//            VStack(alignment: HorizontalAlignment.center){
//                HStack(alignment: VerticalAlignment.center, spacing: 5){
//                    Text("\(getMinGram)g")
//                        .font(.system(size: 15, weight: .light))
//                    
//                    Rectangle()
//                        .fill(Color.black)
//                        .frame(
//                            minWidth: 0,
//                            maxWidth: .infinity,
//                            minHeight: 1,
//                            idealHeight: 1,
//                            maxHeight: 1
//                        )
//                }
//                .padding(
//                    EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
//                )
//               
//            }
//            .frame(
//                width: getWidth,
//                height: getHeight
//            )
        }
        .frame(
            width: getWidth,
            height: getHeight
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
       
    }
}
