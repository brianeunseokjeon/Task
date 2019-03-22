

func gra(num: Double) -> String{
    if num == 4.5 {
        return("A+")
    }
    else if num == 4.0 {
        return("A")
    }
    else if num == 3.5 {
        return("B+")
    }
    else if num == 3.0 {
        return("B")
    }
    else {
        return("F")
    }
}

func month(m: Int) -> String{
    if m == 1 {
        return("1월")
    }
    else if m == 1 {
        return("2월")
    } else {
        return ("3월")
    }
}

// 밑에 변수 (x,y,z) 쓴 후에 case let 으로 (x,y,z)써도 되나????

func positiveOrNegative(x: Int , y: Int , z: Int) -> Bool{
switch (x,y,z) {
case let (x,y,z) where (x*y*z) >= 0 :
    return(true)
default:
    return(false)
}
}





func det(num: Int) -> String{
    if num%4 == 0 && num%100 != 0{
        return("윤년입니다.")
    }
    else if num%400 == 0 {
        return("윤년입니다.")
    }
    else {
        return("윤년이 아닙니다.")
    }
}



func factorial(num1 : Int) -> Int{
    var h = 1
    for x in 1...num1{
        h = h * x
    }
    return h
}




func tup(_ a: Int, _ b: Int) -> Int{
    var t = 1
    for _ in 1...b {
        t = t * a
    }
    return t
}



// 각자리 숫자 합구하기. (난이도10)

var remainNum = 0
var result = 0
func plus(firstNum : Int) ->Int{
        result += firstNum%10
        remainNum += firstNum/10
    repeat {
        result += remainNum % 10
        remainNum /= 10
    } while (remainNum > 0)
    return result
}
plus(firstNum: 1234)







//과제 ]
//1번문제- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 //(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100) (난이도 8) (각자리 숫자합 구하지 못했으면 못구했을 문제.)

var changeOne = 0
var changeTwo = 0
func change(one: Int, two: Int) -> Int{
    changeOne = one * 10
    changeTwo = two / 10
    while changeTwo > 0 {
        changeOne *= 10
        changeTwo /= 10
    }
    return changeOne + two
}

func change2(one: Int, two: Int) -> Int{
    var changeOne = one         // let 을 변수로 바꿀수 있음!   one에서 숫자만 따오는 변수 창조가능.
    var changeTwo = two
    while changeTwo > 0 {
        changeOne *= 10
        changeTwo /= 10
    }
    return changeOne + two
}


//2번문제- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수 (난이도1)
func strDet(str1: String, str2: String) -> String{
    if str1 == str2 {
        return ("같은 문자")
    }
    else {
        return("다른 문자")
    }
}

//3번 문제- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수 (난이도 3)

func divisor(n: Int) {
    for x in 1...n{
        if n%x == 0 {
            print (x)
        }
    }
}

//4번문제- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수 난이도 10 (count 넣는걸 도움받음 + 추가 방향)
let h = "소수입니다."
let p = "소수가 아닙니다"
var count = 0
func prime(pnum: Int) -> String{
    for x in (2...pnum-1){
        if pnum % x == 0 {
        count += 1
        }
    }
    if count == 0 {
        return h
    }else {
        return p
    }
}
prime(pnum: 21)
        
        

//5번문제- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//(입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    ) 난이도 10 (while 을 써야함을 도움받음)


var k1 = 0
var k2 = 1
var k3 = 0
var x = 1
func pibo(num: Int) -> Int{
    while x < num {
        x += 1
        k3 = k1 + k2
        k1 = k2
        k2 = k3
    }
return k1
    }




pibo(num: 4)

func fibo(num1: Int) -> Int{
    if num1 == 1 {
        return 0
    } else if num1 == 2 {
        return 1
    } else {
        guard num1 > 1 else {
            return num1
        }
    }
    return fibo(num1: num1 - 1) + fibo(num1: num1 - 2)
}

fibo(num1: 4)


//---------------------답지
func fibona(at index : Int) -> Int{
    var op1 = 0 , op2 = 1
    for i in 0..<index {
        if i % 2 == 0 {
          op1 += op2
        } else {
          op2 += op1
        }
    }
    return index % 2 == 0 ? op1 : op2
}

fibona(at: 2)


//6번문제- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수 (난이도5 입력값 비어있는 함수 몰랐음 질문함)

func test() {
    for x in 1...100{
        if x % 3 == 0 && x % 5 == 0 {
            print (x)
        }
    }
}



var a = 1

if a == 1 {
    var c = 0
    c = 1 + a
    print(c)
} else {
    a = 1
}


func 구구단(num: Int) -> String {
    var resultString: String = ""
    for x in 1...num {
//        print("\(x)단 시작합니다")
        resultString += "\(x)단 시작합니다\n"
        for y in 1...9 {
//            print("\(x) * \(y) = \(x*y)")
            resultString += "\(x) * \(y) = \(x*y)\n"
        }
    }
    return resultString
}

구구단(num: 3)
