//
//  HomeViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit
import Alamofire

final class HomeViewController: UIViewController, Reusable {

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView!

    private var viewModel: HomeViewModel {
        didSet { bind() }
    }

    init?(coder: NSCoder, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UI
private extension HomeViewController {
    func setupUI() {

    }

    func bind() {
        
    }
}

// MARK: - Table View Data Source
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        .init()
    }
}
