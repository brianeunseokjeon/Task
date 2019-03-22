// 전은석

//아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

let someClosure = { (s1: String, s2: String) -> Bool in
    (s1 > s2)
}
someClosure("zfdfd","pf")




let otherClosure: ([Int]) -> Int = {
    return $0.count
}
  

otherClosure([1, 2, 3])
//5.
//옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

var result = ""
var result1 = ""
var result2 = ""
var result3 = ""
func combineString(str1: String?, str2: String?, str3: String?) -> String {
     result1 = str1 ?? ""
     result2 = str2 ?? ""
     result3 = str3 ?? ""
     result = result1 + result2 + result3
     return result
}
combineString(str1: "AB", str2: nil, str3: "CD")
// 입력 예시 및 결과
// combineString1(str1: "AB", str2: "CD", str3: "EF") -> "ABCDEF"
// combineString1(str1: "AB", str2: nil, str3: "EF") -> "ABEF"
