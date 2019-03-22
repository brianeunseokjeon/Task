class Animal {
  final let brain = true
  var legs: Int = 0
}

final class Human: Animal {
    
    init(a: Int){
        super.init()
        self.legs = a
    }
}


var b = Human(a: 2)

b.legs

class Pet : Animal {
    init(a: Int){
        super.init()
        self.legs = a
    }

    var fleas = 0
}


final class Dog : Pet {
    init(legsNum: Int, fleasNum: Int){
        super.init(a: 2)
        self.legs = legsNum
        self.fleas = fleasNum
    }
}
var dog1 = Dog(legsNum: 4, fleasNum: 8)
dog1.fleas
dog1.legs


final class Cat : Pet {
    init(legsNum: Int, fleasNum: Int){
        super.init(a: 2)
        self.legs = legsNum
        self.fleas = fleasNum
    }
}




print("============================")
//2 번 문제 시작

class Square {
    var A = 0
    var P = 0
    func value(s:Int) {
        A = s * s
        P = 4 * s
    }
}

class Rec {
    var A = 0
    var P = 0
    func value(l:Int, w:Int) {
        A = l * w
        P = 2 * (l + w)
    }
}
class Circle {
    var A = 0.0
    var C = 0.0
    func value(r:Double) {
        A = r * r * 3.14
        C = 2 * 3.14 * r
    }
}



class Tri {
    var A = 0.0
    func value(b:Double, h:Double) {
        A = b * h / 2
    }
}

class Trapezoid {
    var A = 0.0
    func value(a:Double, b:Double, h:Double) {
        A = (a + b) * h / 2
    }
}

class Cube {
    var v = 0
    func value(s:Int){
        v = s * s * s
    }
}

class RectangularSolid {
    var v = 0
    func value(w:Int, l:Int, h:Int){
        v = w * l * h
    }
}

class Sphere {
    var v = 0.0
    func value(r:Double){
        v = 3.14 * r * r * r * 4 / 3
    }
}


class Cone {
    var v = 0.0
    func value(r:Double, h:Double){
        v = 3.14 * r * r * h / 3
    }
}

