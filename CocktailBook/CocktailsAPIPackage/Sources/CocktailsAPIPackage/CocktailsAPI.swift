import Foundation
import Combine

public protocol CocktailsAPI {
    func fetchCocktails(completion: @escaping (Result<[Cocktail], Error>) -> Void)
}
