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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
