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
                Text("\(getFoodModel.nutrients.calrories)kcal")
                Text("120g, 0g, 250g")
            }
        }
    }
}
