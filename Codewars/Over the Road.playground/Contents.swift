import Foundation

/**
 
 You've just moved into a perfectly straight street with exactly n identical houses on either side of the road. Naturally, you would like to find out the house number of the people on the other side of the street. The street looks something like this:

 1|   |6
 3|   |4
 5|   |2
  you
 
 Evens increase on the right; odds decrease on the left.
 House numbers start at 1 and increase without gaps.
 When n = 3, 1 is opposite 6, 3 opposite 4, and 5 opposite 2.
 
 
 Given your house number address and length of street n,
 give the house number on the opposite side of the street.
 
 */

func overTheRoad(address: Int, street: Int) -> Int {
  // Your code goes here
    var even = [Int]()
    var odd = [Int]()
    
    var arr = Array(1...street * 2)
    
    for num in arr {
        if num % 2 == 0 {
            even.append(num)
        } else {
            odd.append(num)
        }
    }
    
    even.sort { $0 > $1 }
    
    if address % 2 == 0 {
        if let index = even.firstIndex(where: { $0 == address }) {
            return odd[index]
        }
    } else {
        if let index = odd.firstIndex(where: { $0 == address }) {
            return even[index]
        }
    }
    
    return 0
    
    /**
            TIme Complexity : O(n * log n)
            Space Complexity: O(n)
     
                n = street
     */
}

//alternative
//func overTheRoad(address: Int, street: Int) -> Int {
//    let maxAddress = street * 2
//    let oppositeAddress = maxAddress - address + 1
//    return oppositeAddress
//}


print(overTheRoad(address: 1, street: 3)) //6
print(overTheRoad(address: 3, street: 3)) //4
print(overTheRoad(address: 2, street: 3)) //5
print(overTheRoad(address: 3, street: 5)) //8
