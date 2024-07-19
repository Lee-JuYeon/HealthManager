//
//  FavouriteFoodItem.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FavouriteFoodItem : View {
    private var getFoodModel : FoodModel
    private var dataVM : DataVM
    init(
        setFoodModel : FoodModel,
        setDataVM : DataVM
    ){
        self.getFoodModel = setFoodModel
        self.dataVM = setDataVM
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
    
    @State private var isOpen = false
    
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 0){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                Text("먹기")
                    .padding(10)
                    .font(.system(size: 15, weight: .regular))
                    .background(Color.yellow)
                    .onTapGesture {
                        dataVM.addConsumedFoodFromList(setFoodModel: getFoodModel)
                    }
                
                Text("편집")
                    .padding(10)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .regular))
                    .background(Color.gray)
                    .onTapGesture {
                        isOpen.toggle()
                    }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(
                width: 100,
                height: 100
            )
            .padding(10)
            
            VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                HStack(alignment: VerticalAlignment.center, spacing: 5){
                    Text(getFoodModel.name)
                        .font(.system(size: 20, weight: .bold))
                    Text("\(getFoodModel.nutrients.calrories, specifier: "%.0f")kcal")
                        .font(.system(size: 13, weight: .regular))
                }
                
                Text(getFoodModel.stuff.first ?? "")
                    .font(.system(size: 15, weight: .regular))
               
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
        .fullScreenCover(isPresented: $isOpen, content: {
            CreateEditFoodView(
                setModel: getFoodModel,
                setType: .EDIT,
                isOpen: $isOpen)
        })
    }
}

