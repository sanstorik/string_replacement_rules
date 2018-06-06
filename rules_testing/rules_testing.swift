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
        let rulesSentence = findRules("Like it", "Like he")
        let rules = findRules("He go there", "Me go great")
        
        XCTAssertEqual(rulesSizeThree, "sss")
        XCTAssertEqual(rulesSizeTwo, "ss")
        XCTAssertEqual(rulesSizeOne, "s")
        XCTAssertEqual(rulesSentence, "ss")
        XCTAssertEqual(rules, "sssss")
    }
    
    
    func testBiggerSize() {
        let rulesOne = findRules("sitting", "kitten")
        let rulesTwo = findRules("sittignn", "kitten")
        let rulesThree = findRules("sittign", "kitten")
        let sentenceRules = findRules("Hello World", "Hello Mold")
        
        XCTAssertEqual(rulesOne, "ssd")
        XCTAssertEqual(rulesTwo, "ssdd")
        XCTAssertEqual(rulesThree, "ssd")
        XCTAssertEqual(sentenceRules, "ssd")
    }
    
    
    func testLowerSize() {
        let rulesOne = findRules("Sunday", "Saturday")
        let rulesTwo = findRules("move", "mozeve")
        let rulesThree = findRules("Sunday", "Sundakyk")
        let rulesSentence = findRules("History lie", "History lying")
        let rulesSentenceTwo = findRules("This is good", "Thiiiz is doog")

            
        XCTAssertEqual(rulesOne, "iis")
        XCTAssertEqual(rulesTwo, "ii")
        XCTAssertEqual(rulesThree, "ii")
        XCTAssertEqual(rulesSentence, "iis")
        XCTAssertEqual(rulesSentenceTwo, "iisss")
    }
}
