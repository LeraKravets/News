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
    private let newsVCID = "NewsVC"
    var newsInfo: [News] = CoreDataManager.shared.fetchNewsInfo()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.dataSource = self
        self.newsTableView.delegate = self
        loadNewsInfo()

    }
    // MARK: - Helper methods
    func loadNewsInfo() {
        NetworkManager.shared.downloadNewsInfo { [weak self] (newsDict) in
            guard let self = self, let newsDict = newsDict else { return }
            CoreDataManager.shared.saveNewsInfo(newsInfo: newsDict)
            self.newsInfo = CoreDataManager.shared.fetchNewsInfo()
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }

        }
    }


    func goToNews() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newsVC = storyboard.instantiateViewController(withIdentifier: newsVCID) as? NewsViewController else { return }
//        newsVC.modalPresentationStyle = .fullScreen
        self.present(newsVC, animated: true, completion: nil)
    }

}

// MARK: - extension UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: newsCellID, for: indexPath) as? NewsTableViewCell else {
            fatalError("Can't find cell with id: \(newsCellID)")
        }
        cell.update(newsInfo: newsInfo[indexPath.row])
        return cell
    }


}

// MARK: - extension UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToNews()
    }
}
