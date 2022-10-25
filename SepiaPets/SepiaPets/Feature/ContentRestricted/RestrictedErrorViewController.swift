//
//  RestrictedErrorViewController.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 26/10/22.
//

import UIKit

class RestrictedErrorViewController: UIViewController {

  var configSettings: Settings?
  override func viewDidLoad() {
    super.viewDidLoad()

    var workinghours = ""
    if let workinghour = self.configSettings?.workHours {
      workinghours = workinghour
    }
    let alert = UIAlertController(title: "Non Working hours", message: "Please access the app in between \(workinghours)", preferredStyle: .alert)
    self.present(alert, animated: true)
  }

}
extension RestrictedErrorViewController: Storyboarded {}
