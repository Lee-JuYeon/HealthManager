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
    
    
    private func graphBar(setProxyReader getProxyReader : GeometryProxy, setGram getGram : Double) -> some View {
        let width = getProxyReader.size.width / 3
        let height = getProxyReader.size.height
        return HStack(alignment: VerticalAlignment.center, spacing: 0){
            Rectangle()
                .fill(Color.red)
                .frame(
                    width: calculateWidth(totalWidth: width, getGram: getGram),
                    height: height
                )
        }
        .frame(
            width: width,
            height: height
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
    private func calculateWidth(totalWidth: CGFloat, getGram : Double) -> CGFloat {
        let dailyMacroNutrientModel = calculator.dailyMacroNutrients(myBody: dataVM.todayMyBodyStateModel)
        let carbs = dailyMacroNutrientModel.carbs
        let protein = dailyMacroNutrientModel.protein
        let fat = dailyMacroNutrientModel.fat

        let proteinWidth = totalWidth * CGFloat(min(getGram / protein, 1.0))
        return proteinWidth
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
                Text("120g, 0g, 250g")
                GeometryReader{ proxy in
                    HStack(alignment: VerticalAlignment.center, spacing: 0){
                        graphBar(setProxyReader: proxy, setGram: getFoodModel.nutrients.carbo.dietaryFiber)
                        graphBar(setProxyReader: proxy)
                        graphBar(setProxyReader: proxy)
                    }
                    .frame(
                        width: proxy.size.width
                    )
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 50,
                    maxHeight: 50
                )
            }
        }
    }
}
