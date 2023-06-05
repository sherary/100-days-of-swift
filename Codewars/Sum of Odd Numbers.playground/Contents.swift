import Foundation

/***
 Given the triangle of consecutive odd numbers:

              1
           3     5
        7     9    11
    13          15          17          19
 21          23          25          27            29
 ...
 
 
 Calculate the sum of the numbers in the nth row of this triangle (starting at index 1) e.g.: (Input --> Output)

 1 -->  1
 2 --> 3 + 5 = 8

 */

/**
        time complexity  O(n^2)
        - Nested array
        - Storing triangle numbers
 */

//func rowSumOddNumbers(_ row: Int) -> Int {
//    var number = 1
//    var triangle: [[Int]] = []
//
//    for i in 1...row {
//        var height: [Int] = []
//        for _ in 1...i {
//            height.append(number)
//            number += 2
//        }
//        triangle.append(height)
//    }
//
//    return triangle[row - 1].reduce(0, +)
//}

/**
         time complexity O(n)
         - removing nested array
         - not storing and appending numbers into array
 */

func rowSumOddNumbers(_ row: Int) -> Int {
    let start = (row * (row - 1)) + 1
    let sum = row * (2 * start + (row - 1))
    return sum
    
    // return row * row * row // clever version from codewars people
}

print(rowSumOddNumbers(1)) // 1
print(rowSumOddNumbers(2)) // 8
print(rowSumOddNumbers(13)) // 2197
print(rowSumOddNumbers(19)) // 6859
print(rowSumOddNumbers(41)) // 68921
print(rowSumOddNumbers(42)) // 74088
print(rowSumOddNumbers(74)) // 405224
print(rowSumOddNumbers(86)) // 636056
print(rowSumOddNumbers(93)) // 804357
print(rowSumOddNumbers(101)) // 1030301
