//전은석

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
// 좀더 간단히 바꿈.
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

func fibo(_ num: Int) -> Int{
    guard num > 1 else {
        return num
    }
    return fibo(num-1) + fibo(num-2)
}
fibo(1)

//6번문제- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수 (난이도5 입력값 비어있는 함수 몰랐음 질문함)

func test() {
    for x in 1...100{
        if x % 3 == 0 && x % 5 == 0 {
            print (x)
        }
    }
}



