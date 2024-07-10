//
//  GradationTextView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/10/24.
//

import SwiftUI

struct GradationTextView: View {
    let setTitleText: String
    let setColors: [Color]
    let setFontSize : CGFloat? = 20
    let setFontWeight : Font.Weight? = .bold
    
    var body: some View {
        if #available(iOS 15, *) {
            Text(setTitleText)
                .font(.system(size: setFontSize ?? 20, weight: setFontWeight))
                .foregroundStyle(
                    LinearGradient(
                        colors: setColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        } else {
            Text(setTitleText)
                .font(.system(size: setFontSize ?? 20, weight: setFontWeight))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        colors: setColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(
                        Text(setTitleText)
                            .font(.system(size: setFontSize ?? 20, weight: setFontWeight))
                    )
                )
        }
    }
}

