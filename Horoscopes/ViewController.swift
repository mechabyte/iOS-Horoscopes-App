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
    @IBOutlet weak var horoscopeDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setDate(NSDate(),animated: true)
        horoscopeResult.text = ""
        horoscopeDescription.text = ""
        horoscopeDescription.numberOfLines = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateHoroscope(cardinalDay: Int) -> String {
        var sign = String()
        switch cardinalDay {
        case 141...172:
            sign = "Gemini"
        case 173...203:
            sign = "Cancer"
        case 204...234:
            sign = "Leo"
        case 235...265:
            sign = "Virgo"
        case 266...296:
            sign = "Libra"
        case 297...325:
            sign = "Scorpio"
        case 326...355:
            sign = "Sagittarius"
        case 356...366, 1...19:
            sign = "Capricorn"
        case 20...49:
            sign = "Aquarius"
        case 50...79:
            sign = "Pisces"
        case 80...109:
            sign = "Aries"
        default:
           sign = "Taurus"
            
        }
        return sign
    }
    
    func horoscopeContent(zodiac: String) -> String {
        var content = String()
        switch zodiac {
            case "Gemini":
            content = "Tangible results motivate you. Intangible results are extremely demotivating. Please know that just because something is hard to describe doesn’t make it any less real."
            case "Cancer":
            content = "People think about you. People you’ve lost track of and don’t even remember think about you. Your extension of being goes much deeper and farther than you’ll ever know."
            case "Leo":
            content = "The highlight of the day is how your voracious appetite for learning brings you the best that life has to offer. Travel and the arts hold particular interest. Apply your knowledge, and you’ll make money."
            case "Virgo":
            content = "You’ll ask for opinions from the people you admire even though you are well aware that they do not know your world a millionth as well as you know your world. Trust yourself."
            case "Libra":
            content = "A new person in your life has just the maddening quirks and charming idiosyncrasies to thrill and challenge you. Is this attraction or an annoyance? Whatever you feel, you will feel it strongly."
            case "Scorpio":
            content = "One encounter sets off a chain of events. When the scenery around you is different, you’ll know that you’ve progressed. Take pictures to document this remarkable time."
            case "Sagittarius":
            content = "Work brings a mystery, and you’re just the one to solve it. Get others involved, though, so there will be people to applaud your genius in the end."
            case "Capricorn":
            content = "Relaxation and leisure — states that you believe seem better suited to people who aren’t you. At some point, you’ll see how important it is to kick up your heels — but not today."
            case "Aquarius":
            content = "The current cosmic climate is heightening your awareness of others. You may even feel that you can read someone’s thoughts. As your understanding of a loved one deepens, the relationship will become more rewarding."
            case "Pisces":
            content = "The simple pleasures like hot tea, cold soda or a car ride with the windows down are the things that make this day great. Your favorite person is the one who understands that."
            case "Aries":
            content = "When your feelings tell you something different from what the rest of the world seems to be saying, what and whom should you trust? At least you can be heartened by the fact that your uncertainty is a sign of maturity."
            default: // Taurus
            content = "Good news! You don’t have to adjust your schedule to stay in tune with the Earth’s rotation. You’ll be naturally in synch with all the cycles and rhythms you encounter."
        }
        return content
    }

    @IBAction func birthdayChanged(sender: UIDatePicker, forEvent event: UIEvent) {
        let birthday = sender.date
        let cal = NSCalendar.currentCalendar()
        
        let day = cal.ordinalityOfUnit(NSCalendarUnit.Day, inUnit: NSCalendarUnit.Year, forDate: birthday)
        let zodiac = calculateHoroscope(day)
        horoscopeResult.text = "\( zodiac )"
        horoscopeDescription.text = "\( horoscopeContent(zodiac))"
        horoscopeDescription.numberOfLines = 0
    }
}

