//
//  ViewController.swift
//  ImageDownloader
//
//  Created by unchain on 2023/03/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ImageDownTable: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        ImageDownTable.delegate = self
        ImageDownTable.dataSource = self
    }

    @IBAction func didTapLoadAllImages(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("didTapLoadButton"), object: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDownTableViewCell", for: indexPath) as? ImageDownTableViewCell else { return UITableViewCell() }

        cell.imageURL = "https://source.unsplash.com/500x50\(indexPath.row)"
        return cell
    }
}

