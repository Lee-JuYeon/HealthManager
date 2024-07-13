//
//  MyBodyStateModel.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/13/24.
//

import SwiftUI

struct MyBodyStateModel : Hashable {
    let currentHeight : Double
    let currentWeight : Double
    let currentAge : Double
    let currentGender : Bool
    let goalWeight : Double // 목표 체중 추가
}
