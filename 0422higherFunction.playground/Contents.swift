import UIKit
/***************************************************

[ 1번 문제 ]
Pet 타입의 배열을 파라미터로 받아 그 배열에 포함된 Pet 중 강아지의 나이만을 합산한 결과를 반환하는 sumDogAge
 함수 구현 func sumDogAge(pets: [Pet]) -> Int
[ 2번 문제 ]
Pet 타입의 배열을 파라미터로 받아 모든 Pet이 나이를 1살씩 더 먹었을 때의
상태를 지닌 새로운 배열을 반환하는 oneYearOlder 함수 구현 func oneYearOlder(of pets: [Pet]) -> [Pet]

 ***************************************************/
struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]


func sumDogAge(pets: [Pet]) -> Int {
   return pets.filter{$0.type == .dog}.reduce(0){ $0 + $1.age}
}

sumDogAge(pets: myPet)


func oneYearOlder(of pets: [Pet]) -> [Pet] {
    pets.map{
        $0.age+1
    }
    return pets
}
oneYearOlder(of: myPet)




/***************************************************
 [ 2 번문제 ] 
 immutableArray 배열의 각 인덱스와 해당 인덱스의 요소를 곱한 값 중
 홀수는 제외하고 짝수에 대해서만 모든 값을 더하여 결과 출력
 
 단, 아래 1 ~ 3번에 해당하는 함수를 각각 정의하고
 이것들을 조합하여 위 문제의 결과를 도출할 것
 1. 배열의 각 요소 * index 값을 반환하는 함수
 2. 짝수 여부를 판별하는 함수
 3. 두 개의 숫자를 더하여 반환하는 함수
 ***************************************************/

let immutableArray = Array(1...40)
print("\n---------- [ Practice 2 ] ----------\n")


let tempArr = [1, 4, 2, 10]
//인덱스 가져오는 방법은 밑에밖에없음.

immutableArray.enumerated().map{
    (idx , value) in return idx * value
}



func indexReturn (arraySet : Array<Int>) -> Int {
    var num = 0
    for x in arraySet.enumerated().map({ $0 * $1 }) {
        if x % 2 == 0 {
            num += x
        }
    }
    return num
}

indexReturn(arraySet: immutableArray)

// 고차함수로 쓰는법..ㅎㅎ
immutableArray.enumerated()
    .map(*)
    .filter({$0 & 1 == 0})
    .reduce(0, +)

//




//진짜 과제.
/***************************************************
 let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
 
 Q. 위 배열이 주어졌을 때 map 과 flatMap, compactMap 을 이용하여 다음 결과를 출력해보세요.
 1. [[Optional(1), Optional(2), Optional(3)], [nil, Optional(5)], [Optional(6), nil], [nil]]
 2. [[1, 2, 3], [5], [6], []] 
 3. [Optional(1), Optional(2), Optional(3), nil, Optional(5), Optional(6), nil, nil] 
 4. [1, 2, 3, 5, 6]
 ***************************************************/
print("\n---------- [ Practice 3 ] ----------\n")

let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
print(array)



//1. 왜 옵셔널 붙지?????
print(array.compactMap{$0})



//2 배열속 배열의 nil 값 제거하기 위해서
print(array.map{$0.compactMap{$0}})


//3. 옵셔널 붙은 상황에서 하나의 배열로 만들자.
print(array.compactMap{$0}.flatMap{$0})

//4. 하나의 배열로 만든다음에 옵셔널 제거.
print(array.flatMap{ $0 }.compactMap{ $0 })


//

//
