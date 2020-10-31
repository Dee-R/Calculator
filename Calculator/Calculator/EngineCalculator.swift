//
//  Engine.swift
//  Engine
//
//  Created by Eddy R on 23/10/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//

import Foundation

class EngineCalculator {
    
   
    var screen: Double = 0 // show result on the screen
    
    private var tempString:String = "" // tempory var when write double in string ( String + NSDecimalNumber is better than Double or Float because you avoid to loose precision when computing.
    private var tempComputing:Double = 0 // temporary var to keep copy  of first number for futur computing
    private var signUsed = "" // sign used for computing + - / *
    
    private var isComputing = false  // flag is computing
    private var isEnding = false // flag computing is finished when press = button
    private var isMinus = false // flag when minus is apply on a number
    private var isAddingDot = false // flag to knows is the dot is already used
    
    private let roundFloatNumberTo:Int = 7
    
    func addMinus() {
        if isMinus == false {
            if screen > 0 {
                screen = -screen
            } else {
                screen = 0
            }
            isMinus = true
        } else {
            if screen < 0 {
                screen =  screen - (screen*2)
                
            } else {
                screen = 0
            }
            isMinus = false
        }
    }
    
    func add(_ numberAdded: String) {
        isComputing = true
        isEnding = false
        
        // Filter Entry
        if numberAdded == "." && isAddingDot == false {
            tempString += numberAdded
            isAddingDot = true
        } else if numberAdded == "." && isAddingDot == true {
            return
        } else {
            tempString += numberAdded
        }
        
        // Check Filter For Minus
        if isMinus == true {
            screen = -NSDecimalNumber(string: tempString).doubleValue.roundTo(places: roundFloatNumberTo)
        } else {
            screen = NSDecimalNumber(string: tempString).doubleValue.roundTo(places: roundFloatNumberTo)
            
        }
    }
    
    func del() {
        // reset last number
        screen =  0
        if signUsed == "" {
            tempComputing = 0
        }
        tempString = ""
        isMinus =  false
        isAddingDot = false
    }
    func clear() {
        screen =  0
        
        tempString = ""
        tempComputing = 0
        signUsed = ""
        
        isMinus =  false
        isAddingDot = false
        isEnding = false
        isAddingDot = false
    }
    
    
    func sign(_  sign: String) {
        switch sign {
            case "+":
                computingWith(sign: sign)
                break
            case "-":
                computingWith(sign: sign)
                break
            case "*":
                computingWith(sign: sign)
                break
            case "/":
                computingWith(sign: sign)
                break
            
            case "=":
                isAddingDot = false
                if isMinus {
                    tempString = "-" + tempString
                    isMinus = false
                }
                computingResultWith(sign: signUsed)
                break
            
            default:
                break
        }
    }
    var signUsedPreviously = ""
    private func computingWith(sign: String) {
        signUsed = sign
        isAddingDot = false
        
        if isMinus {
            tempString = "-" + tempString
            isMinus = false
        }
        
        // calcul la precedent operation quand j'ai cliké sur le nouveau lien
        if signUsed == sign && isComputing == true && isEnding == false {
            if signUsedPreviously == "" {
                signUsedPreviously = sign
            } else if signUsedPreviously == "/" {
                screen = (tempComputing / screen).roundTo(places: roundFloatNumberTo)
                tempComputing = (tempComputing / screen).roundTo(places: roundFloatNumberTo)
                signUsedPreviously = signUsed
            } else if signUsedPreviously == "*"{
                tempComputing = (tempComputing * screen).roundTo(places: roundFloatNumberTo)
                screen = tempComputing.roundTo(places: roundFloatNumberTo)
                signUsedPreviously = signUsed
            } else if signUsedPreviously == "-"{
                screen = (screen - tempComputing).roundTo(places: roundFloatNumberTo)
                tempComputing = (tempComputing - screen).roundTo(places: roundFloatNumberTo)
                signUsedPreviously = signUsed
            } else {
                screen = (tempComputing + screen).roundTo(places: roundFloatNumberTo)
                tempComputing = (tempComputing + screen).roundTo(places: roundFloatNumberTo)
                signUsedPreviously = signUsed
            }
        }
        
        tempComputing = screen // keep copy to might continue computing
        tempString = ""
        isComputing = false
    }
    private func computingResultWith(sign:String) {
        if signUsed == sign {
            if isEnding == true {
                if let tempStringToDouble = Double(tempString) {
                    switch sign {
                        case "+":
                            screen += tempStringToDouble
                            break
                        case "*":
                            screen *= tempStringToDouble
                            break
                        case "/":
                            screen /= tempStringToDouble
                            break
                        case "-":
                            screen -= tempStringToDouble
                            break
                        default:
                            break
                    }
                }
            } else {
                // ---
                switch sign {
                    case "+":
                        screen = (tempComputing + screen).roundTo(places: roundFloatNumberTo)
                        isEnding = true
                        break
                    case "*":
                        screen = (tempComputing * screen).roundTo(places: roundFloatNumberTo)
                        isEnding = true
                        break
                    case "/":
                        screen = (tempComputing / screen).roundTo(places: roundFloatNumberTo) // ✔︎
                        isEnding = true
                        break
                    case "-":
                        screen = (tempComputing - screen).roundTo(places: roundFloatNumberTo)
                        isEnding = true
                        break
                    default:
                        break
                }
            }
        } else {
            screen = screen - tempComputing
        }
    }
}


extension NSDecimalNumber {
    func rounded(places: Int) -> NSDecimalNumber {
        var decimalValue = self.decimalValue
        var result: Decimal = 0
        NSDecimalRound(&result, &decimalValue, places, .plain)
        return NSDecimalNumber(decimal: result)
    }
}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    mutating func roundUpEd(toNearest: Double) {
        self = ceil(self / toNearest) * toNearest
    }
}

