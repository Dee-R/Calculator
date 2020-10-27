//
//  ViewController.swift
//  Calculator
//
//  Created by Eddy R on 23/10/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import UIKit

class Calculator: UIViewController {

    @IBOutlet weak var screen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func number(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
    @IBAction func AddPositifNegatif(_ sender: Any) {
        
    }
    
    @IBAction func operatorCompute(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    
    
    
}


