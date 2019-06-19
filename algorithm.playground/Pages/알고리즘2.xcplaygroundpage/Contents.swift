//: [Previous](@previous)

import Foundation

// 6월 19일 수요일
//An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//
//Your goal is to find that missing element.
//
//Write a function:
//
//class Solution { public int solution(int[] A); }
//
//that, given an array A, returns the value of the missing element.
//
//For example, given array A such that:
//
//A[0] = 2
//A[1] = 3
//A[2] = 1
//A[3] = 5
//the function should return 4, as it is the missing element.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//the elements of A are all distinct;
//each element of array A is an integer within the range [1..(N + 1)].

public func solution(_ A : inout [Int]) -> Int {
    var tempArr = A.sorted()
    for x in tempArr.enumerated(){
        guard x.offset + 2 != x.element else {return x.offset+1}
    }
    return A.count+1
    
}









func solution(_ bridge:Int, _ weight:Int, _ trucks:[Int]) -> Int {
    var arriveArr:[Int] = []
    var ingArr:[Int] = []
    for _ in 1...bridge {
        ingArr.append(0)
    }
    var count = 0
    var temp = 0
    for x in trucks {
        count += 1
        
        if count % (bridge+1) == 0 {
            ingArr[bridge-1]
        } else {
            
        }
        
    }
    return count
}



solution(3, 5, [7,4,7])





//: [Next](@next)


