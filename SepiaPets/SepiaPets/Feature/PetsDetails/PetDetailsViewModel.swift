//
//  PetDetailsViewModel.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import Foundation

protocol PetDetailsViewInput: AnyObject {
  func setUpViews()
}

protocol PetDetailsViewOutput {
  var view: PetDetailsViewInput? { get set }
  func viewdidload()
}

final class PetDetailsViewModel: PetDetailsViewOutput {
  weak var view: PetDetailsViewInput?
  var contentUrl: URL
  init(contentUrl: URL) {
    self.contentUrl = contentUrl
  }
  func viewdidload() {
    self.view?.setUpViews()
  }

}

