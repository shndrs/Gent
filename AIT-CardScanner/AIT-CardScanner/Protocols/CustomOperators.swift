//
//  CustomOperators.swift
//  AIT-CardScanner
//
//  Created by NP2 on 2/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import Foundation

infix operator >>>: MultiplicationPrecedence

func >>> <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
  return { a in
    g(f(a))
  }
}
