//
//  File.swift
//  DominoPizzaExam
//
//  Created by brian은석 on 30/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation
struct Product {
    var name :String
    var count : Int
    var price : Int
}


class Singleton {
    static let shared = Singleton()
    var pizza :[Product] = [
        Product(name: "글램핑 바비큐", count: 0, price: 10000),
        Product(name: "알로하 하와이안", count: 0, price: 10000),
        Product(name: "우리 고구마", count: 0, price: 10000),
        Product(name: "콰트로 치즈 퐁듀", count: 0, price: 10000),
        Product(name: "더블크러스트 이베리코", count: 0, price: 10000),
        Product(name: "블랙앵거스 스테이크", count: 0, price: 10000),
        Product(name: "블랙타이거 슈림프", count: 0, price: 10000),
        Product(name: "와규 앤 비스테카", count: 0, price: 10000),
        Product(name: "직화 스테이크", count: 0, price: 10000),
        Product(name: "베이컨체더치즈", count: 0, price: 10000),
        Product(name: "불고기", count: 0, price: 10000),
        Product(name: "슈퍼디럭스", count: 0, price: 10000),
        Product(name: "슈퍼슈프림", count: 0, price: 10000),
        Product(name: "페퍼로니", count: 0, price: 10000),
        Product(name: "포테이토", count: 0, price: 10000),
        Product(name: "딸기 슈크림", count: 0, price: 10000),
        Product(name: "슈퍼곡물 치킨", count: 0, price: 10000),
        Product(name: "애플 크러스트 디저트", count: 0, price: 7000),
        Product(name: "치킨퐁듀 그라탕", count: 0, price: 7000),
        Product(name: "퀴노아 치킨 샐러드", count: 0, price: 7000),
        Product(name: "포테이토 순살치킨", count: 0, price: 7000),
        Product(name: "미닛메이드 스파클링 청포도", count: 0, price: 3000),
        Product(name: "스프라이트", count: 0, price: 3000),
        Product(name: "코카콜라 제로", count: 0, price: 3000),
        Product(name: "코카콜라", count: 0, price: 3000),
        Product(name: "갈릭 디핑 소스", count: 0, price: 500),
        Product(name: "스위트 칠리소스", count: 0, price: 500),
        Product(name: "우리 피클 L", count: 0, price: 1000),
        Product(name: "우리 피클 M", count: 0, price: 500),
        Product(name: "핫소스", count: 0, price: 500),
    ]
    
    var saveSingleTon : [String:Int] = [:]
    
}


