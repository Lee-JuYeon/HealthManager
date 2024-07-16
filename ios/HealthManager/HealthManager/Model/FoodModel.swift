//
//  FoodModel.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodModel : Hashable {
    let name : String
    let image : String
    let stuff : [String]
    let nutrients : NutrientsModel
}
