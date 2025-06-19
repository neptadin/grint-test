//
//  HomeViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit
import Alamofire

final class HomeViewController: UIViewController, Reusable {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!

    var tableModel = [HomePostController]() {
        didSet { tableView.reloadData() }
    }

    var viewModel: HomeViewModel

    init?(coder: NSCoder, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bind()

        viewModel.loadPosts()
    }
}

// MARK: - UI
private extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .black

        tableView.backgroundColor = .clear
        tableView.registerNib(for: HomePostCell.self)
    }

    func bind() {
        viewModel.onLoadingStateChanged = { [weak self] loading in
            guard let self else { return }

            if viewModel.isFirstLoad {
                loading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
            } else {
                
            }
        }
    }
}

// MARK: - Table View
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellController(for: indexPath).view(in: tableView)
    }

    private func cellController(for indexPath: IndexPath) -> HomePostController {
        tableModel[indexPath.row]
    }
}
