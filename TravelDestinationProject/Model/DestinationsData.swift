//
//  Destination.swift
//  Travel Destinations
//
//  Auto-generated from destinations.json structure
//

import Foundation

// MARK: - Main Response
class DestinationsData: Codable {
    
    var destinations: [Destination] = []

    init() {
        do {
            let response = try load()
            destinations = response.destinations
        } catch {
            print(error.localizedDescription)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case destinations
    }
    
    func getRandomDestination() -> Destination {
        return destinations.randomElement()!
    }
    
    func getDestinations(type:String) -> [Destination] {
        return destinations.filter { destination in
            destination.category == type
        }
    }
    
}


// MARK: - JSON Loading Helper
extension DestinationsData {
    /// Load destinations from a JSON file
    func load(from filename: String = "destinations") throws -> DestinationsData {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "DestinationsResponse", code: 404,
                         userInfo: [NSLocalizedDescriptionKey: "destinations.json not found"])
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        print(String(data: data, encoding: .utf8))
        do {
            return try decoder.decode(DestinationsData.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw error
        }
        
    }

    /// Load destinations from JSON data
    func decode(from data: Data) throws -> DestinationsData {
        let decoder = JSONDecoder()
        return try decoder.decode(DestinationsData.self, from: data)
    }
}

// MARK: - Filtering Extensions
extension DestinationsData {
    func destinations(for category: DestinationCategory) -> [Destination] {
        destinations.filter { $0.category == category.rawValue }
    }

    /// Get destinations grouped by category
    var destinationsByCategory: [DestinationCategory: [Destination]] {
        var grouped: [DestinationCategory: [Destination]] = [:]

        for category in DestinationCategory.allCases {
            grouped[category] = destinations(for: category)
        }

        return grouped
    }
}

