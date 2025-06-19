//
//  HomePostViewModel.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import Foundation

final class HomePostViewModel {
    private let model: UiRedditPost

    init(model: UiRedditPost) {
        self.model = model
    }

    var subreddit: String {
        model.subreddit
    }

    var postTitle: String {
        model.title
    }

    var postInformation: String {
        let date = Date(timeIntervalSince1970: TimeInterval(model.created))
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateString = formatter.string(from: date)

        return "\(dateString) by \(model.author)"
    }

    var isThumbnailUrl: Bool {
        model.urlIsThumbnailPreview
    }

    var url: URL? {
        URL(string: model.url)
    }

    var upvotes: String {
        formatToK(number: model.ups)
    }

    var comments: String {
        formatToK(number: model.numComments)
    }
}

extension HomePostViewModel {
    func formatToK(number: Int) -> String {
        if number >= 1_000 {
            let formatted = Double(number) / 1000.0
            if formatted.truncatingRemainder(dividingBy: 1) == 0 {
                return "\(Int(formatted))k"
            } else {
                return String(format: "%.1fk", formatted)
            }
        } else {
            return "\(number)"
        }
    }
}
