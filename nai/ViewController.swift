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
    @IBOutlet weak var koreanAgeTextView: UITextView!
    let cal = NSCalendar.currentCalendar()

    @IBAction func birthdayOnChange(sender: UIDatePicker, forEvent event: UIEvent) {
        koreanAgeTextView.text =
            "In Korea, you are \(yearUnit(koreanAge())) old. " +
            "In the rest of the world, you are \(yearUnit(realAge())) old."
    }
    
    func koreanAge() -> Int {
        let yearBorn = cal.component(.CalendarUnitYear, fromDate: birthdayDatePicker.date)
        let currYear = cal.component(.CalendarUnitYear, fromDate: NSDate())
        return currYear - yearBorn + 1
    }
    
    func realAge() -> Int {
        return cal.components(
            NSCalendarUnit.CalendarUnitYear,
            fromDate: birthdayDatePicker.date,
            toDate: NSDate(),
            options: nil
        ).year
    }
    
    func yearUnit(count: Int) -> String {
        return "\(count) year".pluralize(count)
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