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
  case petDetails
  case nonWorkingError(Settings)
}

final class AppCoordinator: Coordinator {
  let navigationController: UINavigationController
  let window: UIWindow
  var childCoordinators: [Coordinator] = []
  var configProvider: PetsConfigDataProvider
  init(window: UIWindow, navigationController: UINavigationController, configProvider: PetsConfigDataProvider) {
    self.window = window
    self.navigationController = navigationController
    self.configProvider = configProvider
  }

  func start() {
    window.rootViewController = navigationController
    self.configProvider.fetchConfig { [self] settingModel in
      let formatter = DateFormatter()
      formatter.dateFormat = "HH:mm"
      let config = AppContentVisibilityConfigManager(configSetting: settingModel, formatter: formatter)
      if config.isAppAllowAccess() {
        // load the intial coordinator.
        let coordinator = initCoordinator(for: .petsList)
        coordinator.start()
        store(coordinator: coordinator)
      } else {
        let coordinator = initCoordinator(for: .nonWorkingError(settingModel))
        coordinator.start()
        store(coordinator: coordinator)
      }
    }
    window.makeKeyAndVisible()
  }

  private func initCoordinator(for state: RootState) -> Coordinator {
    let coordinator: Coordinator

    switch state {
    case .petsList:
      coordinator = PetsListCoordinator(navigationController: navigationController)
    case .petDetails:
      coordinator = PetDetailsCoordinator(navigationController: navigationController, pet: DummyPetData(imageURL: "", title: "Dummy", contentURL: "", dateAdded:""))
    case .nonWorkingError(let settings):
      coordinator = RestrictedErrorCoordinator(navigationController: navigationController, configSettings: settings)
    }

    return coordinator
  }
}

struct DummyPetData: PetModel {
  var imageURL: String

  var title: String

  var contentURL: String

  var dateAdded: String


}
