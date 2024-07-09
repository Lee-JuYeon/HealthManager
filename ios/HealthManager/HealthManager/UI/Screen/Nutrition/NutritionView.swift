//
//  NutritionView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutritionView : View {
    
    @EnvironmentObject private var dataVM : DataVM
    
    private func titleView() -> some View {
        let titleText = "영양정보"
        let colors: [Color] = [.blue, .green]
        
        return Group {
            if #available(iOS 15, *) {
                Text(titleText)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: colors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            } else {
                Text(titleText)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.clear)
                    .overlay(
                        LinearGradient(
                            colors: colors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .mask(
                            Text(titleText)
                                .font(.system(size: 30, weight: .bold))
                        )
                    )
            }
        }
    }

    //  영양성분 체크 (식단, 영양제)
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                titleView()
                
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
