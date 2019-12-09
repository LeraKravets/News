//
//  News+CoreDataProperties.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var date: String?
    @NSManaged public var descript: String?
    @NSManaged public var image: String?
    @NSManaged public var link: String?
    @NSManaged public var title: String?

}
