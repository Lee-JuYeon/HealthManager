//
//  ScreenVM.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI

class ScreenVM: ObservableObject {
    
    enum SheetType {
        case GodLifeCell
    }
    
    enum ScreenType {
        case MainView
    }
    
    @Published var pageIndex : Int = 0
    
}

