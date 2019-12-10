//
//  NewsLinkTableViewCell.swift
//  News
//
//  Created by Лера on 12/10/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

class NewsLinkTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var linkLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateNewsLink(newsInfo: News?) {
        linkLabel.text = newsInfo?.link
    }
}
