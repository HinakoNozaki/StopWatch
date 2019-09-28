//
//  ViewController.swift
//  StopWatch
//
//  Created by 野崎陽奈子 on 2019/09/11.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    var count: Float = 0.0
    
    var  timer: Timer = Timer()
    
    @IBOutlet var hanteiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    func hantei(){
        if count>9.80 && count<10.20 {
            hanteiLabel.text = "PERFECT!"
        }else if count>9.70 && count<10.30 {
            hanteiLabel.text = "GREAT!"
        }else if count>9.50 && count<10.50 {
            hanteiLabel.text = "GOOD!"
        }else{
            hanteiLabel.text = "BAD!"
        }
    }

    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        hanteiLabel.text = ""
        
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
         self.hantei()
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }else{
            count = 0.0
            label.text = String(format: "%.2f", count)
        }
    }


}

