//
//  Coordinator.swift
//  ErrorHandling
//
//  Created by Chris Combs on 02/05/2019.
//Copyright © 2019 Nodes. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var children: [Coordinator] { get set }
    func start()
}
