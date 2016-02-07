//
//  FirstViewController.swift
//  My Task List
//
//  Created by Eric Öster on 07.02.16.
//  Copyright © 2016 Eric Öster. All rights reserved.
//

import UIKit

var Taskmgr: TaskManager = TaskManager()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Protokoll UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Taskmgr.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = Taskmgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = Taskmgr.tasks[indexPath.row].desc
        
        return cell
    }

    // Refresh der Maske
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    // Löschfunktion einer Zeile
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            Taskmgr.tasks.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}

