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
    
    var body: some View {
        if #available(iOS 15, *) {
            Text(setTitleText)
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: setColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        } else {
            Text(setTitleText)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.clear)
                .overlay(
                    LinearGradient(
                        colors: setColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(
                        Text(setTitleText)
                            .font(.system(size: 30, weight: .bold))
                    )
                )
        }
    }
}

