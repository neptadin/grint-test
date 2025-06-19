//
//  HomeViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit
import Alamofire

final class HomeViewController: UITableViewController, Reusable {

    private let fetchPostsUseCase: FetchPostsUseCase.Alias

    init?(coder: NSCoder, fetchPostsUseCase: FetchPostsUseCase.Alias) {
        self.fetchPostsUseCase = fetchPostsUseCase
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPostsUseCase.execute(nil) { result in
            debugPrint(result)
        }
    }
}
