//
//  ViewExtensions.swift
//  IosApp
//
//  Created by TestPc on 17.9.22.
//

import SwiftUI
extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
