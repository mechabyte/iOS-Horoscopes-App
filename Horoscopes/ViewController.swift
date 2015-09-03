//
//  ViewController.swift
//  Horoscopes
//
//  Created by Matthew Smith on 9/3/15.
//  Copyright © 2015 Matthew Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var horoscopeResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setDate(NSDate(),animated: true)
        horoscopeResult.text = ""
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func birthdayChanged(sender: UIDatePicker, forEvent event: UIEvent) {
        let birthday = sender.date
        let cal = NSCalendar.currentCalendar()
        
        let day = cal.ordinalityOfUnit(NSCalendarUnit.Day, inUnit: NSCalendarUnit.Year, forDate: birthday)
        horoscopeResult.text = "\(day)"
    }
}

