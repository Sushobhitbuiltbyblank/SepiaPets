//
//  LocalJsonConfigProvider.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

struct LocalJsonConfigProvider: PetsConfigDataProvider {
  func fetchConfig(completion: @escaping (Settings) -> Void) {
    let decoder = JSONDecoder()
    let fileName = "config"
    guard
      let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let settings = try? decoder.decode(SettingModel.self, from: data)
    else {
      return
    }
    completion(settings.settings)
  }
}

