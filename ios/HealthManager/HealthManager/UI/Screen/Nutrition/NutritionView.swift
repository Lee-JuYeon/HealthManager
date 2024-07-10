//
//  NutritionView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutritionView : View {
    
    @EnvironmentObject private var dataVM : DataVM
    
   
    private func nutritionGraphView() -> some View {
        return VStack(alignment: HorizontalAlignment.center, spacing: 0){
            Text("탄수화물")
        }
        .overlay(content: {
            VStack(alignment: HorizontalAlignment.center, spacing: 5){
                Text("탄수화물")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.white)
                Text("51g")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(
                width: 100,
                height: 100
            )
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.black)
            )
        })
        .frame(
            width: 100,
            height: 200,
            alignment: .center
        )
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray)
        )
    }

    //  영양성분 체크 (식단, 영양제)
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                GradationTextView(setTitleText: "영양정보", setColors: [.blue, .green])
                
                Image("globe")
                    .resizable()
                    
            }
            
            GradationTextView(setTitleText: "🍕 현재 섭취한 칼로리", setColors: [.red, .yellow])
            HStack(alignment: VerticalAlignment.top, spacing: 2){
                nutritionGraphView()
                nutritionGraphView()
                nutritionGraphView()
            }
        }
        .padding(50)
    }
}

#Preview {
    NutritionView()
}
