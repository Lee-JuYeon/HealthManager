//
//  FavouriteFoodView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/16/24.
//

import SwiftUI

struct FavouriteFoodView : View {
    
    @EnvironmentObject private var dataVM : DataVM

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0){
            HStack(){
                GradationTextView(
                    setTitleText: "즐겨찾는 음식",
                    setColors: [.red, .orange],
                    setFontSize: 30,
                    setFontWeight: .bold
                )
                
            }
            ScrollView(.vertical) {
                LazyVStack(alignment: HorizontalAlignment.leading, spacing: 0){
                    ForEach(dataVM.dummyFoodData, id: \.self) { model in
                        FavouriteFoodItem(setFoodModel: model, setDataVM: dataVM)

                    }
                }
            }
        }
        .padding(
            EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        )
    }
}
