//
//  VegetableDetailScreen.swift
//  IosApp
//
//  Created by TestPc on 18.9.22.
//

import Foundation
import SwiftUI
enum VegetableInfoOptions: CaseIterable {
    case about
    case harvest
    case problems
}
extension VegetableInfoOptions {
    
    var title: String {
        switch self {
            case .about: return "About"
            case .harvest: return "Harvest"
            case .problems: return "Problems"
        }
    }
    
}

struct VegetableDetailScreen: View {
    
    let vegetable: VegetableModel
    @State private var selection: VegetableInfoOptions = .about
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Picker("Select", selection: $selection) {
                    ForEach(VegetableInfoOptions.allCases, id: \.self) { info in
                        Text(info.title).tag(info)
                    }
                }.pickerStyle(.segmented)
                
                switch selection {
                    case .about:
                       AboutUs(vegetable: vegetable)
                    case .harvest:
                        HarvestView(vegetable: vegetable)
                    case .problems:
                        Text("Problems")
                }
                
            }
            .navigationTitle(vegetable.name)
        }
    }
}

struct VegetableDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        VegetableDetailScreen(vegetable: VegetableModel.default())
            .embedInNavigationView()
    }
}
