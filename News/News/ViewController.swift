//
//  ViewController.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak fileprivate var newsTableView: UITableView!

    // MARK: - Properties

    private let newsCellID = "NewsCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsCellID, for: indexPath) as? NewsTableViewCell else {
            fatalError("Can't find cell with id: \(newsCellID)")
        }
        return cell
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
