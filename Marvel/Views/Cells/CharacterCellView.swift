//
//  CharacterCellView.swift
//  Marvel
//
//  Created by Mariano Quiroga on 9/6/24.
//

import Foundation
import UIKit

enum CharactersCellViewState: Equatable {
  case loaded(data: CharactersCellViewData)
}

struct CharactersCellViewData: Equatable {
  let characterName: String?
  let characterDescription: String?
  let characterImage: String?
}

class CharacterCellView: UITableViewCell {

  // MARK: - Properties

  private let contentStackView = UIStackView()
  private let nameLabel = UILabel()
  private let descriptionLabel = UILabel()
  private var customImageView = UIImageView()
  private let urlLabel = UILabel()

// MARK: - LifeCycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupComponents()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // NARK: - Methods

  func setState(state: CharactersCellViewState) {
    switch state {
    case .loaded(let data):
      if let characterName = data.characterName {
        nameLabel.text = characterName
      }
      if let characterDescription = data.characterDescription {
        descriptionLabel.text = characterDescription
      }
      if let characterImage = data.characterImage, let imageURL = URL(string: characterImage) {
        customImageView.imageFrom(url: imageURL)
      }
    }
  }
}

// MARK: - Private

private extension CharacterCellView {

  func setupComponents() {
    backgroundColor = .white

    contentStackView.axis = .vertical
    contentStackView.distribution = .equalSpacing
    contentStackView.spacing = 20
    contentStackView.alignment = .leading
    contentStackView.translatesAutoresizingMaskIntoConstraints = false

    nameLabel.textColor = .black
    nameLabel.textAlignment = .left
    nameLabel.numberOfLines = 0
    nameLabel.lineBreakMode = .byWordWrapping
    nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false

    descriptionLabel.textColor = .black
    descriptionLabel.textAlignment = .left
    descriptionLabel.numberOfLines = 0
    descriptionLabel.lineBreakMode = .byWordWrapping
    descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

    customImageView.contentMode = .scaleAspectFill
    customImageView.translatesAutoresizingMaskIntoConstraints = false

    contentStackView.addArrangedSubview(customImageView)
    contentStackView.addArrangedSubview(nameLabel)
    contentStackView.addArrangedSubview(descriptionLabel)

    addSubview(contentStackView)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

      customImageView.widthAnchor.constraint(equalToConstant: 70),
      customImageView.heightAnchor.constraint(equalToConstant: 70),
      customImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 20),
      customImageView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 10),

      nameLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 10),

      descriptionLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 10),
      descriptionLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -10)
    ])
  }
}
