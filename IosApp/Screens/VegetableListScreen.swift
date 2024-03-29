//
//  VegetableListScreen.swift
//  IosApp
//
//  Created by TestPc on 17.9.22.
//

import Foundation

import SwiftUI

struct VegetableListScreen: View {
    
    @StateObject private var vegetableListVM = VegetableViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vegetableListVM.vegetables, id: \.id) { vegetable in
                    
                    NavigationLink(destination: VegetableDetailScreen(vegetable: vegetable)) {
                       
                        VegetableCell(vegetable: vegetable)
                            .background(Constants.Colors.lightGreyRowColor)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    }
                    
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Garden")
            .task {
                await vegetableListVM.getAll()
            }
        }
    }
}

struct VegetableListScreen_Previews: PreviewProvider {
    static var previews: some View {
        VegetableListScreen()
            .navigationTitle("My Garden")
            .embedInNavigationView()
    }
}

struct VegetableCell: View {
    
    let vegetable: VegetableModel
    
    var body: some View {
        HStack {
            AsyncImage(url: vegetable.thumbnailUrl) { image in
                image.resizable()
                    .frame(maxWidth: 75, maxHeight: 75)
            } placeholder: {
                ProgressView()
            }
            
            Text(vegetable.name)
            Spacer()
        }.padding(5)
            .frame(maxWidth: .infinity)
    }
}

