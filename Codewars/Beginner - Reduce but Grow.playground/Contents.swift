func grow(_ arr: [Int]) -> Int {
    //iterative
//    var result = 1
//    for num in arr {
//        result *= num
//    }
    
    //functional way
    return arr.reduce(1, *)
}

print(grow([1,2,3])) //6
print(grow([4,1,1,1,4])) //16
print(grow([2,2,2,2,2,2])) //64
