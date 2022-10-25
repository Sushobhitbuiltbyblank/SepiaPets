//
//  PetsDetailsCoordinator.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation
import UIKit

protocol PetDetailsCoordinatorDelegate {
  func backToPetListViewController()
}

final class PetDetailsCoordinator : Coordinator {
  let navigationController: UINavigationController
  var childCoordinators: [Coordinator] = []
  var delegate: PetDetailsCoordinatorDelegate?
  let pet: PetModel

  init(navigationController: UINavigationController, pet: PetModel) {
    self.navigationController = navigationController
    self.pet = pet
  }

  func start() {
    let petsListVC = PetDetailsViewController.instantiate(from: .sepiaPets)
    petsListVC.delegate = self
    petsListVC.title = self.pet.title
    guard let contentUrl = URL(string: self.pet.contentURL) else { return }
    let viewModel = PetDetailsViewModel(contentUrl: contentUrl)
    viewModel.view = petsListVC
    petsListVC.viewModel = viewModel
    navigationController.pushViewController(petsListVC, animated: true)
  }

}

extension PetDetailsCoordinator: PetsDetailsViewControllerDelegate {
  func goBack() {
    delegate?.backToPetListViewController()
  }
}

