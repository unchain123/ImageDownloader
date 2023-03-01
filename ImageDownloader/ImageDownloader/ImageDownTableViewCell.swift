//
//  ImageDownTableViewCell.swift
//  ImageDownloader
//
//  Created by unchain on 2023/03/01.
//

import UIKit

final class ImageDownTableViewCell: UITableViewCell {

    @IBOutlet private weak var loadImageView: UIImageView!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var loadButton: UIButton!
    var imageURL = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        loadImageView.image = UIImage(systemName: "photo.artframe")

        setNotification()
        setLoadButton()
    }

    private func setLoadButton() {
        loadButton.addTarget(self, action: #selector(didTapLoadButton), for: .touchUpInside)
    }

    private func setNotification() {
        NotificationCenter.default.addObserver(forName: Notification.Name("didTapLoadButton"), object: nil, queue: .main) { [weak self] _ in
            self?.didTapLoadButton()
        }
    }

    @objc
    private func didTapLoadButton() {
        loadImageView.image = UIImage(systemName: "photo.artframe")
        guard let url = URL(string: imageURL) else { return }

//        DispatchQueue.main.async {
//             URLSession.shared.dataTask(with: url) { data, URLResponse, error in
//                 let image = UIImage(data: data ?? Data())
//                 self.loadImageView.image = image
//            }
//        }
        Task {
            let (data, _) = try await URLSession.shared.data(from: url)
            let image = UIImage(data: data)
            loadImageView.image = image
        }
    }
}
