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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                ForEach(viewModel.imageURLs, id: \.self) { url in
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
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
        .navigationTitle(breed.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct DogImagesView_Previews: PreviewProvider {
    static var previews: some View {
        let breed = Breed(id: "001", name: "Labrador Retriever", subBreeds: [])
        DogImagesView(breed: breed)
    }
}
