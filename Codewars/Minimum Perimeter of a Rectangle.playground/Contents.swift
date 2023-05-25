import Foundation

/**
 
 A rectangle is can be defined by two factors: height and width.

 Its area is defined as the multiplication of the two: height * width.

 Its perimeter is the sum of its four edges: height + height + width + width.

 It is possible to create rectangles of the same area but different perimeters. For example, given an area of 45, the possible heights, widths and resultant perimeters would be:

 (1, 45) = 92

 (9, 5) = 28

 (15, 3) = 36

 Note that (6, 7.5) has an area of 45 too, but is discarded in this kata because its width is non integral.
 
 The task is to write a function that, given an area as a positive integer, returns the smallest perimeter possible of a rectangle with integral side lengths.

 Input range:
 1 <= area <= 5 x 10 ^ 10
 
 */

func minimumPerimeter(_ area: Int64) -> Int64 {
    var width = Int64(sqrt(Double(area)))
        
    while area % width != 0 {
        width -= 1
    }
        
    return width * 2 + area / width * 2
}


print(minimumPerimeter(45)) // 28
print(minimumPerimeter(30)) // 22
print(minimumPerimeter(81)) // 36
print(minimumPerimeter(89)) // 180
print(minimumPerimeter(10000019)) // 20000040
print(minimumPerimeter(982451653)) // 1964903308
