//
//  CreateEditFoodView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/19/24.
//

import SwiftUI

struct CreateEditFoodView: View {
    
    var getModel : FoodModel
    var getType : ViewType
    @Binding var isOpen : Bool
    init(
        setModel : FoodModel,
        setType : ViewType,
        isOpen : Binding<Bool>
    ){
        self.getModel = setModel
        self.getType = setType
        _isOpen = isOpen
    }
    
    enum ViewType {
        case CREATE
        case EDIT
    }
    
    @State private var foodName = ""
    @State private var calrories = "" // 칼로리
    @State private var protein = "" // 단백질
    @State private var carbo_dietaryFiber = "" //식이섬유
    @State private var carbo_totalSugar = "" //총당류
    @State private var carbo_includeAddedSugar = "" //첨가당
    @State private var fat_transFat = "" // 트랜스지방
    @State private var fat_saturatedFat = "" // 포화 지방
    @State private var sodium = "" // 나트륨
    @State private var cholesterol = "" // 콜레스테롤
    @State private var iron = "" // 철분
    @State private var calcium = "" // 칼슘
    @State private var potassium = "" // 칼륨
    @State private var vitamin_a = "" // 비타민 a
    @State private var vitamin_b1 = "" // 티아민 (mg)
    @State private var vitamin_b2 = "" // 리보플라빈 (mg)
    @State private var vitamin_b3 = "" // 나이아신 (mg NE)
    @State private var vitamin_b5 = "" // 판토텐산 (mg)
    @State private var vitamin_b6 = "" // 비타민B6 (mg)
    @State private var vitamin_b7 = "" // 비오틴 (μg)
    @State private var vitamin_b9 = "" // 엽산 (μg DFE)
    @State private var vitamin_b12 = "" // 비타민B12 (μg)
    @State private var vitamin_c = "" // 비타민C (mg)
    @State private var vitamin_d = "" // 비타민D (μg)
    @State private var vitamin_e = "" // 비타민E (mg α-TE)
    @State private var vitamin_k = "" // 비타민K (μg)
    @State private var currentFoodModel = FoodModel(
        name: "",
        image: "",
        stuff: [],
        nutrients: NutrientsModel(
            calrories: 0.0,
            protein: 0.0,
            carbo: CarbohydrateModel(
                dietaryFiber: 0.0,
                totalSugar: 0.0,
                includeAddedSugar: 0.0
            ),
            fat: FatModel(
                transFat: 0.0,
                saturatedFat: 0.0
            ),
            sodium: 0.0,
            cholesterol: 0.0,
            iron: 0.0,
            calcium: 0.0,
            potassium: 0.0,
            vitamin: VitaminModel(
                vitaminA: 0.0,
                vitaminB1: 0.0,
                vitaminB2: 0.0,
                vitaminB3: 0.0,
                vitaminB5: 0.0,
                vitaminB6: 0.0,
                vitaminB7: 0.0,
                vitaminB9: 0.0,
                vitaminB12: 0.0,
                vitaminC: 0.0,
                vitaminD: 0.0,
                vitaminE: 0.0,
                vitaminK: 0.0
            )
        )
    )
    
    @EnvironmentObject private var dataVM : DataVM

    private func foodHint() -> String {
        return switch getType {
        case .CREATE:
            "음식 이름"
        case .EDIT:
            currentFoodModel.name
        }
    }
    private func mTextField(setHint getHint : String, setText getText : Binding<String>) -> some View {
        return TextField(
            getHint,
            text : getText
        )
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            //  바텀시트 (음식 섭취 v, 음식 편집, 삭제v)
            VStack(alignment: HorizontalAlignment.leading, spacing: 0){
                HStack(alignment: VerticalAlignment.center, spacing: 0){
                    TextField(
                        foodHint(),
                        text : $foodName
                    ).textFieldStyle(.roundedBorder)
                    
                    Spacer()
                    
                    if getType == .EDIT {
                        Text("삭제")
                            .padding(4)
                            .foregroundColor(Color.white)
                            .font(.system(size: 15, weight: .regular))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.red)
                            )
                            .onTapGesture {
                                dataVM.removeConsumedFoodFromList(setFoodModel: currentFoodModel)
                            }
                    }
                    
                }
                mTextField(setHint: "칼로리", setText: $calrories)
                mTextField(setHint: "단백질", setText: $protein)

                HStack(alignment: VerticalAlignment.center, spacing: 10){
                    mTextField(setHint: "식이섬유", setText: $carbo_dietaryFiber)
                    mTextField(setHint: "총 당류🍭", setText: $carbo_totalSugar)
                    mTextField(setHint: "첨가당", setText: $carbo_includeAddedSugar)
                }
               
