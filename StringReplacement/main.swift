import Foundation


fileprivate func main() {
    let first = String("sittign")
    let second = String("kitten")
    
    print(findRules(first, second))
}


public func findRules(_ first: String, _ second: String) -> String {
    if first == second {
        return "none"
    } else if first.count < second.count {
        return descendingCharNumberReplacement(first, second)
    } else if first.count > second.count {
        return ascendingCharNumberReplacement(first, second)
    } else {
        return equalCharNumberReplacement(first, second)
    }
}


private func descendingCharNumberReplacement(_ first: String, _ second: String) -> String {
    let insertOperation: Operation = InsertOperation()
    let replaceOperation: Operation = ReplaceOperation()
    var changed = first
    var rules = ""
    
    for i in 0..<second.count {
        
    }
    
    return rules
}


private func ascendingCharNumberReplacement(_ first: String, _ second: String) -> String {
    let deleteOperation: Operation = DeleteOperation()
    let replaceOperation: Operation = ReplaceOperation()
    var changed = first
    var rules = ""
    
    
    func manageLastCharacter(at index: Int) {
        let endingString = first.substring(from: index + 1, to: first.count)
        
        // we can do it without replacing by only deleting
        if endingString.contains(second[index]) {
            // to keep track at which position should we delete
            var indexToDelete = index
            // we keep only first intrance of needed character
            var foundLastCharacter = false
            
            for i in index..<first.count {
                if first[i] != second[index] || foundLastCharacter {
                    rules.append(deleteOperation.execute(&changed, second, at: indexToDelete))
                    indexToDelete -= 1
                } else {
                    foundLastCharacter = true
                }
                
                indexToDelete += 1
            }
        } else {
            //change last character if needed
            if changed[index] != second[index] {
                rules.append(replaceOperation.execute(&changed, second, at: index))
            }
            
            // get rid of redundant part
            for _ in index + 1..<first.count {
                rules.append(deleteOperation.execute(&changed, second, at: index + 1))
            }
        }
    }
    
    
    for i in 0..<second.count - 1 {
        if changed[i] != second[i] {
            rules.append(replaceOperation.execute(&changed, second, at: i))
        }
    }
    
    manageLastCharacter(at: second.count - 1)
    
    print(changed)
    
    return rules
}


private func equalCharNumberReplacement(_ first: String, _ second: String) -> String {
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
