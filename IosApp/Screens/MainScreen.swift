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
                    Label("Home", systemImage: "house")
                }
            
            Text("Second Page")
                .embedInNavigationView()
                .tabItem {
                    Label("My Garden", systemImage: "leaf")
                }
            Text("Third Page")
                .embedInNavigationView()
                .tabItem {
                    Label("My", systemImage: "leaf")
                }
        }.accentColor(.teal)
        .navigationTitle("Green Garden")
        

    }
}
