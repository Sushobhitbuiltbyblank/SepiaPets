//
//  PetsDataModels.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//
//   let petsList = try? newJSONDecoder().decode(PetsList.self, from: jsonData)

import Foundation

protocol PetModel {
  var imageURL: String { get }
  var title: String { get }
  var contentURL: String { get }
  var dateAdded: String { get }
}

// MARK: - PetsList
struct PetsList: Codable {
  let pets: [Pet]
}

// MARK: - Pet
struct Pet: Codable, PetModel {
  let imageURL: String
  let title: String
  let contentURL: String
  let dateAdded: String

  enum CodingKeys: String, CodingKey {
    case imageURL = "image_url"
    case title
    case contentURL = "content_url"
    case dateAdded = "date_added"
  }
}

