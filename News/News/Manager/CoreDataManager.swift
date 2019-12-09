//
//  CoreDataManager.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import CoreData
import Foundation

class CoreDataManager {

    static let shared = CoreDataManager()
    private init() {}

    var context: NSManagedObjectContext {
           return persistantContainer.viewContext
       }

    lazy var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    // MARK: - Core Data Saving method
    func saveNewsInfo(newsInfo: [String: Any]) {
        var newsArray: [News] = []

        guard let newsInfoArray = newsInfo["articles"] as? [[String: Any]] else { return }

        for item in newsInfoArray {
            guard let news = NSEntityDescription.insertNewObject(forEntityName: "News", into: context) as? News,

            let title = item["title"] as? String,
            let date = item["publishedAt"] as? String,
            let description = item["description"] as? String,
            let imageUrl = item["urlToImage"] as? String,
            let linkUrl = item["url"] as? String else { return }

            news.title = title
            news.date = date
            news.descript = description
            news.image = imageUrl
            news.link = linkUrl
            newsArray.append(news)
            saveContext()
        }
        print(newsArray)

    }

    // MARK: - Core Data Saving support
    func saveContext() {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Core Data Fetching method
    func fetchNewsInfo() -> [News] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CurrentWeather")
        do {
            let item = try context.fetch(fetchRequest) as? [News]
            return item ?? []
        } catch let error {
            print(error)
        }
        return []
    }
}
