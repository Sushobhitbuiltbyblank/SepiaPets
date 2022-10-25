//
//  PetsListCoordinator.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation
import UIKit

final class PetsListCoordinator : Coordinator {
  let navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let petsListVC = PetsListViewController.instantiate(from: .sepiaPets)
    navigationController.pushViewController(petsListVC, animated: true)
  }

}

