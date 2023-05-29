import Foundation

/**
 
 Implement a function to calculate the distance between two points in n-dimensional space. The two points will be passed to your function as arrays of the same length (tuples in Python).

 Round your answers to two decimal places.

 */

func euclideanDistanceBetween(_ point1: [Double], and point2: [Double]) -> Double {
    let squaredDifferences = zip(point1, point2).map { pow($0 - $1, 2) }
    let sumOfSquaredDifferences = squaredDifferences.reduce(0, +)
    let distance = sqrt(sumOfSquaredDifferences)
    return (distance * 100).rounded() / 100
}


print(euclideanDistanceBetween([-1], and: [2])) // 3.0
print(euclideanDistanceBetween([-1, 2], and: [2, 4])) // 3.61
print(euclideanDistanceBetween([-1, 2, 5], and: [2, 4, 9])) // 5.39

