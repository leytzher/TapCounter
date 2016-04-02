//
//  ViewController.swift
//  TapCounter
//
//  Created by Family on 4/2/16.
//  Copyright © 2016 Premium Business LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberCount: UILabel!
    var currentNumber : Int = 0
    
    var myMagicNumber : Int = Int(arc4random_uniform(20))+1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMe(sender: UIButton) {
        currentNumber += 1
        numberCount.text = String(currentNumber)
        
        var randRed : CGFloat = CGFloat(drand48())
        var randGreen : CGFloat = CGFloat(drand48())
        var randBlue : CGFloat = CGFloat(drand48())
        

        numberCount.textColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1.0)
        numberCount.shadowColor = UIColor.lightGrayColor()
        numberCount.shadowOffset = CGSizeMake(5, 5)
        
        if currentNumber == myMagicNumber {
            self.performSegueWithIdentifier("segue", sender: nil)
            
            

        }


        
    }
    
    @IBAction func resetMe(sender: UIButton) {

        currentNumber = 0
        numberCount.text = String(currentNumber)
        numberCount.shadowColor = UIColor.grayColor()
        numberCount.shadowOffset = CGSizeMake(5, 5)
        // reset magic Number
        myMagicNumber =  Int(arc4random_uniform(20))+1

        
    }
    

}

