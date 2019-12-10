//
//  NewsViewController.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak fileprivate var newsDescriptionTableView: UITableView!

    // MARK: - Properties
    let newsMainInfoCellID = "NewsMainInfoCellID"
    let newsLinkCellID = "NewsLinkCellID"
    var newsInfo: News?

    private enum Sections: Int, CaseIterable {
         case newsMainInfo
         case newsLink
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsDescriptionTableView.dataSource = self
        self.newsDescriptionTableView.delegate = self
    }

//    // MARK: - Outlets
//    @IBOutlet weak var newsBigImage: UIImageView!
//    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var descriptionTextView: UITextView!
//    @IBOutlet weak var newsButton: UIButton!
//
//    // MARK: - Properties
//    var newsInfo: News?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        titleLabel.lineBreakMode = .byWordWrapping
//        titleLabel.numberOfLines = 0
//        updateNewsInfo()
//    }
//
//
//    func updateNewsInfo() {
//        dateLabel.text = newsInfo?.date
//        titleLabel.text = newsInfo?.title
//        descriptionTextView.text = newsInfo?.descript
//        newsBigImage.imageFormatter(urlString: newsInfo?.image)
//        newsButton.setTitle(newsInfo?.link, for: .normal)
//    }
//    @IBAction func newsButtonDidTapped(_ sender: Any) {
//        if let urlString = newsInfo?.link, let url = URL(string: urlString)  {
//            UIApplication.shared.open(url)
//        }
//    }
}

// MARK: - extension UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionIndex = Sections(rawValue: indexPath.section) else {
            fatalError("Can't find section with index: \(indexPath.section)")
        }
        switch sectionIndex {
        case .newsMainInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: newsMainInfoCellID, for: indexPath) as? NewsMainInfoTableViewCell
                else {
                    fatalError("Can't find cell with id: \(newsMainInfoCellID)")
            }
            cell.updateNewsDescription(newsInfo: newsInfo)
            return cell

        case .newsLink:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: newsLinkCellID, for: indexPath) as? NewsLinkTableViewCell else {
                fatalError("Can't find cell with id: \(newsLinkCellID)")
            }
            return cell
        }
    }
}

// MARK: - extension UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionIndex = Sections(rawValue: indexPath.section) else {
            fatalError("Can't find section with index: \(indexPath.section)")
        }
        switch sectionIndex {
        case .newsMainInfo:
            return 550
        case .newsLink:
            return 40
        }
        return 0.0
    }
}
