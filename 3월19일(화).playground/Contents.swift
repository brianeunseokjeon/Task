//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//
//    ** 강아지 (Dog)
//    - 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기


class Dog{
    var name : String
    var age : Int
    var weight : Int
    var kindOf : String
    init(name: String, age: Int, weight:Int , kindOf: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.kindOf = kindOf
    }
    func bowwow(){
        print("bowwow!!!")
    }
    func eat(){
        print("냠냠")
    }
}
var dog1 = Dog(name: "jio", age: 12, weight: 23, kindOf: "달마시안")
dog1.eat()
dog1.bowwow()



//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
//    ** 계산기 (Calculator)
//    - 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
//ex)
class Calculator{
    var value = 0.0
    func add(_ a:Double) -> Double {
        value += a
        return value
    }
    func subtract(_ a:Double) -> Double {
        value -= a
        return value
    }
    func multiply(_ a:Double) -> Double {
        value *= a
        return value
    }
    func divide(_ a:Double) -> Double {
        value /= a
        return value
    }
    func reset() -> Double {
        return 0.0
    }
}


let calculator = Calculator() // 객체생성

calculator.value  // 0

calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0
