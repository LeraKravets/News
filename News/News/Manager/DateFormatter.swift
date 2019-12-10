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
        var date: Date?

        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        var localTimeZoneIdentifier: String { return TimeZone.current.identifier }
        dateFormatter.locale = Locale(identifier: localTimeZoneIdentifier)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" 
        date = dateFormatter.date(from: self)
        if date == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
            date = dateFormatter.date(from: self)
        }
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
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
