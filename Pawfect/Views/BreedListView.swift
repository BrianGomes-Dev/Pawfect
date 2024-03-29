//
//  PawfectApp.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import SwiftUI

struct BreedListView: View {
    @StateObject private var viewModel = BreedListViewModel()
    @State private var searchText = ""
    @State private var listItemOpacity: [Double]?
   
    var body: some View {
        let filteredBreeds = viewModel.filterBreeds(for: searchText)
        
        List {
            ForEach(filteredBreeds.indices, id: \.self) { index in
                let breed = filteredBreeds[index]
                
                ZStack {
                    NavigationLink(destination: DogImagesView(breed: filteredBreeds[index]) ) {
                        EmptyView()
                    }
                    .opacity(0.0)
                    .buttonStyle(PlainButtonStyle())
                    .accessibility(hidden: true)
                    
                    HStack {
                        BreedRowView(breed: breed)
                            .opacity(listItemOpacity?[index] ?? 0)
                            .animation(Animation.easeInOut(duration: 1).delay(Double(index) * 0.01), value: UUID())
                            .accessibility(label: Text("Breed: \(breed.name)"))
                            .accessibility(hint: Text("Tap to view images of \(breed.name)"))
                    }
                }
                .onAppear {
                    if listItemOpacity == nil {
                        listItemOpacity = Array(repeating: 0.0, count: filteredBreeds.count)
                    }
                    
                    withAnimation(.easeInOut(duration: 1)) {
                        listItemOpacity?[index] = 1
                    }
                }
                .listRowSeparator(.hidden)
            }
        }
        .listRowInsets(.none)
        .scrollIndicators(.hidden)
        .navigationTitle("Dog Breeds")
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Search for a breed")
        .refreshable {
            fetchBreeds()
        }
        .onAppear {
            fetchBreeds()
        }
    }
    
    private func fetchBreeds() {
        viewModel.fetchBreeds()
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
