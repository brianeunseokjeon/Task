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


// 100100001

func algo(num:Int) -> Int {
    var count = 0
    var firstCount = 0
    for x in "\(num)" {
        
        if x == "1" {
            if firstCount >= count {
                count = 0
            } else {
                firstCount = count
            }
        }else {
            count += 1
        }
    }
    return firstCount
}

//7월 2일 화요일 알고리즘 스킬트리 -> 못해서 7월 3일 수요일에도 함.
//스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
//스킬 순서와 스킬트리는 문자열로 표기합니다.
//예를 들어, C → B → D 라면 CBD로 표기합니다
//선행 스킬 순서 skill의 길이는 2 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
//skill_trees는 길이 1 이상 20 이하인 배열입니다.
//skill_trees의 원소는 스킬을 나타내는 문자열입니다.
//skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.
//입출력 예
//skill    skill_trees    return
//    CBD    [BACDE, CBADF, AECB, BDA]    2
//입출력 예 설명
//BACDE: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트립니다.
//CBADF: 가능한 스킬트리입니다.
//AECB: 가능한 스킬트리입니다.
//BDA: B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트리입니다.

// 시도 는 스킬을 먼저 배열에 담는다. 스킬에 있는 첫번째 문자가 일단 스킬트리에 잇는 첫번째 원소가 몇번째에 가지고 있는지 체크.
// 두번째 스킬배열에 있는 문자가 스킬트리에 잇는 첫번째 원소의 몇번째에 가지고 있는지 체크 해서 첫번째 와 두번째 숫자 카운트 체크해서 두번째가 더 크지않으면 break 다음 스킬트리배열의 원소를 사용.
func solution709(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    var skillArray :[Character:Int] = [:]
    var temp :[Int] = []
    var count = 0
    
    for x in skill.enumerated() {
        if !(skillArray[x.element] != nil) {
        skillArray[x.element] = x.offset
        }
    }
    for x in skill_trees {
        temp = []
        count = 0
        
        for y in x {
            if (skillArray[y] != nil) {
                temp.append(skillArray[y] ?? 100)
            }
        }
        if temp.isEmpty {
            answer += 1
        } else {
            for z in temp.enumerated() {
                if z.offset != z.element {
                    count += 1
                }
            }
            if count == 0 {
                answer += 1
            }
        }
    }

    return answer
}


// 실패하다가... 7월 9일에 성공함
//func solution701(_ skill:String, _ skill_trees:[String]) -> Int {
//    var skillArray :[Character] = []
//    var answer = 0
//    var tempCount = 0
//    var count = 0
//    var anotherCount = 0
//    var no = 0
//
//
//    for x in skill {
//        skillArray.append(x)
//    }
//
//
//    for x in skill_trees {
//        no = 0
//        count = 0
//        tempCount = 0
//        anotherCount = 0
//
//
//        for k in skillArray/* SBAKL */ {
//            count = 0
//            for y in x /* SBERTL */ {
//                count += 1
//                if k == y {
//                    if count > tempCount {
//                tempCount = count
//                        no = 1
//                    break
//                    } else {
//                        print("오류 :",x)
//                        no = 10
//                        break
//                    }
//                }
//            }
//            if no == 10 {
//                break
//            }
//            print(k,"여기에 뭔가 걸려야 되는데",x,"그냥 count:",count,"tempCount :",tempCount)
//            if skillArray[0] == k && count == x.count && no != 1{
//                print("오류2 :" ,x)
//                no = 10
//                break
//            }
////            print(k,"여기서","tempCount :",tempCount,"count :",count)
//        }
//
//        print("no :",no, "x :", x)
//        if no == 1 {
//            print("dfdfdfdfdfdfdfsfdazdfaefa",x)
//            answer += 1
//        }
//
//        for j in skillArray {
//            if !x.contains(j) {
//                anotherCount += 1
//            }
//        }
//        if anotherCount == skillArray.count {
//            print("여긴누가 들어가니? :",x)
//            answer += 1
//        }
//    }
//
//    return answer
//}



solution709("CBD", ["BACDE", "CBADF", "AECB", "BDA"])
solution709("CB", ["ADE","CERK"])
solution709("SBAKL", ["SEBRLT"])


// 다른사람 풀이!!
func solution7091(_ skill:String, _ skill_trees:[String]) -> Int {
    
    func available(_ s: String, _ t: String) -> Bool {
        let alza = t.filter { s.contains($0) }
        return s.starts(with: alza)
    }
    
    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
}

solution7091("CBD", ["BACDE", "CBADF", "AECB", "BDA"])
solution7091("CB", ["ADE","CERK"])
solution7091("SBAKL", ["SEBRLT"])


let aip = "abcde".filter{"adekl".contains($0)}
"abcde".starts(with: aip)



//: [Next](@next



