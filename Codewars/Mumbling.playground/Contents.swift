import Foundation

/**
 
 This time no story, no theory. The examples below show you how to write function accum:

 Examples:
 accum("abcd") -> "A-Bb-Ccc-Dddd"
 accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
 accum("cwAt") -> "C-Ww-Aaa-Tttt"
 The parameter of accum is a string which includes only letters from a..z and A..Z.
 
 */

//func accum(_ s: String) -> String {
//    var result = ""
//    let characters = Array(s)
//
//    for (index, char) in characters.enumerated() {
//        let repeatCount = index + 1
//        let repeatedString = String(repeating: char, count: repeatCount)
//        let transformedString = repeatedString.prefix(1).uppercased() + repeatedString.dropFirst().lowercased()
//        result += transformedString + (index < characters.count - 1 ? "-" : "")
//    }
//
//    return result
//}

//clever version
func accum(_ str: String) -> String {
    return str.enumerated().map {
        repeatElement(String($1), count: $0 + 1)
            .joined()
            .capitalized
    }
        .joined(separator: "-")
}

print(accum("abcd")) // "A-Bb-Ccc-Dddd"
print(accum("RqaEzty")) // "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
print(accum("cwAt")) // "C-Ww-Aaa-Tttt"
