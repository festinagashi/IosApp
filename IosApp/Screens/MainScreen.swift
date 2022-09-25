//
//  MainScreen.swift
//  IosApp
//
//  Created by TestPc on 23.9.22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {			
        TabView {
            VegetableListScreen()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.white)
                    }
                }
                .embedInNavigationView()
                .tabItem {
                    Label("My Garden", systemImage: "house")
                }
            
            Text("Second Page")
                .embedInNavigationView()
                .tabItem {
                    Label("Favourites", systemImage: "leaf")
                }
        }.accentColor(.teal)
        .navigationTitle("My Garden")
        

    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
