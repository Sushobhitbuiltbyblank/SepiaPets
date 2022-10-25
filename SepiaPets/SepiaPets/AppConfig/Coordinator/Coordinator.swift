//
//  Coordinator.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

protocol Coordinator: AnyObject {
  var childCoordinators : [Coordinator] { get set }

  func start()
}

extension Coordinator {

  func store(coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }
}
