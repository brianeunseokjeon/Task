//
//  Singleton.swift
//  fakeKakao
//
//  Created by brian은석 on 08/04/2019.
//  Copyright © 2019 brian. All rights reserved.
//

import Foundation

class Friends {
    static let friend = Friends()
    private init(){}
    var save :[String] = []
}
