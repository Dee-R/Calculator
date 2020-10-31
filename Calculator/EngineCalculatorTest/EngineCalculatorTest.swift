//  EngineTests.swift
//  EngineTests

// Probleme 1:  Multiples of 3 and 5

import XCTest
@testable import Calculator

class EngineCalculatorTest: XCTestCase {
    var sut:EngineCalculator! = EngineCalculator()
    
    // MARK: - single
    func test_addNumber_0_result_0() {
        sut.add("0")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_result_result_0() {
        sut.add(".")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_0dot_result_0() {
        sut.add("0.")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_1_result_1() {
        sut.add("1")
        XCTAssertEqual(sut.screen, 1)
    }
    func test_addNumber_2_result_2() {
        sut.add("2")
        XCTAssertEqual(sut.screen, 2)
    }
    func test_addNumber_3_result_3() {
        sut.add("3")
        XCTAssertEqual(sut.screen, 3)
    }
    func test_addNumber_4_result_4() {
        sut.add("4")
        XCTAssertEqual(sut.screen, 4)
    }
    func test_addNumber_5_result_5() {
        sut.add("5")
        XCTAssertEqual(sut.screen, 5)
    }
    func test_addNumber_6_result_6() {
        sut.add("6")
        XCTAssertEqual(sut.screen, 6)
    }
    func test_addNumber_7_result_7() {
        sut.add("7")
        XCTAssertEqual(sut.screen, 7)
    }
    func test_addNumber_8_result_8() {
        sut.add("8")
        XCTAssertEqual(sut.screen, 8)
    }
    func test_addNumber_9_result_9() {
        sut.add("9")
        XCTAssertEqual(sut.screen, 9)
    }
    
    // MARK: - accumulate value
    func test_addNumber_dotDot_result_0() {
        sut.add(".")
        sut.add(".")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_dot0_result_0() {
        sut.add(".")
        sut.add("0")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_00_result_0() {
        sut.add("0")
        sut.add("0")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_01_result_1() {
        sut.add("0")
        sut.add("1")
        XCTAssertEqual(sut.screen, 1)
    }
    
    
    // MARK: - Decimal Number
    func test_addNumber_Dot1Dot_result_Dot1Dot() {
        sut.add("1")
        sut.add(".")
        sut.add("1")
        XCTAssertEqual(sut.screen, 1.1)
    }
    func test_addNumber_1ddd1_result_2() {
        sut.add("1")
        sut.add(".")
        sut.add(".")
        sut.add(".")
        sut.add("1")
        XCTAssertEqual(sut.screen, 1.1)
    }
    func test_addNumber_dotDot1_result_3() {
        sut.add("0")
        sut.add(".")
        sut.add(".")
        sut.add(".")
        sut.add("1")
        XCTAssertEqual(sut.screen, 0.1)
    }
    
    
    // MARK: - Minus Number only
    func test_addNumber_Minus0_result_Minus0() {
        sut.add("0")
        sut.addMinus()
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumber_Minus1_result_Minus1() {
        sut.add("1")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -1)
    }
    func test_addNumber_Minus2_result_Minus2() {
        sut.add("2")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -2)
    }
    func test_addNumber_Minus3_result_Minus3() {
        sut.add("3")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -3)
    }
    func test_addNumber_Minus4_result_Minus4() {
        sut.add("4")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -4)
    }
    func test_addNumber_Minus5_result_Minus5() {
        sut.add("5")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -5)
    }
    func test_addNumber_Minus6_result_Minus6() {
        sut.add("6")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -6)
    }
    func test_addNumber_Minus7_result_Minus7() {
        sut.add("7")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -7)
    }
    func test_addNumber_Minus8_result_Minus8() {
        sut.add("8")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -8)
    }
    func test_addNumber_Minus9_result_Minus9() {
        sut.add("9")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -9)
    }
    
    func test_addNumber_Minus_result_0() {
        sut.addMinus()
        XCTAssertEqual(sut.screen, 0)
    }
    
    func test_addNumber_1d_result_m1() {
        sut.add("1")
        sut.add(".")
        sut.addMinus()
        XCTAssertEqual(sut.screen, -1)
    }
    func test_addNumber_2md3_result_2d3() {
        sut.add("2")
        sut.addMinus()
        sut.add(".")
        sut.add("3")
        sut.addMinus()
        XCTAssertEqual(sut.screen, 2.3)
    }
    
    // MARK: - Operation
    // +
    func test_add_1_1_resut_2() {
        sut.add("1")
        sut.sign("+")
        sut.add("1")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 2)
    }
    func test_add_0_2_resut_2() {
        sut.add("0")
        sut.sign("+")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 2)
    }
    func test_add_1_3_resut_4() {
        sut.add("1")
        sut.sign("+")
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 4)
    }
    func test_add_2_4_resut_6() {
        sut.add("2")
        sut.sign("+")
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 6)
    }
    func test_add_3_5_resut_8() {
        sut.add("3")
        sut.sign("+")
        sut.add("5")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 8)
    }
    func test_add_4_6_resut_10() {
        sut.add("4")
        sut.sign("+")
        sut.add("6")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 10)
    }
    func test_add_5_7_resut_12() {
        sut.add("5")
        sut.sign("+")
        sut.add("7")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 12)
    }
    func test_add_6_8_resut_14() {
        sut.add("6")
        sut.sign("+")
        sut.add("8")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 14)
    }
    func test_add_7_9_resut_16() {
        sut.add("7")
        sut.sign("+")
        sut.add("9")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 16)
    }
    func test_add_8_10_resut_18() {
        sut.add("8")
        sut.sign("+")
        sut.add("10")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 18)
    }
    func test_add_9_11_resut_20() {
        sut.add("9")
        sut.sign("+")
        sut.add("11")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 20)
    }
    
    func test_add_m5_11_resut_1() {
        sut.add("5")
        sut.addMinus()
        sut.sign("+")
        sut.add("6")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 1)
    }
    func test_add_5mAdd6d5mEgalEgal_resultM18() {
        sut.add("5")
        sut.addMinus()
        sut.sign("+")
        sut.add("6")
        sut.add(".")
        sut.add("5")
        sut.addMinus()
        sut.sign("=")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -18)
    }
    func test_add_5mAdd_1d5_d5mEgalEgal_resultM7() {
        sut.add("1")
        sut.add(".")
        sut.add("5")
        sut.addMinus()
        sut.sign("+")
        sut.add("8")
        sut.add(".")
        sut.add("5")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 7)
    }
    
    func test_add_5mAdd_1d5_d5mEgalEgal_resultM7_ChangeOrder1() {
        sut.add("1")
        sut.add(".")
        sut.addMinus()
        sut.addMinus()
        sut.addMinus()
        sut.add("5")
        
        sut.sign("+")
        sut.add("8")
        sut.add(".")
        sut.add("5")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 7)
    }
    
    // *
    func test_product_0() {
        sut.add("2")
        sut.sign("*")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 4)
    }
    func test_product_1() {
        sut.add("3")
        sut.sign("*")
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 9)
    }
    
    func test_product_0_2_resut_2() {
        sut.add("0")
        sut.sign("*")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_product_1_3_resut_4() {
        sut.add("1")
        sut.sign("*")
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 3)
    }
    func test_product_2_4_resut_6() {
        sut.add("2")
        sut.sign("*")
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 8)
    }
    func test_product_3_5_resut_8() {
        sut.add("3")
        sut.sign("*")
        sut.add("5")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 15)
    }
    func test_product_4_6_resut_10() {
        sut.add("4")
        sut.sign("*")
        sut.add("6")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 24)
    }
    func test_product_5_7_resut_12() {
        sut.add("5")
        sut.sign("*")
        sut.add("7")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 35)
    }
    func test_product_6_8_resut_14() {
        sut.add("6")
        sut.sign("*")
        sut.add("8")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 48)
    }
    func test_product_7_9_resut_16() {
        sut.add("7")
        sut.sign("*")
        sut.add("9")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 63)
    }
    func test_product_8_10_resut_18() {
        sut.add("8")
        sut.sign("*")
        sut.add("10")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 80)
    }
    func test_product_9_11_resut_20() {
        sut.add("9")
        sut.sign("*")
        sut.add("11")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 99)
    }
    
    // -
    func test_sub_0_2_resut_2() {
        sut.add("0")
        sut.sign("-")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_1_3_resut_2() {
        sut.add("1")
        sut.sign("-")
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_2_4_resut_2() {
        sut.add("2")
        sut.sign("-")
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_3_5_resut_2() {
        sut.add("3")
        sut.sign("-")
        sut.add("5")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_4_6_resut_2() {
        sut.add("4")
        sut.sign("-")
        sut.add("6")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_5_7_resut_2() {
        sut.add("5")
        sut.sign("-")
        sut.add("7")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_6_8_resut_2() {
        sut.add("6")
        sut.sign("-")
        sut.add("8")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_7_9_resut_2() {
        sut.add("7")
        sut.sign("-")
        sut.add("9")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_8_10_resut_2() {
        sut.add("8")
        sut.sign("-")
        sut.add("10")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    func test_sub_9_11_resut_2() {
        sut.add("9")
        sut.sign("-")
        sut.add("11")
        sut.sign("=")
        XCTAssertEqual(sut.screen, -2)
    }
    
    // /
    func test_quotient_20_3_resut_14() {
        sut.add("2.11")
        sut.sign("/")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 1.055)
    }
    func test_quotient_5_2_resut_2d5() {
        sut.add("5")
        sut.sign("/")
        sut.add("2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 2.5)
    }
    
    func test_quotient_A() {
        sut.add("10")
        sut.sign("/")
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 3.3333333)
    }
    func test_quotient_B_WithoutEgal() {
        sut.add("10")
        sut.sign("/")
        sut.add("3")
        sut.sign("+")
        sut.add("1")
        sut.sign("+")
        XCTAssertEqual(sut.screen, 4.3333333)
    }
    func test_prduct_B_WithoutEgal() {
        sut.add("10")
        sut.sign("/")
        sut.add("3")
        sut.sign("*")
        sut.add("2")
        sut.sign("+")
        XCTAssertEqual(sut.screen, 6.6666666)
    }
    func test_prduct_B_WithEgal() {
        sut.add("10")
        sut.sign("/")
        sut.add("3")
        sut.sign("*") // 3.333333
        
        sut.add("2")
        sut.sign("+") // 6.66666
        
        sut.sign("=") // 8 .66666
        XCTAssertEqual(sut.screen, 13.3333332)
    }
    func test_prduct_C_WithEgal() {
        sut.add("10")
        sut.sign("/")
        sut.add("3")
        sut.sign("*") // 3.333333
        
        sut.add("2")
        sut.sign("*") // 6.66666
        
        sut.sign("=") // 8 .66666
        XCTAssertEqual(sut.screen, 44.4444436)
    }
    
    
    // MARK: - Del
    func test_1del2_1_resut_3() {
        sut.add("1")
        sut.del()
        sut.add("2")
        
        sut.sign("+")
        
        sut.add("1")
        
        sut.sign("=")
        XCTAssertEqual(sut.screen, 3)
    }
    func test_1del2_2del4_resut6() {
        sut.del()
        sut.add("1")
        sut.del()
        sut.add("2")
        
        sut.sign("+")
        
        sut.add("3")
        sut.del()
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 6)
    }
    
    // with floating
    func test_1del2_1_resut_4() {
        sut.del()
        sut.add("1")
        sut.add(".")
        sut.add("3")
        sut.del()
        sut.add("2")
        
        sut.sign("+")
        
        sut.add("3")
        sut.del()
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 6)
    }
    func test_1del2_1_resut_4_A() {
        sut.del()
        sut.add("1")
        sut.add(".")
        sut.add("3")
        sut.del()
        sut.add("2")
        sut.del()
        sut.add(".")
        
        sut.sign("+")
        
        sut.add("3")
        sut.del()
        sut.add("4")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 4)
    }
    
    
    func test_5delD_add_3_result_3() {
        sut.add("5")
        sut.del()
        sut.add(".")
        
        sut.sign("+")
        
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 3)
    }
    func test_1d3del2d5__3del4d5_resut_7() {
        sut.add("5")
        sut.del()
        sut.add(".")
        
        sut.sign("+")
        
        sut.add("3")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 3)
    }
    
    //    // MARK: - Clear
    func test_clear_0() {
        sut.add("1.1")
        sut.add("1.1")
        sut.add("1.1")
        sut.sign("+")
        sut.add("2.2")
        sut.clear()
        sut.sign("=")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_clear_1() {
        sut.add("1.1")
        sut.sign("+")
        sut.clear()
        sut.add("2.2")
        sut.sign("=")
        XCTAssertEqual(sut.screen, 2.2)
    }
    
    // MARK: - Add dot
    func test_add_Dot_and_show_ZeroWithDot() {
        sut.add(".")
        XCTAssertEqual(sut.screen, 0)
    }
    func test_addNumberAfterDot_returnExactValue() {
        sut.add(".")
        sut.add("5")
        sut.add("5")
        sut.add("5")
        XCTAssertEqual(sut.screen, 0.555)
    }
}
