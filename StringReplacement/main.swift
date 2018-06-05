import Foundation


fileprivate func main() {
    let first = String("def")
    let second = String("def")
    
    print(findRules(first, second))
}


public func findRules(_ first: String, _ second: String) -> String {
    var rules = ""
    
    return equalCharNumber(first, second)
}


private func equalCharNumber(_ first: String, _ second: String) -> String {
    let replaceOperation: Operation = ReplaceOperation()
    var rules = ""
    var changed = first
    
    for i in 0..<changed.count {
        if changed[i] != second[i] {
            rules.append(replaceOperation.execute(&changed, second, at: i))
        }
    }
    
    return rules
}


main()
