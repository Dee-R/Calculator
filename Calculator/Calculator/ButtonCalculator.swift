//
//  ButtonCalculator.swift
//  Calculator
//
//  Created by Eddy R on 30/10/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation
import UIKit
class ButtonCalculator: UIButton{
    
//    override var isSelected: Bool {
//        didSet {
//            print(isSelected)
//            changeColor()
//        }
//    }
//    
//    func changeColor() {
//        if self.isSelected == true {
//            self.backgroundColor = UIColor.orange
//        } else {
//            print(self.tag)
//            self.backgroundColor = UIColor.red
//        }
//    }
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup() {
        
    }
    
}
