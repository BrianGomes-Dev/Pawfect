//
//  DogImageViewModel.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import Foundation

class DogImageViewModel: ObservableObject {
    @Published var imageURLs: [URL] = []
    
    func fetchDogImages(for breed: String) {
        let breed = breed.lowercased()
        let urlString = "https://dog.ceo/api/breed/\(breed)/images"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching dog images:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(DogImageResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.imageURLs = response.message.prefix(10).compactMap { URL(string: $0) }
                }
            } catch {
                print("Error decoding dog images:", error.localizedDescription)
            }
        }.resume()
    }

}

struct DogImageResponse: Codable {
    let message: [String]
    let status: String
}
