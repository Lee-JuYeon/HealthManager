//
//  DataVM.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI
import Combine

/*
 영양정보 : 타이틀 색상변경, 음식 추가, 음식 스캐닝(그람당 영양성분 저장)
 섭취한 음식 :  삭제, 타이틀 색상변경
 즐겨찾는 음식 : 바텀시트 (음식 섭취, 음식 편집, 삭제), 타이틀 색상변경
 */

class DataVM: ObservableObject {
    
 
    @Published var todayNutitionModel : NutrientsModel
    @Published var todayMyBodyStateModel : MyBodyStateModel
    @Published var todayConsumedFoodList : [FoodModel]
    
    init(){
        // gender : true = 남자, false = 여자.
        todayMyBodyStateModel = MyBodyStateModel(
            currentHeight: 174.0,
            currentWeight: 147.4,
            currentAge: 28,
            currentGender: true,
            goalWeight: 58
        )
        
        todayNutitionModel = NutrientsModel(
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
        
        todayConsumedFoodList = dummyFoodData
    }
    
   
    func initNutrients(){
        todayNutitionModel = NutrientsModel(
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
    }
    
    func updateNutritents(setModel getModel : NutrientsModel){
        todayNutitionModel = getModel
    }
    func updateMyBodyStateModel(setModel getModel : MyBodyStateModel){
        todayMyBodyStateModel = getModel
        initNutrients()
    }
    
    func addConsumedFoodFromList(setFoodModel getFoodModel : FoodModel){
        todayConsumedFoodList.append(getFoodModel)
        todayNutitionModel.calrories += getFoodModel.nutrients.calrories
        todayNutitionModel.protein += getFoodModel.nutrients.protein
        todayNutitionModel.carbo.dietaryFiber += getFoodModel.nutrients.carbo.dietaryFiber
        todayNutitionModel.carbo.includeAddedSugar += getFoodModel.nutrients.carbo.includeAddedSugar
        todayNutitionModel.carbo.totalSugar += getFoodModel.nutrients.carbo.totalSugar
        todayNutitionModel.fat.saturatedFat += getFoodModel.nutrients.fat.saturatedFat
        todayNutitionModel.fat.transFat += getFoodModel.nutrients.fat.transFat
        todayNutitionModel.sodium += getFoodModel.nutrients.sodium
        todayNutitionModel.cholesterol += getFoodModel.nutrients.cholesterol
        todayNutitionModel.iron += getFoodModel.nutrients.iron
        todayNutitionModel.calcium += getFoodModel.nutrients.calcium
        todayNutitionModel.potassium += getFoodModel.nutrients.potassium
        todayNutitionModel.vitamin.vitaminA += getFoodModel.nutrients.vitamin.vitaminA
        todayNutitionModel.vitamin.vitaminB1 += getFoodModel.nutrients.vitamin.vitaminB1
        todayNutitionModel.vitamin.vitaminB2 += getFoodModel.nutrients.vitamin.vitaminB2
        todayNutitionModel.vitamin.vitaminB3 += getFoodModel.nutrients.vitamin.vitaminB3
        todayNutitionModel.vitamin.vitaminB5 += getFoodModel.nutrients.vitamin.vitaminB5
        todayNutitionModel.vitamin.vitaminB6 += getFoodModel.nutrients.vitamin.vitaminB6
        todayNutitionModel.vitamin.vitaminB7 += getFoodModel.nutrients.vitamin.vitaminB7
        todayNutitionModel.vitamin.vitaminB9 += getFoodModel.nutrients.vitamin.vitaminB9
        todayNutitionModel.vitamin.vitaminB12 += getFoodModel.nutrients.vitamin.vitaminB12
        todayNutitionModel.vitamin.vitaminC += getFoodModel.nutrients.vitamin.vitaminC
        todayNutitionModel.vitamin.vitaminD += getFoodModel.nutrients.vitamin.vitaminD
        todayNutitionModel.vitamin.vitaminE += getFoodModel.nutrients.vitamin.vitaminE
        todayNutitionModel.vitamin.vitaminK += getFoodModel.nutrients.vitamin.vitaminK
    }
    func removeConsumedFoodFromList(setFoodModel getFoodModel : FoodModel){
        
        if let index = todayConsumedFoodList.firstIndex(where: { $0 == getFoodModel }) {
          todayConsumedFoodList.remove(at: index)
        } else {
          // getFoodModel 객체가 배열에 존재하지 않음을 처리
        }
        todayNutitionModel.calrories -= getFoodModel.nutrients.calrories
        todayNutitionModel.protein -= getFoodModel.nutrients.protein
        todayNutitionModel.carbo.dietaryFiber -= getFoodModel.nutrients.carbo.dietaryFiber
        todayNutitionModel.carbo.includeAddedSugar -= getFoodModel.nutrients.carbo.includeAddedSugar
        todayNutitionModel.carbo.totalSugar -= getFoodModel.nutrients.carbo.totalSugar
        todayNutitionModel.fat.saturatedFat -= getFoodModel.nutrients.fat.saturatedFat
        todayNutitionModel.fat.transFat -= getFoodModel.nutrients.fat.transFat
        todayNutitionModel.sodium -= getFoodModel.nutrients.sodium
        todayNutitionModel.cholesterol -= getFoodModel.nutrients.cholesterol
        todayNutitionModel.iron -= getFoodModel.nutrients.iron
        todayNutitionModel.calcium -= getFoodModel.nutrients.calcium
        todayNutitionModel.potassium -= getFoodModel.nutrients.potassium
        todayNutitionModel.vitamin.vitaminA -= getFoodModel.nutrients.vitamin.vitaminA
        todayNutitionModel.vitamin.vitaminB1 -= getFoodModel.nutrients.vitamin.vitaminB1
        todayNutitionModel.vitamin.vitaminB2 -= getFoodModel.nutrients.vitamin.vitaminB2
        todayNutitionModel.vitamin.vitaminB3 -= getFoodModel.nutrients.vitamin.vitaminB3
        todayNutitionModel.vitamin.vitaminB5 -= getFoodModel.nutrients.vitamin.vitaminB5
        todayNutitionModel.vitamin.vitaminB6 -= getFoodModel.nutrients.vitamin.vitaminB6
        todayNutitionModel.vitamin.vitaminB7 -= getFoodModel.nutrients.vitamin.vitaminB7
        todayNutitionModel.vitamin.vitaminB9 -= getFoodModel.nutrients.vitamin.vitaminB9
        todayNutitionModel.vitamin.vitaminB12 -= getFoodModel.nutrients.vitamin.vitaminB12
        todayNutitionModel.vitamin.vitaminC -= getFoodModel.nutrients.vitamin.vitaminC
        todayNutitionModel.vitamin.vitaminD -= getFoodModel.nutrients.vitamin.vitaminD
        todayNutitionModel.vitamin.vitaminE -= getFoodModel.nutrients.vitamin.vitaminE
        todayNutitionModel.vitamin.vitaminK -= getFoodModel.nutrients.vitamin.vitaminK
    }
    
    func resetConsumedList(){
        todayConsumedFoodList = []  // 배열을 새로운 빈 배열로 할당
        initNutrients()
    }
 
    
    
    let dummyFoodData: [FoodModel] = [
        FoodModel(
            name: "닭가슴살 샐러드",
            image: "chicken_breast_salad",
            stuff: ["닭가슴살", "양상추", "마요네즈", "설탕", "레몬"],
            nutrients: NutrientsModel(
                calrories: 300,
                protein: 30,
                carbo: CarbohydrateModel(
                    dietaryFiber: 5,
                    totalSugar: 3,
                    includeAddedSugar: 1
                ),
                fat: FatModel(
                    transFat: 0.5,
                    saturatedFat: 3
                ),
                sodium: 200,
                cholesterol: 70,
                iron: 2,
                calcium: 50,
                potassium: 400,
                vitamin: VitaminModel(
                    vitaminA: 30,
                    vitaminB1: 0.2,
                    vitaminB2: 0.3,
                    vitaminB3: 5,
                    vitaminB5: 0.5,
                    vitaminB6: 0.4,
                    vitaminB7: 5,
                    vitaminB9: 100,
                    vitaminB12: 1,
                    vitaminC: 40,
                    vitaminD: 0,
                    vitaminE: 5,
                    vitaminK: 50
                )
            )
        ),
        FoodModel(
            name: "연어 구이",
            image: "grilled_salmon",
            stuff: ["연어","올리브 오일","레몬","후추","소금"],
            nutrients: NutrientsModel(
                calrories: 400,
                protein: 35,
                carbo: CarbohydrateModel(
                    dietaryFiber: 1,
                    totalSugar: 0,
                    includeAddedSugar: 0
                ),
                fat: FatModel(
                    transFat: 0.2,
                    saturatedFat: 6
                ),
                sodium: 300,
                cholesterol: 100,
                iron: 3,
                calcium: 30,
                potassium: 500,
                vitamin: VitaminModel(
                    vitaminA: 500,
                    vitaminB1: 0.3,
                    vitaminB2: 0.4,
                    vitaminB3: 6,
                    vitaminB5: 0.6,
                    vitaminB6: 0.5,
                    vitaminB7: 6,
                    vitaminB9: 150,
                    vitaminB12: 2,
                    vitaminC: 50,
                    vitaminD: 1000,
                    vitaminE: 10,
                    vitaminK: 70
                )
            )
        ),
        FoodModel(
            name: "닭가슴살 샌드위치",
            image: "chicken_breast_sandwich",
            stuff: ["닭가슴살","식빵","양상추","케챱","양파"],
            nutrients: NutrientsModel(
                calrories: 500,
                protein: 40,
                carbo: CarbohydrateModel(
                    dietaryFiber: 6,
                    totalSugar: 8,
                    includeAddedSugar: 4
                ),
                fat: FatModel(
                    transFat: 0.7,
                    saturatedFat: 4
                ),
                sodium: 400,
                cholesterol: 80,
                iron: 3,
                calcium: 60,
                potassium: 600,
                vitamin: VitaminModel(
                    vitaminA: 40,
                    vitaminB1: 0.4,
                    vitaminB2: 0.5,
                    vitaminB3: 7,
                    vitaminB5: 0.7,
                    vitaminB6: 0.6,
                    vitaminB7: 7,
                    vitaminB9: 200,
                    vitaminB12: 2,
                    vitaminC: 30,
                    vitaminD: 0,
                    vitaminE: 6,
                    vitaminK: 60
                )
            )
        ),
        FoodModel(
            name: "렌틸콩 스튜",
            image: "lentil_stew",
            stuff: ["렌틸콩","소금","설탕","토마토","바질"],
            nutrients: NutrientsModel(
                calrories: 350,
                protein: 25,
                carbo: CarbohydrateModel(
                    dietaryFiber: 15,
                    totalSugar: 10,
                    includeAddedSugar: 2
                                ),
                                fat: FatModel(
                                    transFat: 0.1,
                                    saturatedFat: 2
                                ),
                                sodium: 250,
                                cholesterol: 30,
                                iron: 6,
                                calcium: 100,
                                potassium: 700,
                                vitamin: VitaminModel(
                                    vitaminA: 20,
                                    vitaminB1: 0.5,
                                    vitaminB2: 0.6,
                                    vitaminB3: 8,
                                    vitaminB5: 0.8,
                                    vitaminB6: 0.7,
                                    vitaminB7: 8,
                                    vitaminB9: 400,
                                    vitaminB12: 3,
                                    vitaminC: 100,
                                    vitaminD: 0,
                                    vitaminE: 7,
                                    vitaminK: 80
                                )
                            )
                        ),
                        FoodModel(
                            name: "치즈 오믈렛",
                            image: "cheese_omelet",
                            stuff: ["체다치즈","달걀","쌀밥","올리브오일","당근"],
                            nutrients: NutrientsModel(
                                calrories: 300,
                                protein: 20,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 2,
                                    totalSugar: 3,
                                    includeAddedSugar: 1
                                ),
                                fat: FatModel(
                                    transFat: 0.3,
                                    saturatedFat: 5
                                ),
                                sodium: 400,
                                cholesterol: 150,
                                iron: 2,
                                calcium: 200,
                                potassium: 300,
                                vitamin: VitaminModel(
                                    vitaminA: 100,
                                    vitaminB1: 0.2,
                                    vitaminB2: 0.3,
                                    vitaminB3: 4,
                                    vitaminB5: 0.4,
                                    vitaminB6: 0.3,
                                    vitaminB7: 4,
                                    vitaminB9: 50,
                                    vitaminB12: 1,
                                    vitaminC: 20,
                                    vitaminD: 100,
                                    vitaminE: 5,
                                    vitaminK: 30
                                )
                            )
                        ),
                        FoodModel(
                            name: "과일 샐러드",
                            image: "fruit_salad",
                            stuff: ["사과","수박","체리","마요네즈","레몬"],
                            nutrients: NutrientsModel(
                                calrories: 200,
                                protein: 3,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 6,
                                    totalSugar: 25,
                                    includeAddedSugar: 10
                                ),
                                fat: FatModel(
                                    transFat: 0,
                                    saturatedFat: 0.5
                                ),
                                sodium: 50,
                                cholesterol: 0,
                                iron: 1,
                                calcium: 30,
                                potassium: 400,
                                vitamin: VitaminModel(
                                    vitaminA: 700,
                                    vitaminB1: 0.1,
                                    vitaminB2: 0.2,
                                    vitaminB3: 2,
                                    vitaminB5: 0.3,
                                    vitaminB6: 0.2,
                                    vitaminB7: 3,
                                    vitaminB9: 100,
                                    vitaminB12: 0.5,
                                    vitaminC: 300,
                                    vitaminD: 0,
                                    vitaminE: 3,
                                    vitaminK: 50
                                )
                            )
                        ),
                        FoodModel(
                            name: "견과류와 과일 믹스",
                            image: "nuts_and_fruits_mix",
                            stuff: ["파스타치오","아몬드","사과","배","복숭아"],
                            nutrients: NutrientsModel(
                                calrories: 400,
                                protein: 15,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 8,
                                    totalSugar: 15,
                                    includeAddedSugar: 5
                                ),
                                fat: FatModel(
                                    transFat: 0.2,
                                    saturatedFat: 5
                                ),
                                sodium: 150,
                                cholesterol: 0,
                                iron: 3,
                                calcium: 50,
                                potassium: 600,
                                vitamin: VitaminModel(
                                    vitaminA: 300,
                                    vitaminB1: 0.4,
                                    vitaminB2: 0.5,
                                    vitaminB3: 6,
                                    vitaminB5: 0.6,
                                    vitaminB6: 0.5,
                                    vitaminB7: 6,
                                    vitaminB9: 200,
                                    vitaminB12: 2,
                                    vitaminC: 100,
                                    vitaminD: 0,
                                    vitaminE: 10,
                                    vitaminK: 70
                                )
                            )
                        ),
                        FoodModel(
                            name: "닭가슴살 타코",
                            image: "chicken_breast_tacos",
                            stuff: ["또띠야","닭가슴살","마요네즈","살사소스","하바네로"],
                            nutrients: NutrientsModel(
                                calrories: 450,
                                protein: 35,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 4,
                                    totalSugar: 6,
                                    includeAddedSugar: 2
                                ),
                                fat: FatModel(
                                    transFat: 0.4,
                                    saturatedFat: 7
                                ),
                                sodium: 500,
                                cholesterol: 90,
                                iron: 4,
                                calcium: 70,
                                potassium: 700,
                                vitamin: VitaminModel(
                                    vitaminA: 45,
                                    vitaminB1: 0.3,
                                    vitaminB2: 0.4,
                                    vitaminB3: 7,
                                    vitaminB5: 0.7,
                                    vitaminB6: 0.6,
                                    vitaminB7: 7,
                                    vitaminB9: 250,
                                    vitaminB12: 2,
                                    vitaminC: 40,
                                    vitaminD: 0,
                                    vitaminE: 7,
                                    vitaminK: 80
                                )
                            )
                        ),
                        FoodModel(
                            name: "연어 스시",
                            image: "salmon_sushi",
                            stuff: ["김","연어","쌀밥","식초","설탕"],
                            nutrients: NutrientsModel(
                                calrories: 300,
                                protein: 25,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 2,
                                    totalSugar: 5,
                                    includeAddedSugar: 1
                                ),
                                fat: FatModel(
                                    transFat: 0.1,
                                    saturatedFat: 3
                                ),
                                sodium: 400,
                                cholesterol: 120,
                                iron: 2,
                                calcium: 50,
                                potassium: 500,
                                vitamin: VitaminModel(
                                    vitaminA: 600,
                                    vitaminB1: 0.3,
                                    vitaminB2: 0.4,
                                    vitaminB3: 5,
                                    vitaminB5: 0.5,
                                    vitaminB6: 0.4,
                                    vitaminB7: 5,
                                    vitaminB9: 150,
                                    vitaminB12: 2,
                                    vitaminC: 40,
                                    vitaminD: 1000,
                                    vitaminE: 8,
                                    vitaminK: 60
                                )
                            )
                        ),
                        FoodModel(
                            name: "불고기 덮밥",
                            image: "bulgogi_rice_bowl",
                            stuff: ["소고기","쌀밥","간장","설탕","양파"],
                            nutrients: NutrientsModel(
                                calrories: 550,
                                protein: 45,
                                carbo: CarbohydrateModel(
                                    dietaryFiber: 3,
                                    totalSugar: 12,
                                    includeAddedSugar: 5
                                ),
                                fat: FatModel(
                                    transFat: 0.5,
                                    saturatedFat: 8
                                ),
                                sodium: 600,
                                cholesterol: 130,
                                iron: 5,
                                calcium: 80,
                                potassium: 800,
                                vitamin: VitaminModel(
                                    vitaminA: 30,
                                    vitaminB1: 0.4,
                                    vitaminB2: 0.5,
                                    vitaminB3: 8,
                                    vitaminB5: 0.8,
                                    vitaminB6: 0.7,
                                    vitaminB7: 8,
                                    vitaminB9: 300,
                                    vitaminB12: 3,
                                    vitaminC: 20,
                                    vitaminD: 0,
                                    vitaminE: 7,
                                    vitaminK: 90
                                )
                            )
                        )
                    ]


}
