//
//  FoodModel.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodModel : Hashable {
    var name : String
    var image : String
    var stuff : [String]
    var nutrients : NutrientsModel
}
