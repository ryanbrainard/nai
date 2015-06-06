//
//  ViewController.swift
//  nai
//
//  Created by Ryan Brainard on 6/5/15.
//  Copyright (c) 2015 Ryan Brainard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var koreanAge: UITextField!

    @IBAction func birthdayOnChange(sender: UIDatePicker, forEvent event: UIEvent) {
        let cal = NSCalendar.currentCalendar()
        let yearBorn = cal.component(.CalendarUnitYear, fromDate: sender.date)
        let currYear = cal.component(.CalendarUnitYear, fromDate: NSDate())
        koreanAge.text = (currYear - yearBorn + 1).description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

