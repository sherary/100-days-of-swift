import Foundation

/**
 
 Take an integer n (n >= 0) and a digit d (0 <= d <= 9) as an integer.

 Square all numbers k (0 <= k <= n) between 0 and n.

 Count the numbers of digits d used in the writing of all the k**2.

 Implement the function taking n and d as parameters and returning this count.


 */

func nbDig(_ n: Int, _ d: Int) -> Int {
  // your code
    let count = (0...n).map { element in
        let squared = element * element
            return String(squared).filter { $0.isNumber && Int(String($0)) == d }.count
    }.reduce(0, +)

    return count
}

print(nbDig(25, 1))
print(nbDig(100, 2))
