//
//  FoodConsumedView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FoodConsumedView : View {
    
    @EnvironmentObject private var dataVM : DataVM

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            HStack(alignment: VerticalAlignment.center, spacing: 0){
                GradationTextView(
                    setTitleText: "섭취한 음식",
                    setColors: [.yellow, .red, .purple],
                    setFontSize: 30,
                    setFontWeight: .bold
                )
                
                Text("초기화")
                    .padding(4)
                    .font(.system(size: 15, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
                    .padding(5)
                    .onTapGesture {
                        dataVM.resetConsumedList()
                    }
            }
            ScrollView(.horizontal) {
                LazyHStack(alignment: VerticalAlignment.top, spacing: 0){
                    ForEach(dataVM.todayConsumedFoodList, id: \.self) { model in
                        FoodConsumedItem(setFoodModel: model) { foodModel in
                            dataVM
                        }
                    }
                }
            }
        }
        .padding(
            EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        )
    }
}
