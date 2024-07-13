//
//  Calculator.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/11/24.
//

import SwiftUI




struct MacroNutrients : Hashable {
    let carbs: CarbohydrateModel
    let protein: Double
    let fat: FatModel
}

class Calculator {
    private enum ActivityLevel: Double {
        case sedentary = 1.2
        case lightlyActive = 1.375
        case moderatelyActive = 1.55
        case veryActive = 1.725
        case extraActive = 1.9
    }
    
    // 일일 칼로리 권장
    func dailyKcal(myBody: MyBodyStateModel) -> Double {
        // 서울대 공식 적용
        let bmr = switch myBody.currentGender {
        case true:
            // 남자 BMR = 66.47 + (13.75 × 체중kg) + (5 × 키cm) - (6.76 × 나이)
            66.47 + (13.75 * myBody.currentWeight) + (5 * myBody.currentHeight) - (6.76 * Double(myBody.currentAge))
        case false:
            // 여자 BMR = 655.1 + (9.56 × 체중kg) + (1.85 × 키cm) - (4.68 × 나이)
            655.1 + (9.56 * myBody.currentWeight) + (1.85 * myBody.currentHeight) - (4.68 * Double(myBody.currentAge))
        }
        
        // 일일 칼로리 요구량 : BMR x 활동량
        return bmr * ActivityLevel.sedentary.rawValue
    }
    
    // 하루 최소 칼로리 권장량
    func minimumDailyKcal(myBody: MyBodyStateModel) -> Double {
        let bmr = dailyKcal(myBody: myBody)
        
        switch myBody.currentGender {
        case true:  // 남성: BMR + 500 칼로리 또는 1500 칼로리 중 더 높은 값
            return max(bmr + 500, 1500)
        case false: // 여성: BMR + 400 칼로리 또는 1200 칼로리 중 더 높은 값
            return max(bmr + 400, 1200)
        }
    }

    // 일일 탄단지 최소 권장량 (서울대 기준)
    func miniumDailyMacroNutrients(myBody: MyBodyStateModel) -> MacroNutrients {
        let minCalories = minimumDailyKcal(myBody: myBody)
            
        // 서울대 영양소 섭취기준 적용
        let carbsCalories = minCalories * 0.60 // 60%
        let proteinCalories = minCalories * 0.15 // 15%
        let fatCalories = minCalories * 0.25 // 25%
        
        // 탄수화물 세부 계산
        let totalCarbsGrams = carbsCalories / 4
        let totalSugar = minCalories * 0.1 / 4 // 총 열량의 10%를 총 당류로
        let includeAddedSugar = totalSugar * 0.5 // 총 당류의 50%를 첨가당으로 가정
        let dietaryFiber = myBody.currentGender ? 25.0 : 20.0 // 성별에 따른 식이섬유 권장량
        
        // 단백질 계산
        let proteinGrams = proteinCalories / 4
        
        // 지방 세부 계산
        let totalFatGrams = fatCalories / 9
        let saturatedFat = minCalories * 0.07 / 9 // 총 열량의 7%를 포화지방으로
        let transFat = minCalories * 0.01 / 9 // 총 열량의 1%를 트랜스지방으로
        
        return MacroNutrients(
            carbs: CarbohydrateModel(
                dietaryFiber: dietaryFiber,
                totalSugar: totalSugar,
                includeAddedSugar: includeAddedSugar
            ),
            protein: proteinGrams,
            fat: FatModel(
                transFat: transFat,
                saturatedFat: saturatedFat
            )
        )
    }
    
