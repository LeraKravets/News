//
//  NewsTableViewCell.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newsSmallImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(newsInfo: News) {
        titleLabel.text = newsInfo.title
        dateLabel.text = newsInfo.date
        newsSmallImage.imageFormatter(urlString: newsInfo.image)
    }
}
