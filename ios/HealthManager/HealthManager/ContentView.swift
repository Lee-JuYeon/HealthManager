//
//  ContentView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var screenVM : ScreenVM
        
    var body: some View {
        mainView()
    }
    
    private func mainView() -> some View {
        return CustomTabView(
            setTabViewStyle: CustomTabView.CustomTabViewStyle.BottomNavigation,
            setTabBackgroundColour: Color.green,
            setTabItemModels: [
                CustomTabView.CustomTabItemModel(image: "image_up", title: "영양"),
                CustomTabView.CustomTabItemModel(image: "image_cards", title: "운동")
            ],
            setSelectedIndex: $screenVM.pageIndex) { page in
                switch(page) {
                case 0 :
                    NutritionView()
                case 1 :
                    WorkOutView()
                default :
                    NutritionView()
                }
            }
    }
}





#Preview {
    ContentView()
}
