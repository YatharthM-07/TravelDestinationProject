//
//  Entities.swift
//  TravelDestinations
//
//  Created by Amit Gulati on 30/1/26.
//

// MARK: - Destination
struct Destination: Codable, Identifiable {
    let id: String
    let name: String
    let category: String
    let description: String
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case description
        case imagePath = "image_path"
    }
}


// MARK: - Category Enum
enum DestinationCategory: String, CaseIterable {
    case beach = "beach"
    case mountains = "mountains"
    case urban = "urban"
    case tropical = "tropical"
    case desert = "desert"
    case cultural = "cultural"
    case adventure = "adventure"
    case countryside = "countryside"

    var displayName: String {
        switch self {
        case .beach: return "Beach"
        case .mountains: return "Mountains"
        case .urban: return "Urban"
        case .tropical: return "Tropical"
        case .desert: return "Desert"
        case .cultural: return "Cultural"
        case .adventure: return "Adventure"
        case .countryside: return "Countryside"
        }
    }

    var icon: String {
        switch self {
        case .beach: return "🏖️"
        case .mountains: return "⛰️"
        case .urban: return "🏙️"
        case .tropical: return "🌴"
        case .desert: return "🏜️"
        case .cultural: return "🏛️"
        case .adventure: return "🎿"
        case .countryside: return "🌾"
        }
    }
}
