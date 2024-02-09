//
//  BreedListView.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import SwiftUI

struct BreedListView: View {
    
    @StateObject private var viewModel = BreedListViewModel()
    
    var body: some View {
        List(viewModel.breeds ?? [], id: \.id) { breed in
            
            Text(breed.name)
        }
        .onAppear{
            viewModel.fetchBreeds()
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