                HStack(alignment: VerticalAlignment.center, spacing: 10){
                    mTextField(setHint: "트랜스 지방", setText: $fat_transFat)
                    mTextField(setHint: "포화 지방", setText: $fat_saturatedFat)
                }
                
                HStack(alignment: VerticalAlignment.center, spacing: 10){
                    mTextField(setHint: "나트륨🧂", setText: $sodium)
                    mTextField(setHint: "콜레스테롤", setText: $cholesterol)
                }
                
                
                HStack(alignment: VerticalAlignment.center, spacing: 10){
                    mTextField(setHint: "⛓️ 철분", setText: $iron)
                    mTextField(setHint: "칼슘", setText: $calcium)
                    mTextField(setHint: "칼륨", setText: $potassium)
                }
                
                mTextField(setHint: "비타민 A", setText: $vitamin_a)
                mTextField(setHint: "티아민", setText: $vitamin_b1)
                mTextField(setHint: "리보플라빈", setText: $vitamin_b2)
                mTextField(setHint: "나이아신", setText: $vitamin_b3)
                mTextField(setHint: "판토텐산", setText: $vitamin_b5)
                mTextField(setHint: "비타민B6", setText: $vitamin_b6)
                mTextField(setHint: "비오틴", setText: $vitamin_b7)
                mTextField(setHint: "엽산", setText: $vitamin_b9)
                mTextField(setHint: "비타민B12", setText: $vitamin_b12)
                mTextField(setHint: "🍋 비타민C", setText: $vitamin_c)
                mTextField(setHint: "비타민D", setText: $vitamin_d)
                mTextField(setHint: "비타민E", setText: $vitamin_e)
                mTextField(setHint: "비타민K", setText: $vitamin_k)

                Text("완료")
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .center
                    )
                    .padding(10)
                    .font(.system(size: 30, weight: .bold))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                    )
                    .onTapGesture {
                        isOpen.toggle()
                    }
            }
            .padding(10)
        }
        .onAppear{
            switch getType {
            case .CREATE:
                print("")
            case .EDIT:
                currentFoodModel.image = getModel.image
                currentFoodModel.name = getModel.name
                currentFoodModel.nutrients = getModel.nutrients
                currentFoodModel.stuff = getModel.stuff
                
                
                foodName = currentFoodModel.name
                calrories = "\(currentFoodModel.nutrients.calrories)"
                protein = "\(currentFoodModel.nutrients.protein)"
                carbo_totalSugar = "\(currentFoodModel.nutrients.carbo.totalSugar)"
                carbo_dietaryFiber = "\(currentFoodModel.nutrients.carbo.dietaryFiber)"
                carbo_includeAddedSugar = "\(currentFoodModel.nutrients.carbo.includeAddedSugar)"
                fat_transFat = "\(currentFoodModel.nutrients.fat.transFat)"
                fat_saturatedFat = "\(currentFoodModel.nutrients.fat.saturatedFat)"
                sodium = "\(currentFoodModel.nutrients.sodium)"
                cholesterol = "\(currentFoodModel.nutrients.cholesterol)"
                iron = "\(currentFoodModel.nutrients.iron)"
                calcium = "\(currentFoodModel.nutrients.calcium)"
                potassium = "\(currentFoodModel.nutrients.potassium)"
                vitamin_a = "\(currentFoodModel.nutrients.vitamin.vitaminA)"
                vitamin_b1 = "\(currentFoodModel.nutrients.vitamin.vitaminB1)"
                vitamin_b2 = "\(currentFoodModel.nutrients.vitamin.vitaminB2)"
                vitamin_b3 = "\(currentFoodModel.nutrients.vitamin.vitaminB3)"
                vitamin_b5 = "\(currentFoodModel.nutrients.vitamin.vitaminB5)"
                vitamin_b6 = "\(currentFoodModel.nutrients.vitamin.vitaminB6)"
                vitamin_b7 = "\(currentFoodModel.nutrients.vitamin.vitaminB7)"
                vitamin_b9 = "\(currentFoodModel.nutrients.vitamin.vitaminB9)"
                vitamin_b12 = "\(currentFoodModel.nutrients.vitamin.vitaminB12)"
                vitamin_c = "\(currentFoodModel.nutrients.vitamin.vitaminC)"
                vitamin_d = "\(currentFoodModel.nutrients.vitamin.vitaminD)"
                vitamin_e = "\(currentFoodModel.nutrients.vitamin.vitaminE)"
                vitamin_k = "\(currentFoodModel.nutrients.vitamin.vitaminK)"
            }
        }
    }
}

