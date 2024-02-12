//
//  ContentView.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            BreedListView()
                .accessibility(label: Text("Dogs Breeds"))
        }
    }
}

#Preview {
    ContentView()
}
