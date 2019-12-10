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
    @IBOutlet weak var newsBigImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var newsButton: UIButton!

    // MARK: - Properties
    var newsInfo: News?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        updateNewsInfo()
    }
    

    func updateNewsInfo() {
        dateLabel.text = newsInfo?.date
        titleLabel.text = newsInfo?.title
        descriptionTextView.text = newsInfo?.descript
        newsBigImage.imageFormatter(urlString: newsInfo?.image)
        newsButton.setTitle(newsInfo?.link, for: .normal)
    }
    @IBAction func newsButtonDidTapped(_ sender: Any) {
        if let urlString = newsInfo?.link, let url = URL(string: urlString)  {
            UIApplication.shared.open(url)
        }
    }
}
