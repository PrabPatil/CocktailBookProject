//
//  CocktailRow.swift
//  CocktailBook
//
//  Created by Prabhu Patil on 27/09/24.
//

import SwiftUI
import CocktailsAPIPackage

struct CocktailRow: View {
    let cocktail: Cocktail
    
    var body: some View {
        HStack {
            Image(cocktail.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(cocktail.name)
                    .font(.headline)
                    .foregroundColor(cocktail.isFavorite ? .red : .primary)
                Text(cocktail.shortDescription)
                    .font(.footnote)
                    //.foregroundColor(.gray)
            }
            Spacer()
            if cocktail.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    CocktailRow(
        cocktail: Cocktail(
            id: AppConstants.cocktailId,
            name: AppConstants.cocktailName,
            type: AppConstants.cocktailType,
            shortDescription: AppConstants.cocktailShortDescription,
            longDescription: AppConstants.cocktailLongDescription,
            preparationMinutes: AppConstants.cocktailPreparationMinutes,
            imageName: AppConstants.cocktailImageName,
            ingredients: AppConstants.cocktailIngredients,
            isFavorite: true
        )
    )
}
