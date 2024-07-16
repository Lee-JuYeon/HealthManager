//
//  FoodConsumedItem.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodConsumedItem : View {
    private var getFoodModel : FoodModel
    
    init(
        setFoodModel : FoodModel
    ){
        self.getFoodModel = setFoodModel
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            Image(getFoodModel.image)
                .resizable()
                .frame(
                    width: 100,
                    height: 100
                )
            Text(getFoodModel.name)
                .font(.system(size: 18, weight: .bold))
                .frame(
                    width: 100
                )
        }
    }
}
