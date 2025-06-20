//
//  PostDetailViewModel.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

final class PostDetailViewModel {
    typealias Observer<T> = (T) -> Void

    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }
    
    var title: String { "Post Detail" }
    var onLoadUrlString: Observer<String>?

    func loadUrlString() {
        onLoadUrlString?(urlString)
    }
}
