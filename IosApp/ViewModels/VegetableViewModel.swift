//
//  VegetableViewModel.swift
//  IosApp
//
//  Created by TestPc on 17.9.22.
//

import Foundation
@MainActor
class VegetableViewModel : ObservableObject{
    @Published var vegetables :[VegetableModel] = []
    func getAll() async{
        do{
            let vegetables = try await ApiCall().getAllVegetables(url: Constants.Urls.getAllVegetables)
            self.vegetables = vegetables.map(VegetableModel.init)
        }
        catch{
            print(error)
        }
        
        
    }
}

struct VegetableModel {
    fileprivate let vegetable : Vegetable
    
        var id : Int{
            vegetable.vegetableId
        }
        
        var name: String
        {
            vegetable.name
        }
        var description: String{
            vegetable.description
        }
        var thumbnailUrl:URL?{
            URL(string: vegetable.thumbnailImage)
        }
    
}
