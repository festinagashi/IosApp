//
//  IosAppApp.swift
//  IosApp
//
//  Created by TestPc on 17.9.22.
//

import SwiftUI

@main
struct IosAppApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        setupTheme()
        
    }
    private func setupTheme() {
        
        let headerAppearance = UINavigationBarAppearance()
        
        headerAppearance.backgroundColor = UIColor(#colorLiteral(red: 0.1804504693, green: 0.8003295064, blue: 0.4435202479, alpha: 1))
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        headerAppearance.titleTextAttributes = textAttributes
        headerAppearance.largeTitleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor = .white
        
        UINavigationBar.appearance().scrollEdgeAppearance = headerAppearance
        
    }
    
        var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
    

    
}