    // 일일 탄단지 권장량 (서울대 기준)
    func dailyMacroNutrients(myBody: MyBodyStateModel) -> MacroNutrients {
        let dailyCalories = dailyKcal(myBody: myBody)
        
        // 서울대 영양소 섭취기준 적용
        let carbsCalories = dailyCalories * 0.55 // 55-65%의 중간값
        let proteinCalories = dailyCalories * 0.15 // 15-20%의 하한값
        let fatCalories = dailyCalories * 0.30 // 15-30%의 상한값
        
        // 탄수화물 세부 계산
        let totalCarbsGrams = carbsCalories / 4
        let totalSugar = dailyCalories * 0.1 / 4 // 총 열량의 10% 이하를 총 당류로
        let includeAddedSugar = totalSugar * 0.5 // 총 당류의 50% 이하를 첨가당으로
        let dietaryFiber = myBody.currentGender ? 30.0 : 25.0 // 성별에 따른 식이섬유 권장량
        
        // 단백질 계산
        let proteinGrams = proteinCalories / 4
        
        // 지방 세부 계산
        let totalFatGrams = fatCalories / 9
        let saturatedFat = dailyCalories * 0.07 / 9 // 총 열량의 7% 이하를 포화지방으로
        let transFat = dailyCalories * 0.01 / 9 // 총 열량의 1% 이하를 트랜스지방으로
        
        return MacroNutrients(
            carbs: CarbohydrateModel(
                dietaryFiber: dietaryFiber,
                totalSugar: totalSugar,
                includeAddedSugar: includeAddedSugar
            ),
            protein: proteinGrams,
            fat: FatModel(
                transFat: transFat,
                saturatedFat: saturatedFat
            )
        )
    }
    
    // 비타민 권장량, 최소 섭취량
    func dailyVitamin(myBody: MyBodyStateModel) -> (minimum: VitaminModel, adequate: VitaminModel) {
        let age = Int(myBody.currentAge)
        let isMale = myBody.currentGender
        let weight = myBody.currentWeight
        let height = myBody.currentHeight

        // 기본 권장량 설정
        var adequateVitaminA = isMale ? 750.0 : 650.0
        var adequateVitaminD = 10.0
        var adequateVitaminE = isMale ? 12.0 : 11.0
        var adequateVitaminK = isMale ? 75.0 : 65.0
        var adequateVitaminC = 100.0
        var adequateVitaminB1 = isMale ? 1.2 : 1.1
        var adequateVitaminB2 = isMale ? 1.5 : 1.2
        var adequateVitaminB3 = isMale ? 16.0 : 14.0
        var adequateVitaminB5 = 5.0
        var adequateVitaminB6 = isMale ? 1.5 : 1.4
        var adequateVitaminB7 = 30.0
        var adequateVitaminB9 = 400.0
        var adequateVitaminB12 = 2.4

        // 체중에 따른 조정
        adequateVitaminB6 += (weight - 60) * 0.02  // 60kg 초과 시 2kg당 0.02mg 증가
        adequateVitaminC += max(0, (weight - 60) * 0.5)  // 60kg 초과 시 1kg당 0.5mg 증가

        // 신장에 따른 조정
        adequateVitaminD += max(0, (height - 170) * 0.1)  // 170cm 초과 시 1cm당 0.1μg 증가

        // 65세 이상 노인의 경우 비타민 D와 B12 조정
        if age >= 65 {
            adequateVitaminD = 15.0
            adequateVitaminB12 = 2.6
        }

        // 최소 권장량 계산 (적정 권장량의 90%)
        let minimum = VitaminModel(
            vitaminA: adequateVitaminA * 0.9,
            vitaminB1: adequateVitaminB1 * 0.9,
            vitaminB2: adequateVitaminB2 * 0.9,
            vitaminB3: adequateVitaminB3 * 0.9,
            vitaminB5: adequateVitaminB5 * 0.9,
            vitaminB6: adequateVitaminB6 * 0.9,
            vitaminB7: adequateVitaminB7 * 0.9,
            vitaminB9: adequateVitaminB9 * 0.9,
            vitaminB12: adequateVitaminB12 * 0.9,
            vitaminC: adequateVitaminC * 0.9,
            vitaminD: adequateVitaminD * 0.9,
            vitaminE: adequateVitaminE * 0.9,
            vitaminK: adequateVitaminK * 0.9
        )

        // 적정량
        let adequate = VitaminModel(
            vitaminA: adequateVitaminA,
            vitaminB1: adequateVitaminB1,
            vitaminB2: adequateVitaminB2,
            vitaminB3: adequateVitaminB3,
            vitaminB5: adequateVitaminB5,
            vitaminB6: adequateVitaminB6,
            vitaminB7: adequateVitaminB7,
            vitaminB9: adequateVitaminB9,
            vitaminB12: adequateVitaminB12,
            vitaminC: adequateVitaminC,
            vitaminD: adequateVitaminD,
            vitaminE: adequateVitaminE,
            vitaminK: adequateVitaminK
        )

        return (minimum, adequate)
    }

}
