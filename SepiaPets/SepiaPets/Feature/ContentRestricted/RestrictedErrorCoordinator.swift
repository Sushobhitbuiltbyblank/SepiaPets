//
//  RestrictedErrorCoordinator.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 26/10/22.
//

import Foundation
import UIKit

final class RestrictedErrorCoordinator : Coordinator {
  let navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []
  var configSettings: Settings
  init(navigationController: UINavigationController, configSettings: Settings) {
    self.navigationController = navigationController
    self.configSettings = configSettings
  }
  func start() {
    let restrictedErrorVC = RestrictedErrorViewController.instantiate(from: .sepiaPets)
    restrictedErrorVC.configSettings = self.configSettings
    self.navigationController.pushViewController(restrictedErrorVC, animated: true)
  }
}
