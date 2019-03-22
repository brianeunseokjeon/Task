//[ 과제 ] 전은석

// 1번과제- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201

func reverse(num: Int) ->Int{
    var h = 0
    var num1 = num
    while num1 > 0 {
        h *= 10
        h += num1 % 10
        num1 = num1 / 10
    }
    return h
}
reverse(num: 123)

//2번 과제- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

var h = ["a", "b", "c", "a", "e", "d", "c"]
var save : [String] = []
func noRepeat(m: [String] ) -> [String]{
    for i in h {
        var num = 0
        for j in h {
            if i == j {
                num += 1
            }
        }
        if num <= 1 {
            save += [i]
        }
    }
    return save
}
noRepeat(m: h)

func printUniqueValues2(from arr: [String]) -> [String] {
    var dict: [String: Int] = [:]
    /// 대입 되는 var h = ["a", "b", "c", "a", "e", "d", "c"]
    for str in arr {
        if let num = dict[str] {
            dict[str] = num + 1
        } else {
            dict[str] = 1
        }
    }
    ///////////////////////////////dict["a"]일 경우, 일단은 nil 이므로 엘스구문으로 들어가서 +1
    ///////////////////////////////dict["b"] , dict["c"]   까지 nil   그러므로 +1
    var result: [String] = []
    for (key, value) in dict {
        guard value == 1 else { continue }
        result.append(key)
    }
    return result
}

    


//3번과제 - 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

var p = [2, 8, 7, 1, 4, 3]
var q: [Int] = []
var s: [Int] = []
func oddFirstAndEvensecond(oh: [Int] ) -> [Int]{
    for i in p {
        if i % 2 != 0 {
            q += [i]
        } else {
            s += [i]
        }
    }
    return q + s
}

oddFirstAndEvensecond(oh: p)



//4번 과제- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현

enum Arithmetic {
    case addition, subtraction, multiplication, division
}


func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    switch op {
    case .addition:
        return operand1 + operand2
    case .subtraction:
        return operand1 - operand2
    case .multiplication:
        return operand1 * operand2
    case .division:
        return operand1 / operand2
    }
}

calculator(operand1: 24, operand2: 11, op: .addition)



//5번 과제- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

let dic = ["식육목" :
    ["개과" :
        ["개" :
            ["자칼" ,"늑대" , "북미산 이리"],
         "여우" :
            ["아메리카 여우", "유럽여우"]],
     "고양이과" :
        ["고양이" :
            ["고양이" , "살쾡이"],
        "표범" :
            ["사자" , "호랑이"]]]
]

if let dic1 = dic["식육목"], let dic2 = dic1["고양이과"] , let dic3 = dic2["표범"] {
            print(dic3)
        }

if let result = dic["식육목"]?["고양이과"]?["표범"] {
    print(result)
}
