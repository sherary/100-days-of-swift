func factorial(_ num: Int) -> Int {
    return num == 0 ? 1 : (1...num).reduce(1, *)
}

func strongNumber(_ number: Int) -> String {
    var arr = String(number).split(separator: "").compactMap { Int($0) }
    var result = [Int]()
    
    for num in arr {
        result.append(factorial(num))
    }
    
    return result.reduce(0, +) == number ? "STRONG!!!!" : "Not Strong !!"
}

print(strongNumber(1)) // "STRONG!!!!"
print(strongNumber(2)) // "STRONG!!!!"
print(strongNumber(145)) // "STRONG!!!!"
print(strongNumber(7)) // "Not Strong !!"
print(strongNumber(93)) // "Not Strong !!"
print(strongNumber(185)) // "Not Strong !!"
