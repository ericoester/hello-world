//
//  TaskManager.swift
//  My Task List
//
//  Created by Eric Öster on 07.02.16.
//  Copyright © 2016 Eric Öster. All rights reserved.
//

import UIKit

struct task{
    var name = "Unnamed"
    var desc = "Undescribed"
}

class TaskManager {

    init() {
        addTask("Sample task", desc: "Sample description")
    }
    
    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
