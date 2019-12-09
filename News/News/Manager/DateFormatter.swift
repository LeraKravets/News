//
//  DateFormatter.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import Foundation

extension String {

    func timeFormatter() -> String {

        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" 
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.locale = tempLocale
        if let newsDate = date {
            let dateString = dateFormatter.string(from: newsDate)
            print("EXACT_DATE : \(dateString)")
            return dateString
        } else {
            return ""

        }

    }
}
