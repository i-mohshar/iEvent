//
//  Event.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//
import Foundation
import SwiftData

@Model
class Event
{
    var eName : String
    var eDate : Date
    var ePriority : Int
    
    @Relationship(deleteRule : .cascade) var eToDoItems : [ToDoItem]
    init(eName: String = "", eDate: Date = .now, ePriority: Int = 1, eToDoItems : [ToDoItem] = [ToDoItem]()) {
        self.eName = eName
        self.eDate = eDate
        self.ePriority = ePriority
        self.eToDoItems = eToDoItems
    }
}
