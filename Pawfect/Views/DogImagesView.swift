import SwiftUI

struct DogImagesView: View {
    
    @ObservedObject var viewModel = DogImageViewModel()
    let breed: Breed
    
    init(breed: Breed) {
        self.breed = breed
        viewModel.fetchDogImages(for: breed.name)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 24) {
                ForEach(viewModel.imageURLs, id: \.self) { url in
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .accessibility(label: Text("Loading image of breed: \(breed.name)"))
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                                .accessibility(label: Text("Dog image of breed: \(breed.name)"))
                                .accessibility(addTraits: .isImage)
                        case .failure(_):
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
                                .accessibility(label: Text("Failed to load image of breed: \(breed.name)"))
                                .accessibility(addTraits: .isImage)
                        @unknown default:
                            ProgressView()
                        }
                    }
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
        .navigationTitle(breed.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct DogImagesView_Previews: PreviewProvider {
    static var previews: some View {
        let breed = Breed(id: "001", name: "Collie", subBreeds: [])
        DogImagesView(breed: breed)
    }
}
