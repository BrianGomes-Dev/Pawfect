//
//  DogAPIService.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import Foundation

class DogAPIService {
    static let shared = DogAPIService()
    private let baseURL = URL(string: "https://dog.ceo/api/")!

    func fetchBreeds(completion: @escaping ([Breed]?) -> Void) {
        let breedsURL = baseURL.appendingPathComponent("breeds/list/all")
        
        URLSession.shared.dataTask(with: breedsURL) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching breeds: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let breedsResponse = try JSONDecoder().decode(BreedsResponse.self, from: data)
                let breeds = breedsResponse.message.map { (key, value) in
                    Breed(id: key, name: key.capitalized, subBreeds: value)
                }
                completion(breeds)
            } catch {
                print("Error decoding breeds: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

struct BreedsResponse: Codable {
    let message: [String: [String]]
    let status: String
}
