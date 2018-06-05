

protocol Operation {
    var rule: String { get }
    
    // executes operation on first string using character from second one
    // and returns rule name
    func execute(_ first: inout String, _ second: String, at index: Int) -> String
}


class InsertOperation: Operation {
    let rule = "i"
    
    func execute(_ first: inout String, _ second: String, at index: Int) -> String {
        first.insert(second[index], at: first.index(first.startIndex, offsetBy: index))
        
        return rule
    }
}


class DeleteOperation: Operation {
    let rule = "d"
    
    func execute(_ first: inout String, _ second: String, at index: Int) -> String {
        first.remove(at: first.index(first.startIndex, offsetBy: index))
        
        return rule
    }
}


class ReplaceOperation: Operation {
    let rule = "s"
    
    func execute(_ first: inout String, _ second: String, at index: Int) -> String {
        first.replaceChar(at: index, with: second[index])
        return rule
    }
}



extension String {
    mutating func replaceChar(at position: Int, with char: Character) {
        let leftIndex = index(startIndex, offsetBy: position)
        let rightIndex = index(startIndex, offsetBy: position + 1)
        
        replaceSubrange(leftIndex..<rightIndex, with: String(char))
    }
    
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(startIndex, offsetBy: to)

        return String(self[start..<end])
    }
    
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}
