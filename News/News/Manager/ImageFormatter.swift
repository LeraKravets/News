//
//  ImageFormatter.swift
//  News
//
//  Created by Лера on 12/10/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import UIKit

extension UIImageView {

    func imageFormatter(urlString: String?) {
        if let urlString = urlString {
            let url = URL(string: urlString)
            self.sd_setImage(with: url, placeholderImage: nil)
            self.layer.cornerRadius = 5
        }
    }
}
