//
//  NutritionGraphView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct NutritionGraphView: View {
    private var getBarheight: CGFloat
    private var getHeight: CGFloat
    private var getWidth: CGFloat
    private var getColour : Color
    private var getTitle : String
    private var getGramCount : Int
    private var getMinGram : Int
    
    init(
        setWidth: CGFloat,
        setHeight: CGFloat,
        setBarHeight: CGFloat,
        setColour: Color,
        setTitle: String,
        setGramCount: Int,
        setMinGram : Int
    ){
        self.getWidth = setWidth
        self.getHeight = setHeight
        self.getBarheight = setBarHeight
        self.getColour = setColour
        self.getTitle = setTitle
        self.getGramCount = setGramCount
        self.getMinGram = setMinGram
    }
    

    var body: some View {
        ZStack(alignment: .bottom) {
            // 바깥쪽 사각형
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: getWidth, height: getHeight)
            
            // 안쪽 사각형
            Rectangle()
                .fill(getColour)
                .frame(width: getWidth, height: getBarheight)
            
            // 텍스트
            VStack {
                Text(getTitle)
                    .font(.system(size: 13, weight: .bold))
                    .padding(EdgeInsets(
                        top: 5, leading: 5, bottom: 5, trailing: 5
                    ))
                Spacer()
            }
            
            // 그램 수 텍스트
            VStack(alignment: HorizontalAlignment.center, spacing: 5){
                Spacer()
                Text("\(getGramCount)g")
                    .font(.system(size: 15, weight: .bold))
                    .padding(EdgeInsets(
                        top: 5, leading: 5, bottom: 5, trailing: 5
                    ))
            }
            
            // 최소 권장 선
            VStack(alignment: HorizontalAlignment.center){
                HStack(alignment: VerticalAlignment.center, spacing: 5){
                    Text("\(getMinGram)g")
                        .font(.system(size: 15, weight: .light))
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 1,
                            idealHeight: 1,
                            maxHeight: 1
                        )
                }
                .padding(
                    EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                )
               
            }
            .frame(
                width: getWidth,
                height: getHeight
            )
        }
        .frame(
            width: getWidth,
            height: getHeight
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
       
    }
}
