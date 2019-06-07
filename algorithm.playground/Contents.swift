import UIKit

//알고리즘 1회차 6월 6일
/*
 문자열로 구성된 리스트 strings와, 정수 n이 주어졌을 때, 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 정렬하려 합니다. 예를 들어 strings가 [sun, bed, car]이고 n이 1이면 각 단어의 인덱스 1의 문자 u, e, a로 strings를 정렬합니다.
 
 제한 조건
 strings는 길이 1 이상, 50이하인 배열입니다.
 strings의 원소는 소문자 알파벳으로 이루어져 있습니다.
 strings의 원소는 길이 1 이상, 100이하인 문자열입니다.
 모든 strings의 원소의 길이는 n보다 큽니다.
 인덱스 1의 문자가 같은 문자열이 여럿 일 경우, 사전순으로 앞선 문자열이 앞쪽에 위치합니다.
 입출력 예
 strings             n        return
 [sun, bed, car]     1    [car, bed, sun]
 [abce, abcd, cdx]   2    [abcd, abce, cdx]
 */

func solution1(_ strings:[String], _ n:Int) -> [String] {
    
    let index = String.Index(encodedOffset: n)
    return strings.sorted {($0[index],$0)<($1[index],$1)}
}

print(solution1( ["abce", "abcd", "cdxx","mdke","akse"],3 ))


func solution3(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: {
        let index = $0.index($0.startIndex, offsetBy: n)
//        let index1 = $1.index($1.startIndex, offsetBy: n)
        switch $0[index] {
        case $1[index]:
            return $0 < $1
        default:
            return $0[index] < $1[index]
        }
    })
}

print(solution3(["abce", "abcd", "cdxx","mdke","akse","qeie","dueoq","Qwewe","sxue","owhrg"], 1))



//공부내용

//dropLast 마지막에서 2개 버린다.

let numbers = [1, 2, 3, 4, 5]
print(numbers.dropLast(2))
// Prints "[1, 2, 3]"
print(numbers.dropLast(10))
// Prints "[]"

//dropFirst 처음부터 2개 삭제.
print(numbers.dropFirst(2))
// Prints "[3, 4, 5]"

//prefix 앞에서부터 2개
print(numbers.prefix(2))
// Prints "[1, 2]"
numbers
print(numbers.split(separator: 2))


let students = ["Kofi", "Abena", "Peter", "Kweku","Ard", "Akosua"]
if let i = students.firstIndex(where: { $0.hasPrefix("A")
}) {
    print("\(students[i]) starts with 'A'!")
    
}
// Prints "Abena starts with 'A'!"


let numbers2 = [3, 7, 4, -2, 9, -6, 10, 1]
if let lastNegative = numbers2.last(where: { $0 < 0 }) {
    print("The last negative number is \(lastNegative).")
}
// Prints "The last negative number is -6."


//알고리즘 2회차 6월 7일

////나누어 떨어지는 숫자 배열
// 문제 설명
//array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
//divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.
//
//제한사항
//arr은 자연수를 담은 배열입니다.
//정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
//divisor는 자연수입니다.
//array는 길이 1 이상인 배열입니다.
//입출력 예
//arr            divisor      return
//[5, 9, 7, 10]    5         [5, 10]
//[2, 36, 1, 3]    1      [1, 2, 3, 36]
//[3,2,6]          10         [-1]


func solution10(_ arr:[Int], _ divisor:Int) -> [Int] {
    var save: [Int] = []
    for x in arr {
        if x % divisor == 0 {
            save.append(x)
        }
    }
    if save == [] {
        save.append(-1)
    }
    return save.sorted(by: <)
}
//추가 답
func solution11(_ arr:[Int], _ divisor:Int) -> [Int] {
    let array = arr.sorted().filter{ $0 % divisor == 0 }
    return  array == [] ? [-1] : array
}
