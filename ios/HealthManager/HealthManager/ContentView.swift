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


struct WorkOutView : View {
    // 운동 열량소비 (헬스루틴, 달리기 걷기 자전거)
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 5){
            
        }
    }
}



#Preview {
    ContentView()
}
