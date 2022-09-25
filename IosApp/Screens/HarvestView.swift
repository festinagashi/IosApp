//
//  HarvestView.swift
//  IosApp
//
//  Created by TestPc on 25.9.22.
//

import SwiftUI
import SwiftUI

struct HarvestView: View {
    
    let vegetable: VegetableModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            
            Text("Companions")
                    .font(.headline)
            
            VStack(spacing: 10) {
                ColumnView(left: "Bad", right: vegetable.badCompanions)
                ColumnView(left: "Good", right: vegetable.goodCompanions)
                
            }
            
            Text("Harvest")
                .font(.headline)
            VStack(spacing: 10){
                ColumnView(left: "Season", right: vegetable.season)
                ColumnView(left: "DaysToHarvest", right: String(vegetable.daysToHarvestSeeds))
                ColumnView(left: "Light", right: vegetable.light)
                ColumnView(left: "Watering", right: vegetable.watering)            }
            
            
            DescriptionView(heading: "Harvest Description", content: vegetable.harvestDescription)
                .padding()
                .background(Constants.Colors.lightGreyRowColor)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .foregroundColor(.black)
            
            
            Spacer()
            
        }.padding()
    }}

struct HarvestView_Previews: PreviewProvider {
    static var previews: some View {
        HarvestView(vegetable: VegetableModel.default())
    }
}
