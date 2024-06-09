//
//  MarvelDataView.swift
//  Marvel
//
//  Created by Mariano Quiroga on 8/6/24.
//

import Foundation
import UIKit

enum MarvelDataViewState: Equatable {
  case loaded(data: MarvelListViewData)
  case error(message: String?)
}


struct MarvelListViewData: Equatable {
  let charactersList: [CharactersCellViewData]
}

/// Main view of the app
class MarvelDataView: UIView {

  // MARK: - Properties

  private let tableView = UITableView(frame: .zero, style: .grouped)
  private let contentView = UIStackView()
  private let errorLabel = UILabel()

  var tableData: [CharactersCellViewData] = []

  // MARK: - Lyfecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupComponents()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  func setState(state: MarvelDataViewState) {
    switch state {
    case .loaded(let data):
      tableData = data.charactersList
      tableView.reloadData()
      errorLabel.isHidden = true
    case .error(let message):
      if let errorMessage = message {
        errorLabel.text = errorMessage
        errorLabel.isHidden = false
      } else {
        errorLabel.isHidden = true
      }

    }
  }

  // MARK: - Private

  private func setupComponents() {
    backgroundColor = .white

    errorLabel.font = .systemFont(ofSize: 20, weight: .bold)
    errorLabel.textColor = .red
    errorLabel.textAlignment = .center

    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = nil
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    tableView.separatorStyle = .singleLine
    tableView.contentInset = .zero
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.register(CharacterCellView.self, forCellReuseIdentifier: "CharacterCellView")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.showsHorizontalScrollIndicator = false
    tableView.alwaysBounceHorizontal = false

    addSubview(tableView)
    addSubview(errorLabel)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

      errorLabel.topAnchor.constraint(equalTo: topAnchor),
      errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
      errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
}

// MARK: - UITableViewDataSource

extension MarvelDataView: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableData.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCellView", for: indexPath)
    guard let characterListCell = cell as? CharacterCellView else {
      return cell
    }

    let data = tableData[indexPath.row]
    characterListCell.selectionStyle = .none
    characterListCell.setState(state: .loaded(data: data))
    return characterListCell
    }
  }

// MARK: - UITableViewDelegate

extension MarvelDataView: UITableViewDelegate {

}

