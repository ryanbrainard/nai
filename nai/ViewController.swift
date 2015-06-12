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
        koreanAgeTextView.text = ageText()
    }
    
    func ageText() -> String {
        switch cal.compareDate(
            birthdayDatePicker.date,
            toDate: NSDate(),
            toUnitGranularity: .CalendarUnitDay) {
        case .OrderedAscending:
            return "In Korea, you are \(yearUnit(koreanAge())) old. " +
            "In the rest of the world, you are \(yearUnit(realAge())) old."
        case .OrderedSame:
            return ""
        case .OrderedDescending:
            return "Whoa there! You were born in the future?"
        }
    }
    
    func koreanAge() -> Int {
        let yearBorn = cal.component(.CalendarUnitYear, fromDate: birthdayDatePicker.date)
        let currYear = cal.component(.CalendarUnitYear, fromDate: NSDate())
        return currYear - yearBorn + 1
    }
    
    func realAge() -> Int {
        return cal.components(
            .CalendarUnitYear,
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}