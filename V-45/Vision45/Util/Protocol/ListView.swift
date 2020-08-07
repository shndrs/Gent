//
//  ListView.swift
//  Vision45
//
//  Created by Sahand Raeisi on 8/7/20.
//  Copyright © 2020 Sahand Raeisi. All rights reserved.
//

import Foundation

protocol ListView: BaseView {
    associatedtype Model
    func set(with array: [Model])
}
