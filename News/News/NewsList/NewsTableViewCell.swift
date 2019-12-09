//
//  NewsTableViewCell.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var newsSmallImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(newsInfo: News) {
        titleLbl.text = newsInfo.title
        dateLbl.text = newsInfo.date

    }

}
