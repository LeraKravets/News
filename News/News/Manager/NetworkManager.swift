//
//  NetworkManager.swift
//  News
//
//  Created by Лера on 12/9/19.
//  Copyright © 2019 com.vkravets. All rights reserved.
//

import Foundation

class NetworkManager {

    private let APIkey = "a3643541e6ba4c719d9b575075db5991"
    private let language = "en"

    static let shared = NetworkManager()
    private init() {}

    func downloadNewsInfo(completionHandler: @escaping ([String: Any]?) -> Void) {
        let resourceString = "https://newsapi.org/v2/top-headlines?language=\(language)&apiKey=\(APIkey)"
        guard let resourceURL = URL(string: resourceString) else {
                      completionHandler(nil)
                      return
                  }
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, _, error) in
            guard let jsonData = data, error == nil else { return }
            do {
                guard let newsInfo = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any] else { return }
                completionHandler(newsInfo)
                print("newsInfo is downloaded")
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
