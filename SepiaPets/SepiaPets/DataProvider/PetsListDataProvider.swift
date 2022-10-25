//
//  LocalDataProvider.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

protocol PetsListDataProvider {
  func fetchList(completion: @escaping([PetModel]) -> Void)
}

protocol PetsConfigDataProvider {
  func fetchConfig(completion: @escaping(Settings) -> Void)
}
