//
//  ContentView.swift
//  GroupedFetchRequest
//
//  Created by Sora on 2022/08/09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @SectionedFetchRequest<String, Item>(
        sectionIdentifier: \.categoryText,
        sortDescriptors: [SortDescriptor(\.category, order: .reverse)]
    )
    private var itemSections: SectionedFetchResults<String, Item>
    
    @State private var userEnteredCategory: Int16 = 0
    @State private var userEnteredContent: String = ""

    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Add new item") {
                    Picker("Category", selection: $userEnteredCategory) {
                        ForEach(CelestialBodyType.allCases, id: \.self.rawValue) { typeCase in
                            Text(typeCase.getDisplayName())
                                .id(typeCase.rawValue)
                        }
                    }
                    TextField("Name", text: $userEnteredContent)
                    Button("Create") {
                        let newRecord = Item(context: viewContext)
                        newRecord.content = self.userEnteredContent
                        newRecord.category = self.userEnteredCategory
                        try? viewContext.save()
                    }
                }
                
                ForEach(itemSections) { itemSection in
                    Section(itemSection.id) {
                        ForEach(itemSection) { itemEntry in
                            VStack(alignment: .leading) {
                                Text(itemEntry.content ?? "")
                                    .font(.headline)
                                Text(itemEntry.categoryText)
                            }
                        }
                    }
                }
                
            }
            
        }
        
    }

}

extension Item {
    @objc
    var categoryText: String {
        guard let typeObj = CelestialBodyType(rawValue: self.category) else {
            return "Unknown"
        }
        return typeObj.getDisplayName()
    }
}
