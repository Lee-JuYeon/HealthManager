//
//  NutritionView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

/*
 하루 최소 섭취 권장량
 현재 섭취량
 현재 섭취량을 칼로리로 변환
 */



struct NutritionView : View {
    
   
    @EnvironmentObject private var dataVM : DataVM
   

    //  영양성분 체크 (식단, 영양제)
    @State private var eatKcal = 0
   
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: HorizontalAlignment.leading, spacing: 5){
                HStack(alignment: VerticalAlignment.center, spacing: 5){
                    GradationTextView(
                        setTitleText: "영양정보",
                        setColors: [.blue, .green],
                        setFontSize: 40,
                        setFontWeight: .bold
                    )
                    
                    Spacer()
                    
                    Image("image_scan")
                        .resizable()
                        .renderingMode(.template)
                        .frame(
                            width: 40,
                            height: 40
                        )
                        .padding(5)
                        .onTapGesture {
                            
                        }
                    
                    Image("image_profile")
                        .resizable()
                        .renderingMode(.template)
                        .frame(
                            width: 40,
                            height: 40
                        )
                        .padding(5)
                        .onTapGesture {
                            
                        }
                }
                
                
                KcalGraphView(
                    setMyBodyStateModel: dataVM.todayMyBodyStateModel,
                    setKcal: 1520.0
                )
                
                MacroNutrientsViews()
                FoodConsumedView(setFoodModels: dataVM.dummyFoodData)
                FavouriteFoodView(setFoodModel: dataVM.dummyFoodData)
                
            }
        }
        .padding(10)
    }
}

