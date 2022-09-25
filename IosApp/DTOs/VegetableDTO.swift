//
//  VegetableDTO.swift
//  IosApp
//
//  Created by TestPc on 17.9.22.
//

import Foundation
struct VegetableDTO: Decodable {
    let vegetableId: Int
    let name: String
    let description: String
    let thumbnailImage: String
    let seedDepth: String
    let growingSoilTemp: String
    let sowingDescription: String
    let growingDescription: String
    let harvestDescription: String
    let badCompanions:String
    let season: String
    let goodCompanions:String
    let daysToHarvestSeeds:Int
    let light:String
    let watering:String
    
    
    
    private enum CodingKeys: String, CodingKey {
        case vegetableId = "VegetableId"
        case name = "Name"
        case description = "Description"
        case thumbnailImage = "ThumbnailImage"
        case seedDepth = "SeedDepth"
        case growingSoilTemp = "GrowingSoilTemp"
        case sowingDescription = "SowingDescription"
        case growingDescription = "GrowingDescription"
        case harvestDescription = "HarvestDescription"
        case badCompanions = "BadCompanions"
        case season = "Season"
        case goodCompanions = "GoodCompanions"
        case daysToHarvestSeeds = "DaysToHarvestSeeds"
        case light = "Light"
        case watering = "Watering"
        
    }
}
