//
//  NewsDescriptionTableViewCell.swift
//  News
//
//  Created by Лера on 12/10/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

class NewsMainInfoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newsBigImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateNewsDescription(newsInfo: News?) {
        dateLabel.text = newsInfo?.date
        titleLabel.text = newsInfo?.title
        descriptionTextView.text = newsInfo?.descript
        newsBigImage.imageFormatter(urlString: newsInfo?.image)
    }
}
