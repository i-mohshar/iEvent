//
//  ToDoItem.swift
//  iEvent
//
//  Created by Mohit Sharma on 26/1/2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem
{
    var name : String
    init(name: String) {
        self.name = name
    }
}
