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
    petsListVC.title = "Sepia Pets"
    let dataProvider = LocalJsonPetsListProvider()
    let viewModel = PetsListViewModel(dataProvider: dataProvider)
    viewModel.view = petsListVC
    petsListVC.viewModel = viewModel
    petsListVC.delegate = self
    navigationController.pushViewController(petsListVC, animated: true)
  }

}

extension PetsListCoordinator: PetsListViewControllerDelegate {
  func openDetailViewController(pet: PetModel) {
    let detailCoordinator = PetDetailsCoordinator(navigationController: self.navigationController, pet: pet)
    detailCoordinator.delegate = self
    self.store(coordinator: detailCoordinator)
    detailCoordinator.start()
  }
}

extension PetsListCoordinator: PetDetailsCoordinatorDelegate {
  func backToPetListViewController() {
    self.navigationController.popViewController(animated: true)
    self.childCoordinators.removeLast()
  }
}

