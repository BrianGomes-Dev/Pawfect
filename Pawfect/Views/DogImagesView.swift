//
//  DogImagesView.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import SwiftUI

struct DogImagesView: View {
    
    let imageURLs: [URL]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                ForEach(imageURLs, id: \.self) { url in
                    
                    AsyncImage(url: url) { phase in
                        
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                        case .failure(_):
                            ProgressView()
                        @unknown default:
                            ProgressView()
                        }
                        
                    }
                    
                }
                
                
                
            }
            .padding()
        }
        .navigationTitle("BreedName")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    let url = URL(string: "https://images.dog.ceo/breeds/hound-walker/n02089867_1882.jpg")!
    return DogImagesView(imageURLs: [url])
}
