//
//  FavouriteFoodItem.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FavouriteFoodItem : View {
    private var getFoodModel : FoodModel
    
    init(
        setFoodModel : FoodModel
    ){
        self.getFoodModel = setFoodModel
    }
    
    enum MacroNutrientType {
        case carbo
        case protein
        case fat
    }
    
    private func macroNutrientsColour(setType getType : MacroNutrientType ) -> Color {
        return switch getType {
        case .carbo :
            Color.green
        case .protein :
            Color.brown
        case .fat :
            Color.yellow
        }
    }
    
    private func graphBar(
        setProxyReader getProxyReader : GeometryProxy,
        setGram getGram : Double,
        setType getType : MacroNutrientType
    ) -> some View {
        let width = getProxyReader.size.width / 3
        let height = getProxyReader.size.height
        return ZStack(alignment: .leading){
            
            Rectangle()
                .fill(macroNutrientsColour(setType: getType))
                .frame(
                    width: calculateWidth(totalWidth: width, getGram: getGram, type: getType),
                    height: height
                )
            
            Text("\(getGram, specifier: "%.1f")g")
                .font(.system(size: 10, weight: .regular))
                .padding(
                    EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: 0)
                )
        }
        .frame(
            width: width,
            height: height,
            alignment: .leading
        )
        .background(
            Rectangle()
                .fill(Color.gray.opacity(0.2))
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
    
    @EnvironmentObject private var dataVM : DataVM
    private let calculator = Calculator()
    private func calculateWidth(totalWidth: CGFloat, getGram : Double, type : MacroNutrientType) -> CGFloat {
        let dailyMacroNutrientModel = calculator.dailyMacroNutrients(myBody: dataVM.todayMyBodyStateModel)
        let carbs = dailyMacroNutrientModel.totalCarbs()
        let protein = dailyMacroNutrientModel.protein
        let fat = dailyMacroNutrientModel.totalFats()

        let proteinWidth = totalWidth * CGFloat(min(getGram / protein, 1.0))
        let carboWidth = totalWidth * CGFloat(min(getGram / carbs, 1.0))
        let fatWidth = totalWidth * CGFloat(min(getGram / fat, 1.0))
        return switch type {
        case .carbo :
            carboWidth
        case .protein :
            proteinWidth
        case .fat :
            fatWidth
        }
    }
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 0){
            Image(getFoodModel.image)
                .resizable()
                .frame(
                    width: 100,
                    height: 100
                )
            VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                Text(getFoodModel.name)
                    .font(.system(size: 20, weight: .bold))
                Text(getFoodModel.stuff.first ?? "")
                    .font(.system(size: 15, weight: .regular))
                Text("\(getFoodModel.nutrients.calrories, specifier: "%.1f")kcal")
                GeometryReader{ proxy in
                    HStack(alignment: VerticalAlignment.center, spacing: 0){
                        graphBar(setProxyReader: proxy, setGram: getFoodModel.nutrients.totalCarbo(), setType: .carbo)
                        graphBar(setProxyReader: proxy, setGram: getFoodModel.nutrients.protein, setType: .protein)
                        graphBar(setProxyReader: proxy, setGram: getFoodModel.nutrients.totalFat(), setType: .fat)
                    }
                    .frame(
                        width: proxy.size.width
                    )
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 10,
                    maxHeight: 10
                )
            }
        }
    }
}
