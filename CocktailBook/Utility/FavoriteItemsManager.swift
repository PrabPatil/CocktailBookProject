//
//  FavoriteItemsManager.swift
//  CocktailBook
//
//  Created by Prabhu Patil on 27/09/24.
//

import Foundation

protocol UserFavoriteState {
    func isFavorite(_ id: String) -> Bool
    func addFavorite(_ id: String)
    func removeFavorite(_ id: String)
    func saveFavorites(_ favorites: [String])
    func loadFavorites() -> [String]
}

class FavoriteItemsManager: UserFavoriteState, ObservableObject {
    private let favoritesKey = "favoriteCocktails"
    
    func isFavorite(_ id: String) -> Bool {
        return loadFavorites().contains(id)
    }

    func addFavorite(_ id: String) {
        var favorites = loadFavorites()
        if !favorites.contains(id) {
            favorites.append(id)
            saveFavorites(favorites)
        }
    }

    func removeFavorite(_ id: String) {
        var favorites = loadFavorites()
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
            saveFavorites(favorites)
        }
    }

    func saveFavorites(_ favorites: [String]) {
        UserDefaults.standard.set(favorites, forKey: favoritesKey)
    }
    
    func loadFavorites() -> [String] {
        return UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
    }
    
}
