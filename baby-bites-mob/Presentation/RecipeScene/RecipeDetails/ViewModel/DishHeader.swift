//
//  DishHeader.swift
//  Baby Bites
//
//  Created by Zefanya on 23/08/24.
//

import SwiftUI

struct DishHeader: View {
    var Dish: Dish2
    
    private func categoryBackgroundColor(for category: String) -> Color {
        switch category.lowercased() {
        case "vegetable":
            return Color(red: 0.38, green: 1, blue: 0).opacity(0.2)
        case "fruit":
            return Color(red: 0, green: 0.64, blue: 1).opacity(0.2)
        case "protein":
            return Color(red: 1, green: 0, blue: 0).opacity(0.2)
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(Dish.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text(Dish.category)
                    .font(.headline)
                    .padding(5)
                    .background(categoryBackgroundColor(for: Dish.category))
                    .cornerRadius(5)
                Image(systemName: "clock")
                    .foregroundColor(Color(red: 0.52, green: 0.51, blue: 0.5))
                Text(Dish.duration)
                    .font(.headline)
                    .font(Font.custom("SF Pro", size: 1).weight(.medium))
                    .foregroundColor(Color(red: 0.52, green: 0.51, blue: 0.5))
                    .lineLimit(1)
                    .opacity(0.8)
            }
            
            Text(Dish.description)
                .font(.body)
        }
        .padding()
    }
}
