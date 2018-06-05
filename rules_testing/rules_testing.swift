import XCTest
@testable import StringReplacement

class rules_testing: XCTestCase {
    
    func testEqualStrings() {
        let rules = findRules("myname", "myname")
        
        XCTAssertEqual(rules, "none")
    }
    
    
    func testEqualSize() {
        let rulesSizeThree = findRules("abc", "def")
        let rulesSizeTwo = findRules("dk", "ps")
        let rulesSizeOne = findRules("d", "p")
        
        XCTAssertEqual(rulesSizeThree, "sss")
        XCTAssertEqual(rulesSizeTwo, "ss")
        XCTAssertEqual(rulesSizeOne, "s")
    }
    
    
    func testBiggerSize() {
        let rulesOne = findRules("sitting", "kitten")
        let rulesTwo = findRules("sittignn", "kitten")
        let rulesThree = findRules("sittign", "kitten")
        
        XCTAssertEqual(rulesOne, "ssd")
        XCTAssertEqual(rulesTwo, "ssdd")
        XCTAssertEqual(rulesThree, "ssd")
    }
}
