//
//  BreedRowView.swift
//  Pawfect
//
//  Created by Brian Gomes on 11/02/2024.
//

import SwiftUI

struct BreedRowView: View {
    var breed: Breed
    
    var body: some View {
        HStack {
            // Add breed icon or image here
            // For example:
            Image(systemName: "circle.fill") // Replace with actual breed icon or image
                .foregroundColor(randomColor())
                .frame(width: 24, height: 24)
            
            Text(breed.name)
                .font(.headline)
            
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
    
    private func randomColor() -> Color {
           let red = Double.random(in: 0...1)
           let green = Double.random(in: 0...1)
           let blue = Double.random(in: 0...1)
           return Color(red: red, green: green, blue: blue)
       }
}

struct BreedRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BreedRowView(breed: Breed(id: "001", name: "Labrador Retriever", subBreeds: []))
                .frame(width: 300, height: 50)
                .padding()
                .background(Color.gray)
                .previewDisplayName("Labrador Retriever")
            
            BreedRowView(breed: Breed(id: "002", name: "Golden Retriever", subBreeds: []))
                .frame(width: 300, height: 50)
                .padding()
                .background(Color.gray)
                .previewDisplayName("Golden Retriever")
            
            BreedRowView(breed: Breed(id: "003", name: "Poodle", subBreeds: []))
                .frame(width: 300, height: 50)
                .padding()
                .background(Color.gray)
                .previewDisplayName("Poodle")
        }
    }
}

