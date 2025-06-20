//
//  HomeViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/18/25.
//

import UIKit
import Alamofire

final class HomeViewController: UIViewController, Reusable {
    private enum Constants {
        static let paginationOffset = 100.0
        static let paginationFetchDelay: TimeInterval = 0.3
    }

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var retryButton: UIButton!

    var viewModel: HomeViewModel

    init?(coder: NSCoder, viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var tableModel = [HomePostController]() {
        didSet { tableView.reloadData() }
    }
    var footerIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    var viewIsLoading = false
    var debounceScrollTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarLogo()
        setupUI()
        bind()

        viewModel.loadPosts()
    }
}

// MARK: - UI
private extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .black

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.registerNib(for: HomePostCell.self)
        tableView.tableFooterView = footerIndicator
    }

    func bind() {
        viewModel.onLoadingStateChanged = { [weak self] loading in
            guard let self else { return }
            viewIsLoading = loading

            if viewModel.isFirstLoad {
                viewIsLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
            } else {
                viewIsLoading ? footerIndicator.startAnimating() : footerIndicator.stopAnimating()
            }
        }

        viewModel.onErrorStateChanged = { [weak self] errorFound in
            guard let self else { return }
            retryButton.isHidden = !(errorFound && viewModel.isFirstLoad)
        }
    }

    @IBAction func retryLoad() {
        viewModel.loadPosts()
    }
}

// MARK: - Table View Data Source
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

// MARK: - Scroll View Delegate
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !viewIsLoading else { return }

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height - Constants.paginationOffset, !viewIsLoading {
            debounceScrollTimer?.invalidate()

            debounceScrollTimer = Timer.scheduledTimer(
                withTimeInterval: Constants.paginationFetchDelay,
                repeats: false
            ) { [weak self] _ in
                self?.viewModel.loadPosts()
            }
        }
    }
}
