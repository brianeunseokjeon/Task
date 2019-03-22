// 전은석
//- 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
func infor(age: Int, name: String) {
    print("저의 이름은 \(age)살 \(name) 라고 합니다.")
}
//난이도 1



//- 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func even(num: Int) -> String{
    let remain = ( num % 2 )
    return(remain == 0 ? "짝수입니다." : "홀수입니다.")
}
// 난이도 5 (if 구문을 써야함을 알았지만 외우지 못해 난이도 올라감.)




//- 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func multi(num1: Int , num2: Int = 10) -> Int{
    return(num1 * num2)
}
// 난이도 1



//- 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func ave(_ num1: Int , _ num2: Int, _ num3: Int, _ num4: Int) -> Int{
    let num = (num1 + num2 + num3 + num4)
    return(num / 4)
}
// 처음 과제했을 때 4과목이 아닌 여러과목으로 했었으나, 4과목으로 명시되어 다시 수정. 난이도 1



//- 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func Grade(gra: Int) -> String{
    if gra >= 90 {
        return("A")
    }
    else if gra >= 80 && gra < 90 {
        return("B")
    }
    else if gra >= 70 && gra < 80 {
        return("C")
    }
    else {
        return("F")
    }
}
// else if 구문을 쓰고 마지막에도 else if 구문을 쓰는바람에 계속 오류. 하지만 질문을 통해 마지막에 else 여야함을 파악. 난이도 7



//- 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func ave2(_ numbers: Int...) -> String{
    var num = 0
    for nums in numbers{
        num += nums
    }
    let gra = (num / numbers.count)
        if gra >= 90 {
            return("A")
        }
        else if gra >= 80 && gra < 90 {
            return("B")
        }
        else if gra >= 70 && gra < 80 {
            return("C")
        }
        else {
            return("F")
    }
}
// 두 함수를 섞어 사용하였기에 어려울줄 알았으나 각각 만들어 놓은 함수가 있어서 조합은 괜찮았음. 난이도 4




    
}
