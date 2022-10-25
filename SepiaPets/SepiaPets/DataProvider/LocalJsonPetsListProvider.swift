//
//  LocalJsonPetsListProvider.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

struct LocalJsonPetsListProvider: PetsListDataProvider {
  func fetchList(completion: @escaping ([PetModel]) -> Void) {
    let decoder = JSONDecoder()
    let fileName = "pets_list"
    guard
      let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let petList = try? decoder.decode(PetsList.self, from: data)
    else {
      return
    }
    completion(petList.pets)
  }
}
