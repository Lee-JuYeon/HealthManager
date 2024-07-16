//
//  FoodConsumedView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodConsumedView : View {
    
    private var getFoodModels : [FoodModel]
    
    init(
        setFoodModels : [FoodModel]
    ){
        self.getFoodModels = setFoodModels
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            GradationTextView(
                setTitleText: "섭취한 음식",
                setColors: [.red, .orange],
                setFontSize: 30,
                setFontWeight: .bold
            )
            ScrollView(.horizontal) {
                LazyHStack(alignment: VerticalAlignment.center, spacing: 0){
                    ForEach(getFoodModels, id: \.self) { model in
                        FoodConsumedItem(setFoodModel: model)
                    }
                }
            }
        }
    }
}
