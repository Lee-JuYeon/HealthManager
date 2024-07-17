//
//  MacroNutrientsViews.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/14/24.
//

import SwiftUI

struct MacroNutrientsViews: View {
    
    @EnvironmentObject private var dataVM : DataVM
    

    var body: some View {
        GeometryReader{ proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let mSpacing : CGFloat = 20
            HStack(alignment: VerticalAlignment.top, spacing: mSpacing / 2){
                NutritionGraphView(
                    setWidth: width/3 - (mSpacing / 3),
                    setHeight: height,
                    setColour: Color.green,
                    setType: .carbo,
                    setVM: dataVM
                )
                
                NutritionGraphView(
                    setWidth: width/3 - (mSpacing / 3),
                    setHeight: height,
                    setColour: Color.brown,
                    setType: .protein,
                    setVM: dataVM
                )
                
                NutritionGraphView(
                    setWidth: width/3 - (mSpacing / 3),
                    setHeight: height,
                    setColour: Color.yellow,
                    setType: .fat,
                    setVM: dataVM
                )
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 100,
            maxHeight: 100
        )
    }
}

