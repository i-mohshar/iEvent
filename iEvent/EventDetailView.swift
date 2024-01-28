//
//  EventDetailView.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//`

import SwiftUI
import SwiftData

struct EventDetailView: View {
    
    @Bindable var  event : Event
    
    @State private var newToDoItem : String = ""
    
    var body: some View {
        Form
        {
            TextField("Title", text:$event.eName)
            DatePicker("Scheduled on", selection: $event.eDate)
            Section("Priority")
            {
                Picker("Event Priority", selection: $event.ePriority)
                {
                    Text("Nah").tag(1)
                    Text("May be").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("To Do List")
            {
                ForEach(event.eToDoItems)
                {
                    item in
                    Text(item.name)
                }
                .onDelete(perform: deleteToDoItem)
                HStack
                {
                    TextField("Add new to item to \(event.eName) event.",text: $newToDoItem)
                    Button("Add", action : addToDoItem)
                }
            }
        }
        .navigationTitle("Event Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func deleteToDoItem(_ indexSet : IndexSet)
    {
        for index in indexSet
        {
            event.eToDoItems.remove(at: index)
        }
    }
    
    func addToDoItem()
    {
        let toDoItem = ToDoItem(name: newToDoItem)
        event.eToDoItems.append(toDoItem)
        newToDoItem = ""
    }
}

#Preview {
    do {
        let configs = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Event.self, configurations: configs)
        let event = Event(eName:"Visit Zoo", eToDoItems: [ToDoItem]())
        return EventDetailView(event: event)
    }
    catch{
        fatalError("Unable to create detail")
    }
}
