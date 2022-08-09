//
//  GroupedFetchRequestApp.swift
//  GroupedFetchRequest
//
//  Created by Sora on 2022/08/09.
//

import SwiftUI

@main
struct GroupedFetchRequestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
