//
//  PromotionRepository.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import Foundation

class PromotionRepository {
    func loadPromotions() -> [Promotion] {
        if let url = Bundle.main.url(
            forResource: "promotions",
            withExtension: "json"
        ) {
            do {
                let data = try Data(contentsOf: url)
                let promotions = try JSONDecoder().decode(
                    [Promotion].self,
                    from: data
                )
                return promotions
            } catch {
                print("Ошибка загрузки акций: \(error)")
                return []
            }
        }
        return []
    }
}
