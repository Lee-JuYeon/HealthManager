//
//  FavouriteFoodView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FavouriteFoodView : View {
    
    
    private var getFoodModels : [FoodModel]
    
    init(
        setFoodModel : [FoodModel]
    ){
        self.getFoodModels = setFoodModel
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            GradationTextView(
                setTitleText: "즐겨찾는 음식",
                setColors: [.red, .orange],
                setFontSize: 30,
                setFontWeight: .bold
            )
            ScrollView(.vertical) {
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    ForEach(getFoodModels, id: \.self) { model in
                        FavouriteFoodItem(setFoodModel: model)

                    }
                }
            }
        }
        .padding(
            EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        )
    }
}
