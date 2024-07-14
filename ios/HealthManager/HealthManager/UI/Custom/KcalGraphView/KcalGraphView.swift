//
//  KcalGraphView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/14/24.
//

import SwiftUI

struct KcalGraphView : View {
    private let calculator = Calculator()
    private var getMyBodyStateModel : MyBodyStateModel
    private var getKcal : Double
    
    init(
        setMyBodyStateModel : MyBodyStateModel,
        setKcal : Double
    ){
        self.getMyBodyStateModel = setMyBodyStateModel
        self.getKcal = setKcal
    }
    
    var body: some View {
        GeometryReader{ proxy in
            HStack(alignment: VerticalAlignment.center, spacing: 0){
                Rectangle()
                    .fill(Color.red)
                    .frame(
                        width: calculateWidth(totalWidth: proxy.size.width),
                        height: proxy.size.height
                    )
                Spacer()
            }
            .frame(
                width: proxy.size.width,
                height: proxy.size.height,
                alignment: .leading
            )
            .overlay(
                Text("🔥 \(getKcal, specifier: "%.1f")Kcal")
                    .font(.system(size: 20, weight: .bold))
            )
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 50,
            idealHeight: 50,
            maxHeight: 50
        )
        .background(
            Rectangle()
                .fill(Color.gray.opacity(0.2))
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
    
    private func calculateWidth(totalWidth: CGFloat) -> CGFloat {
        let dailyKcal = calculator.dailyKcal(myBody: getMyBodyStateModel)
        let percentage = min(getKcal / dailyKcal, 1.0) // Ensure it doesn't exceed 100%
        return totalWidth * CGFloat(percentage)
    }
}
