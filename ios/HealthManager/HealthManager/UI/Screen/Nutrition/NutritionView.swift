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
    private var carboHeight : CGFloat = 50
    private var carboGram : Int = 50
    private var proteinHeight : CGFloat = 100
    private var proteinGram : Int = 100
    private var fatHeight : CGFloat = 20
    private var fatGram : Int = 20

    //  영양성분 체크 (식단, 영양제)
    @State private var eatKcal = 0
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            HStack(alignment: VerticalAlignment.center, spacing: 5){
                GradationTextView(
                    setTitleText: "영양정보",
                    setColors: [.blue, .green],
                    setFontSize: 40,
                    setFontWeight: .bold
                )
                
                Image("globe")
                    .resizable()
                    
            }
            
            GradationTextView(
                setTitleText: "🍕 현재 섭취한 칼로리 : \(eatKcal)Kcal",
                setColors: [.red, .yellow, .orange],
                setFontSize: 20,
                setFontWeight: .regular
            )
            
            GeometryReader{ proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                
                HStack(alignment: VerticalAlignment.top, spacing: 10){
                    NutritionGraphView(
                     setWidth: width/3,
                     setHeight: height/2,
                     setBarHeight: carboHeight,
                     setColour: Color.orange,
                     setTitle: "🍚 Carbs",
                     setGramCount: carboGram,
                     setMinGram: 50
                    )
                    
                    NutritionGraphView(
                     setWidth: width/3,
                     setHeight: height/2,
                     setBarHeight: proteinHeight,
                     setColour: Color.red,
                     setTitle: "💪🏻 Protein",
                     setGramCount: proteinGram,
                     setMinGram: 80
                    )
                    
                    NutritionGraphView(
                     setWidth: width/3,
                     setHeight: height/2,
                     setBarHeight: fatHeight,
                     setColour: Color.yellow,
                     setTitle: "🫒 Fat",
                     setGramCount: fatGram,
                     setMinGram: 120
                    )
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            
        }
        .padding(50)
    }
}

#Preview {
    NutritionView()
}
