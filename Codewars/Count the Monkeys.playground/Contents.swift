func monkeyCount(_ n: Int) -> [Int] {
    
    //functional way
//    return Array(1...n)

    //iterative way
    var num = [Int]()
        
    for i in 1...n {
        num.append(i)
    }
    
    return num
}

print((monkeyCount(5), [1, 2, 3, 4, 5]))
