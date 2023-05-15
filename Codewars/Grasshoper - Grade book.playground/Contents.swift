import Foundation
import UIKit

func getGrade(_ s1: Int, _ s2: Int, _ s3: Int) -> String {
    var score = (s1 + s2 + s3)/3
    
      switch score {
        case 0...59:
          return "F"
        case 60...69:
          return "D"
        case 70...79:
          return "C"
        case 80...89:
          return "B"
        case 90...100:
          return "A"
        default:
          return "\(score)"
      }
}


//A
print(getGrade(95,90,93) == "A")
print(getGrade(100,85,96) == "A")
print(getGrade(92,93,94) == "A")
print(getGrade(100,100,100) == "A")

//B
print(getGrade(70,70,100) == "B")
print(getGrade(82,85,87) == "B")
print(getGrade(84,79,85) == "B")

//C
print(getGrade(70,70,70) == "C")
print(getGrade(75,70,79) == "C")
print(getGrade(60,82,76) == "C")

//D
print(getGrade(65,70,59) == "D")
print(getGrade(66,62,68) == "D")
print(getGrade(58,62,70) == "D")


//F
print(getGrade(44,55,52) == "F")
print(getGrade(48,55,52) == "F")
print(getGrade(58,59,60) == "F")
print(getGrade(0,0,0) == "F")
