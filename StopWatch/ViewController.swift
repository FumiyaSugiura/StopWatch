//
//  ViewController.swift
//  StopWatch
//
//  Created by 杉浦文哉 on 2018/11/03.
//  Copyright © 2018 杉浦文哉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
     @IBOutlet weak var stopBtn: UIButton!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func up(){
        count += 0.01
        label.text = String(format: "%.2f", count)
    }
    @objc func down(){
        count -= 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
    }
    @IBAction func stop(){
        
        if timer.isValid{
            timer.invalidate()
            stopBtn.setTitle("Reset", for: .normal)
        }else {
            count = 0.0
            label.text=String(format: "%.2f", count)
            stopBtn.setTitle("Stop", for: .normal)
        }
        
    }
    
    
    
}

