//
//  File.swift
//  
//
//  Created by Prabhu Patil on 29/09/24.
//

import Foundation


public struct Cocktail: Identifiable, Codable {
    public   let id: String
    public   let name: String
    public   let type: String
    public   let shortDescription: String
    public   let longDescription: String
    public   let preparationMinutes: Int
    public   let imageName: String
    public   let ingredients: [String]
    public   var isFavorite: Bool = false
    
    public enum CodingKeys: String, CodingKey {
            case id, name, type, shortDescription, longDescription, preparationMinutes, imageName, ingredients
        }

    public  init(id: String, name: String, type: String, shortDescription: String, longDescription: String, preparationMinutes: Int, imageName: String, ingredients: [String], isFavorite: Bool = false) {
            self.id = id
            self.name = name
            self.type = type
            self.shortDescription = shortDescription
            self.longDescription = longDescription
            self.preparationMinutes = preparationMinutes
            self.imageName = imageName
            self.ingredients = ingredients
            self.isFavorite = isFavorite
        }
}
