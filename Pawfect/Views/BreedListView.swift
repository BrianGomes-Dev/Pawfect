import SwiftUI

struct BreedListView: View {
    @StateObject private var viewModel = BreedListViewModel()
    @StateObject private var dogImageViewModel = DogImageViewModel()
    @State private var selectedBreed: Breed?
    @State private var isShowingDogImages = false
    @State private var searchText = ""
    @State private var listItemOpacity: [Double]?
   
    var body: some View {
        let filteredBreeds = viewModel.filterBreeds(for: searchText)
        
        List {
            ForEach(filteredBreeds.indices, id: \.self) { index in
                let breed = filteredBreeds[index]
                Button(action: {
                    selectedBreed = breed
                    fetchDogImages(for: breed.name)
                }) {
                    BreedRowView(breed: breed)
                        .opacity(listItemOpacity?[index] ?? 0)
                        .animation(Animation.easeInOut(duration: 1).delay(Double(index) * 0.01), value: UUID())
                        
                }
                .onAppear {
                    if listItemOpacity == nil {
                        listItemOpacity = Array(repeating: 0.0, count: filteredBreeds.count)
                    }
                    
                    withAnimation(.easeInOut(duration: 1)) {
                        listItemOpacity?[index] = 1
                    }
                }
                
            }
            .listRowSeparator(.hidden)
            
        }
        .sheet(isPresented: $isShowingDogImages) {
            DogImagesView(imageURLs: dogImageViewModel.imageURLs)
                
        }
        .listRowInsets(.none)
        .scrollIndicators(.hidden)
        .navigationTitle("Dog Breeds")
        .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "Hound")
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
    
    private func fetchDogImages(for breed: String) {
        dogImageViewModel.fetchDogImages(for: breed)
        isShowingDogImages = true
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
