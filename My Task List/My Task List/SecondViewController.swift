//
//  SecondViewController.swift
//  My Task List
//
//  Created by Eric Öster on 07.02.16.
//  Copyright © 2016 Eric Öster. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtTask:UITextField!
    @IBOutlet var txtDesc:UITextField!
    @IBOutlet var chkAdditionalTask:UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Falls irgendwo auf der Maske getapt wird, wird der Editierungsmodus beendet und die Tastatur verschwindet.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    // Empfänger für Events vom Button "Save"
    @IBAction func save() {
        Taskmgr.addTask(txtTask.text!, desc: txtDesc.text!)
        
        self.txtTask.text = ""
        self.txtDesc.text = ""
        
        // Falls die Checkbox angehakt ist, wechsele in das erste Feld
        if(self.chkAdditionalTask.on) {
            self.txtTask.becomeFirstResponder()
        } else {
            self.view.endEditing(true)
            self.tabBarController?.selectedIndex = 0
        }
        
    }
    
}

