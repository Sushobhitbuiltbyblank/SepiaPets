//
//  AppCoordinator.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation
import UIKit

enum RootState {
  case petsList
}

final class AppCoordinator: Coordinator {
  let navigationController: UINavigationController
  let window: UIWindow
  var childCoordinators: [Coordinator] = []

  init(window: UIWindow, navigationController: UINavigationController) {
    self.window = window
    self.navigationController = navigationController
  }

  func start() {
    window.rootViewController = navigationController

    // load the intial coordinator.
    let coordinator = initCoordinator(for: .petsList)
    coordinator.start()
    store(coordinator: coordinator)
    window.makeKeyAndVisible()
  }

  private func initCoordinator(for state: RootState) -> Coordinator {
    let coordinator: Coordinator

    switch state {
    case .petsList:
      coordinator = PetsListCoordinator(navigationController: navigationController)
      break
    }

    return coordinator
  }
}
