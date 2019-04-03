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


// [심화 문제 2]. 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기




enum valuesIndex {
    case firstIndexInt , secondIndexDouble, thirdIndexTuple , fourthIndexClass, fifthIndexClosuer
}
valuesIndex.firstIndexInt
valuesIndex.secondIndexDouble
valuesIndex.thirdIndexTuple
valuesIndex.fourthIndexClass
valuesIndex.fifthIndexClosuer


    class Car {}
    let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
    for h in values {
        switch h {
        case  :
            <#code#>
        default:
            <#code#>
        }
    }
   

var h = (2.0, Double.pi)
type(of: values[4])
let firstIndexInt = ( values[0] as? Int ) ?? 0
let secondIndexDouble = ( values[1] as? Double ) ?? 4
let thirdIndexTuple = ( values[2] as? (Double,Double) ) ?? (0.0,0.0)
let fourthIndexClass = ( values[3] as? Car) ?? Car()
let fifthIndexClosuer = ( values[4] as? ((String) -> Int) )!



