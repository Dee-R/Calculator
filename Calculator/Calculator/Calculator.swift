//
//  ViewController.swift
//  Calculator
//
//  Created by Eddy R on 23/10/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class Calculator: UIViewController {
    
    var engine = EngineCalculator()
    @IBOutlet weak var screen: UILabel!
    @IBOutlet var buttons: [UIButton]!
    private var myscreen: Double = 0 {
        didSet {
            screen.text = myscreen.clean
        }
    }
    
    func updateFocusPicture(sender: UIButton) {
        DispatchQueue.global(qos: .background).sync {
            for button in buttons {
                button.backgroundColor = UIColor.lightGray
            }
        }
        sender.backgroundColor = .orange
    }
    
    @IBAction func number(_ sender: UIButton) {
        updateFocusPicture(sender: sender)
        
        print("🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶\n")
        // ✔︎
        if let textLabel = screen.text {
            if textLabel.count <= 9 {
                    engine.add(sender.titleLabel?.text ?? "")
                    myscreen = engine.screen
//                    print(engine.screen)
            }
        }
        if let buttonText = sender.titleLabel?.text {
            if buttonText == "." {
                screen.text?.append(".")
            }
        }
    }
    
    @IBAction func AddPositifNegatif(_ sender: UIButton) {
        updateFocusPicture(sender: sender)
        
        engine.addMinus()
        myscreen = engine.screen
    }
    
    @IBAction func operatorCompute(_ sender: UIButton) {
        updateFocusPicture(sender: sender)
        
        if let sign = sender.titleLabel?.text {
            engine.sign(sign)
            myscreen = engine.screen
//            print(myscreen)
        }
        
    }
    
    @IBAction func del(_ sender: UIButton) {
        updateFocusPicture(sender: sender)
        
        engine.del()
        myscreen = engine.screen
    }
    
    @IBAction func c(_ sender: UIButton) {
        updateFocusPicture(sender: sender)
        
        engine.clear()
        myscreen = engine.screen
    }
    
}

/*
 f f f
 O x x
 
 f f f
 x o x
 */
