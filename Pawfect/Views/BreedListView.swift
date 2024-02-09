import SwiftUI

struct BreedListView: View {
    @StateObject private var viewModel = BreedListViewModel()
    @State private var selectedBreed: Breed?
    @State private var isShowingDogImages = false
    @StateObject private var dogImageViewModel = DogImageViewModel()
    
    var body: some View {
        List(viewModel.breeds ?? [], id: \.id) { breed in
            Button(action: {
                selectedBreed = breed
                fetchDogImages(for: breed.name)
            }) {
                Text(breed.name)
            }
        }
        .sheet(isPresented: $isShowingDogImages) {
            DogImagesView(imageURLs: dogImageViewModel.imageURLs)
           
        }
        .navigationTitle("Dog Breeds")
        .onAppear {
            viewModel.fetchBreeds()
        }
    }
    
    private func fetchDogImages(for breed: String) {
        dogImageViewModel.fetchDogImages(for: breed)
        isShowingDogImages = true
        print("\(dogImageViewModel.imageURLs.count)")
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
