//
//  DetailsScreen.swift
//  CocktailBook
//
//  Created by Prabhu Patil on 27/09/24.
//

import SwiftUI
import CocktailsAPIPackage

struct DetailsScreen: View {
    let cocktail: Cocktail
    @Binding var isFavorite: Bool
    let favoritesManager: UserFavoriteState
    let backText: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "clock")
                                    .resizable()
                                    .frame(width: 30, height: 30) 
                                    .foregroundColor(.gray) 

                                Text("\(cocktail.preparationMinutes) Minutes")
                                    .font(.system(size: 20, weight: .semibold))
                                    
                                Spacer()
                            }
                            .padding([.leading, .trailing])
                            
                            HStack {
                                Spacer()
                                Image(cocktail.imageName)
                                    .resizable()
                                    .aspectRatio(16/9, contentMode: .fit)
                                    .frame(height: 200)
                                Spacer()
                            }
                            
                            Text(cocktail.longDescription)
                                .padding()
                            
                            Text("Ingredients")
                                .font(.headline)
                                .padding([.leading, .trailing, .top])
                            
                            ForEach(cocktail.ingredients, id: \.self) { ingredient in
                                HStack {
                                    Image(systemName: "arrowtriangle.right.fill")
                                    Text(ingredient)
                                }
                                .padding([.leading, .trailing, .bottom], 5)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: geometry.size.width)
                    }
                }
        .navigationTitle(cocktail.name)
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(systemName: "chevron.left").foregroundColor(.red)
                    Text(backText)
                        .foregroundColor(.red)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isFavorite.toggle()
                    updateFavorites()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart").foregroundColor(.red)
                }
            }
        }
    }
    
    private func updateFavorites() {
        if isFavorite {
            favoritesManager.addFavorite(cocktail.id)
        } else {
            favoritesManager.removeFavorite(cocktail.id)
        }
    }
}


#Preview {
    DetailsScreen(
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
        ),
        isFavorite: .constant(true),
        favoritesManager: FavoriteItemsManager(), // Provide a mock instance for preview
        backText: "All Cocktails"
    )
}
