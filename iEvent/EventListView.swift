//
//  EventListView.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//

import SwiftUI
import SwiftData

struct EventListView: View {
    
    @Environment(\.modelContext) var eContext
    @Query var events : [Event]
    
    var body: some View {
        List{
            ForEach(events){
                event in
                NavigationLink(value : event)
                {
                    VStack(alignment: .leading)
                    {
                        Text(event.eName)
                            .modifier(FontStyle(fontSize: 18, fontWeight: .medium))
                        Text(event.eDate.formatted(date: .long, time:.shortened))
                            .modifier(FontStyle())
                    }
                    .padding(6)
                }
            }
            .onDelete(perform: deleteEvent)
        }
    }
    
    init(sort : SortDescriptor<Event>, searchString : String = "")
    {
        _events = Query(filter: #Predicate{
            if searchString.isEmpty
            {
                return true
            }
            else
            {
                return $0.eName.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteEvent(_ indexSet : IndexSet)
    {
        for index in indexSet
        {
            let event = events[index]
            eContext.delete(event)
        }
    }
   
}

#Preview {
    EventListView(sort: SortDescriptor(\Event.eName), searchString: "")
}
