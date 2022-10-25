//
//  PetsListViewModel.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

protocol PetsListViewInput: AnyObject {
  func setUpViews()
}

protocol PetsListViewOutput {
  var view: PetsListViewInput? { get set }
  func viewdidload()
  func numberOfRowsInSection(section: Int) -> Int
  func petForRow(indexPath: IndexPath) -> PetModel?
}

final class PetsListViewModel: PetsListViewOutput {
  weak var view: PetsListViewInput?
  private let dataProvider: PetsListDataProvider
  private var pets: [PetModel] = []
  init(dataProvider: PetsListDataProvider) {
    self.dataProvider = dataProvider
  }

  func viewdidload() {
    self.dataProvider.fetchList { list in
      self.pets = list
      DispatchQueue.main.async {
        self.view?.setUpViews()
      }
    }
  }

  func numberOfRowsInSection(section: Int) -> Int {
    return self.pets.count
  }

  func petForRow(indexPath: IndexPath) -> PetModel? {
    let row = indexPath.row
    if self.pets.count >= row {
      return self.pets[row]
    }
    return nil
  }

}
