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
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var linkToNewsBtn: UIButton!

    // MARK: - Properties
    var newsInfo: News?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.numberOfLines = 0
        updateNewsInfo()
    }
    

    func updateNewsInfo() {
//        newsBigImage = newsInfo?.image
        dateLbl.text = newsInfo?.date
        titleLbl.text = newsInfo?.title
        descriptionTextView.text = newsInfo?.descript
        linkToNewsBtn.titleLabel?.text = newsInfo?.link
    }
}
