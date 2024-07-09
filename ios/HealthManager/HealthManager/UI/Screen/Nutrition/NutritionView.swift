//
//  NutritionView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutritionView : View {
    
    @EnvironmentObject private var dataVM : DataVM
    
   

    //  영양성분 체크 (식단, 영양제)
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                GradationTextView(setTitleText: "영양정보", setColors: [.blue, .green])
                
                Image("globe")
                    .resizable()
                    
            }
            
            HStack(alignment: VerticalAlignment.center, spacing: 2){
                
            }
        }
    }
}

#Preview {
    NutritionView()
}
