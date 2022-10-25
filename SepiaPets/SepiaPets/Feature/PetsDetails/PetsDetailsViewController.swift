//
//  PetsDetailsViewController.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 25/10/22.
//

import UIKit
import WebKit

protocol PetsDetailsViewControllerDelegate {
  func goBack()
}

class PetDetailsViewController: UIViewController, WKUIDelegate {
  @IBOutlet weak var webView: WKWebView!
  var delegate: PetsDetailsViewControllerDelegate?
  var viewModel: PetDetailsViewModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    // Use custom back button to pass through coordinator.
    let backButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(navigateBackToFirstpage))
    self.navigationItem.leftBarButtonItem = backButton

    self.viewModel?.viewdidload()

  }

  @objc func navigateBackToFirstpage() {
    self.delegate?.goBack()
  }

}

extension PetDetailsViewController: Storyboarded {}

extension PetDetailsViewController : PetDetailsViewInput {
  func setUpViews() {
    guard let myURL = self.viewModel?.contentUrl else { return }
    let myRequest = URLRequest(url: myURL)
    webView.load(myRequest)
    webView.uiDelegate = self
  }
}
