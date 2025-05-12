//
//  HomeScreen.swift
//  BoatsAndYachts
//
//  Created by Никита Светличный on 10.05.2025.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.promotions) { promotion in
                        PromotionCard(promotion: promotion) {
                            self.viewModel.addBonuses(amount: promotion.bonusAmount)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct PromotionCard: View {
    let promotion: Promotion
    let onSelect: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(promotion.title)
                .font(.headline)
            
            Text(promotion.description)
                .font(.subheadline)
            
            Button("Выбрать акцию") {
                self.onSelect()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel())
    }
}

struct PromotionCard_Previews: PreviewProvider {
    static var previews: some View {
        PromotionCard(
            promotion: Promotion(
                id: "1",
                title: "Тест",
                description: "Тестовая акция",
                bonusAmount: 100
            ),
            onSelect: {}
        )
    }
}
