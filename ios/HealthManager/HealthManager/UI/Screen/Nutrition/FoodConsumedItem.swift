//
//  FoodConsumedItem.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodConsumedItem : View {
    private var getFoodModel : FoodModel
    private var onClick : (FoodModel) -> ()
    init(
        setFoodModel : FoodModel,
        onClick : @escaping (FoodModel) -> ()
    ){
        self.getFoodModel = setFoodModel
        self.onClick = onClick
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 0){
            Image(getFoodModel.image)
                .resizable()
                .frame(
                    width: 100,
                    height: 100
                )
            Text(getFoodModel.name)
                .font(.system(size: 13, weight: .bold))
                .frame(
                    width: 100,
                    alignment: .center
                )
        }
        .onTapGesture {
            onClick(getFoodModel)
        }
    }
}
