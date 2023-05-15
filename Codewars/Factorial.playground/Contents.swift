func factorial(_ n: Int) -> UInt64 {
//    if n == 0 {
//        return UInt64(1)
//    } else {
//        return UInt64(n) * factorial(n - 1)
//    }
    return n == 0 ? 1 : (1...UInt64(n)).reduce(1, *)
}

print(factorial(1)) //1
print(factorial(2)) //2
print(factorial(3)) //6
print(factorial(4)) //24
print(factorial(5)) //120
print(factorial(6)) //720
print(factorial(7)) //5040
