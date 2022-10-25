//
//  ViewController.swift
//  SepiaPets
//
//  Created by Sushobhit Jain on 21/10/22.
//

import UIKit

protocol PetsListViewControllerDelegate {
  func openDetailViewController(pet: PetModel)
}

class PetsListViewController: UIViewController, PetsListViewInput {

  var viewModel: PetsListViewOutput?
  var delegate: PetsListViewControllerDelegate?

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewModel?.viewdidload()
  }

 // MARK: - PetsListViewInput
  func setUpViews() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.tableFooterView = UIView()
    self.tableView.register(UINib(nibName: PetsListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PetsListTableViewCell.identifier)
    self.tableView.reloadData()
  }

}

extension PetsListViewController: Storyboarded {}

extension PetsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PetsListTableViewCell.identifier, for: indexPath) as? PetsListTableViewCell else { return UITableViewCell() }
    guard let pet = viewModel?.petForRow(indexPath:indexPath) else { return UITableViewCell() }
    cell.setUpCell(data: pet)
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.numberOfRowsInSection(section:section) ?? 0
  }
}

extension PetsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let pet = viewModel?.petForRow(indexPath:indexPath) else {return}
    self.delegate?.openDetailViewController(pet: pet)
  }
}


