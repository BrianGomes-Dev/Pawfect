# Pawfect

Welcome to Pawfect - the perfect app for dog lovers!

## Description

Pawfect is an iOS app designed to bring joy to dog enthusiasts by providing access to a vast collection of dog breeds and adorable dog images. With Pawfect, you can explore various dog breeds, view random images of your favorite breeds, and learn more about our canine friends.

## Screenshots


## MVVM Architecture

Pawfect follows the MVVM (Model-View-ViewModel) architecture pattern to ensure a clean and maintainable codebase. MVVM separates concerns by organizing the code into three main components:

- **Model:** Represents the data and business logic of the application. In Pawfect, the `Breed` and `DogImageResponse` are examples of models responsible for handling data related to dog breeds and images.

- **View:** Represents the UI and user interface elements. SwiftUI views, such as `DogImagesView`, `BreedRowView`, and `BreedListView`, are responsible for displaying information to the user.

- **ViewModel:** Acts as an intermediary between the Model and the View. It contains the presentation logic and transforms the raw data from the Model into a format suitable for the View. The view models in Pawfect, such as `DogImageViewModel` and `BreedListViewModel`, handle data fetching and processing.

Using MVVM promotes a modular and testable code structure, making it easier to maintain and extend the app over time.


## Features

- View a list of dog breeds fetched from the Dogs API.
- Search for your favorite dog breed.
- Navigate through different breeds and select your favorites.
- Display 10 random images of the selected breed.
- Enjoy a smooth and intuitive user experience following iOS design guidelines.
- Pull to refresh and enjoy random dog breeds.

## Installation

To run Pawfect on your local machine, follow these steps:

1. Clone the repository:
https://github.com/BrianGomes-Dev/Pawfect.git

2. Open the project in Xcode.

3. Build and run the app on a simulator or a physical device.

## Usage

Once you've launched Pawfect, you can:

- Browse the list of dog breeds.
- Search for Dog breeds.
- Pull to refresh the random Dog list.
- Select a breed to view 10 random images by tapping on it.
- Enjoy the adorable dog images and explore different breeds at your leisure.

## Technologies Used

Pawfect is built using the following technologies and frameworks:

- Swift
- SwiftUI
- URLSession
- Codable
- JSON decoding
- XCTests
