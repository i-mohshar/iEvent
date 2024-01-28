//
//  ContentView.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var eContext
    
    @State private var path = [Event]()
    @State private var sortOrder = SortDescriptor(\Event.eName)
    @State private var searchText : String = ""
    
    
    var body: some View {
        NavigationStack(path : $path)
        {
            EventListView(sort: sortOrder, searchString: searchText)
            .navigationTitle("iEvent")
            .searchable(text: $searchText)
            .navigationDestination(for: Event.self, destination: EventDetailView.init)
            .toolbar
            {
                Button("Add Event", systemImage: "plus", action: addEvent)
                Menu("Sort", systemImage:"arrow.up.arrow.down")
                {
                    Picker("Sort", selection: $sortOrder)
                    {
                        Text("Name").tag(SortDescriptor(\Event.eName))
                        Text("Date").tag(SortDescriptor(\Event.eDate))
                        Text("Priority").tag(SortDescriptor(\Event.ePriority))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    
    func addEvent()
    {
        let event = Event()
        eContext.insert(event)
        path = [event]
    }
}

#Preview {
    ContentView()
}
