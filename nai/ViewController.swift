//
//  ViewController.swift
//  nai
//
//  Created by Ryan Brainard on 6/5/15.
//  Copyright (c) 2015 Ryan Brainard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var koreanAgeTextField: UITextField!

    @IBAction func birthdayOnChange(sender: UIDatePicker, forEvent event: UIEvent) {
        renderKoreanAge()
    }
    
    func renderKoreanAge() {
        koreanAgeTextField.text = koreanAge().description + " years old"
    }
    
    func koreanAge() -> Int {
        let cal = NSCalendar.currentCalendar()
        let yearBorn = cal.component(.CalendarUnitYear, fromDate: birthdayDatePicker.date)
        let currYear = cal.component(.CalendarUnitYear, fromDate: NSDate())
        return currYear - yearBorn + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayDatePicker.maximumDate = NSDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}