//
//  ColumnView.swift
//  IosApp
//
//  Created by TestPc on 23.9.22.
//


import SwiftUI

struct ColumnView: View {
    
    let left: String
    let right: String
    
    var body: some View {
        HStack {
            Text(left)
            Spacer()
            Text(right)
        }
    }
}

struct ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnView(left: "left", right: "right")
    }
}
