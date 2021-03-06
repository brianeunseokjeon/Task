# Task

- 0311 : 
  - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
  - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
  - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
  - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
  - 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
  - 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

- 0312
  - 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 
    (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
  - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
  - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
  - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
  - 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수 
    참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
    (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )
  - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

- 0314
  - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
    ex) 123 -> 321 , 10293 -> 39201
  - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
    ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

  - 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
    ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]

  - 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
    enum Arithmetic {
      case addition, subtraction, multiplication, division
    }
    func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
      // 코드
    }

- 0315

  - 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

    let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
      let isAscending: Bool
      if s1 > s2 {
        isAscending = true
      } else {
        isAscending = false
      }
      return isAscending
    }

    let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
      var count: Int = 0
      for _ in values {
        count += 1
      }
      return count
    }

  - 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

    func combineString(str1: String?, str2: String?, str3: String?) -> String {
      // code
    }

- 0319

  - 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
    구현 내용은 자유롭게

     ** 강아지 (Dog)

     - 속성: 이름, 나이, 몸무게, 견종
     - 행위: 짖기, 먹기

     ** 학생 (Student)

     - 속성: 이름, 나이, 학교명, 학년
     - 행위: 공부하기, 먹기, 잠자기

     ** 아이폰(IPhone)

     - 속성: 기기명, 가격, faceID 기능 여부(Bool)
     - 행위: 전화 걸기, 문자 전송

     ** 커피(Coffee)

     - 속성: 이름, 가격, 원두 원산지

  - 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기

     ** 계산기 (Calculator)

     - 속성: 현재 값
     - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화



- 0321
  - 첨부된 이미지를 보고 상속을 이용해 구현해보기
  - 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고 
     각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
     (클래스 구현 연습)
     
     
- 0322
  - UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
  - UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
  - 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 합니다.
  
- 0325
  - [과제] AlertController 를 통해 Label 의 숫자를 1씩 올리거나 초기화하기
   (위 내용을 스토리보드로  구현하기는 연습. 스토리보드 없이 완전히 코드로만으로 구현하는 것이 과제)
  - 수업 실습 항목 3번 (3개의 빨강, 파랑, 초록색뷰 추가하기) 을 코드로 구현하기

  - [도전] AlertController 에 TextField 를 추가해서 Label 의 숫자를 원하는 대로 증가시키기

- 0326
  - [과제] 영상 참고 
    > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
    > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
    > 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

 - ViewController 데이터 전달
    > AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
    > AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가
    
- 0329[시험] 강의자료에 들어가 있음.

- 0402 
  1. [과제] 
    func addTwoValues(a: Int, b: Int) -> Int {
      return a + b
        }
    let task1: Any = addTwoValues(a: 2, b: 3)
    위와 같이 task1 이라는 변수가 있을 때
    task1 + task1 의 결과가 제대로 출력되도록 할 것

  2. [과제] 스토리보드 이용할 것
    FirstVC 에 Dog, Cat, Bird 라는 이름의 Button을 3개 만들고 숫자를 표시하기 위한 Label 하나 생성
    SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
    FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기 
      (이미지는 구글링 등을 통해 활용)
    각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
    (전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)
    그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현 
  
  3. [과제] 
   FirstVC 에 텍스트가 -1인 UILabel 과 SecondVC 를 띄우기 위한 UIButton 생성
   SecondVC 에는 4개(10, 20, 30, 40)의 segment를 가진 UISegmentedControl,
   그리고 FirstVC 로 돌아가기 위한 UIButton 생성
   UISegmentedControl 에서 값을 선택한 뒤 버튼을 누르면 그 값이 FirstVC 의 Label 에 표시되도록 구현

  4. [도전 과제] 1.
  let task2: Any = addTwoValues
  위와 같이 task2 라는 변수가 있을 때
  task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)
  
  5. [도전 과제] 2.
  class Car {}
  let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
  위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

- 0404
  1. [ 과제 ]
   FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
   UserDefaults 를 이용한 방법으로 구현
   Singleton 을 이용한 방법으로 구현
   Delegate 를 이용한 방법으로 구현

  2. [매니져님 과제]
   Singleton 에 red, green, blue 변수 생성.
   firstview 에 UISlider 를 세개 생성하고 슬라이더 각각의 값을 Singleton 에 각각 저장.
   secondview 에 backgroundcolor 를 singleton 에서 red, green, blue 값을 참조하여 보여주세요. (코드로 구현하시오.)
  
  3. [ 도전 과제 ]
   Singleton 플레이그라운드의 Basic Example 에서 Singleton 을 이용해 구현한 내용을 
   User 클래스에 싱글턴 패턴을 사용하지 않고도 동일한 결과가 나오도록 구현해보기
   (User 클래스 내용은 싱글턴을 제거하는 것 외에 건드리지 않아야 함. 타입 프로퍼티도 사용하지 않고 구현)

  (1-1. 도전 과제의 심화 문제: 위 도전 과제의 User를 class 로 구현했으면 struct로 변경하여 구현해보기)

  4. [도전 과제]
   일반 과제 1번에서
   delegate 프로토콜과 프로퍼티를 firstVC 에 정의하여 구현했다면 secondVC에,
   이것을 secondVC에 정의해 구현했다면 반대로 firstVC에 정의하여 1번 문제 다시 해결하기
   
- 0405 
  1. [매너저님 과제]  
    영상과 같이 코드로 구현하시오.
    1. UITabbarController에 두개의 ViewController를 생성
    2. 첫번째 ViewController 에 UINavigationController 연결, 친구목록을 표현할 UILabel 생성
    3. 친구추가 ViewController 에서 UITextField 를 생성하고 이름을 입력
    4. TextField 에 입력된 값에 따라 AlertController 띄우기
    5. 첫번째 ViewController 에 돌아왔을때 친구목록 Label 에 이름 표시  
     ps. (도전과제) 추가된 친구의 이름을 델리게이트패턴으로 구현해주세요~
     
  2. [과제]
    [ 로그인 페이지 필수 구현 기능 ]
    1. 이미지와 동일하게 UI 구현  (스토리보드와 코드 자유)
    2. 텍스트 필드는 UITextFieldDelegate 이용
    3. 키보드에 textField 가 가릴 수 있으므로 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
    4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동 
    5. 메인 화면에서는 입력받은 아이디를 출력하는 Label 을 띄우고 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성

    [ 로그인 페이지 옵션 기능 ]
    1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기

    (아래 2 ~ 3번은 delegate 메서드로 구현하기 어려워하실 것이므로 editingChanged를 이용해 먼저 구현)
    (더 해보고 싶을 때 delegate 메서드로 추가 고민)
    2. 텍스트필드에 입력할 수 있는 최대 글자 수는 20자까지
    3. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함  
  
  3. [ 도전 과제 ]
    1. 자동 로그인
    한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입
    (AppDelegate 접근 방법 참고)
    (let appDelegate = UIApplication.shared.delegate as! AppDelegate)
    2. 회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
    그것으로도 로그인 할 수 있도록 구현하기
