//[ 과제 ]
//1.
func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)


((task1 as? Int ) ?? 0) + ((task1 as? Int ) ?? 0)





//[심화 문제 1]
//위와 같이 task1 이라는 변수가 있을 때
//task1 + task1 의 결과가 제대로 출력되도록 할 것
//
let task2: Any = addTwoValues

if let task = (task2 as? (Int,Int) -> Int ) {
   print (task(2,3) + task(2,3) )
}






