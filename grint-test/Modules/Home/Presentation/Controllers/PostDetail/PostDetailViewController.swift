//
//  PostDetailViewController.swift
//  grint-test
//
//  Created by Neptali Duque on 6/19/25.
//

import UIKit
import WebKit

final class PostDetailViewController: UIViewController, Reusable {
    @IBOutlet var webView: WKWebView!

    var viewModel: PostDetailViewModel

    init?(coder: NSCoder, viewModel: PostDetailViewModel) {
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

        viewModel.loadUrlString()
    }
}

// MARK: - UI
private extension PostDetailViewController {
    func setupUI() {
        view.backgroundColor = .black
        webView.backgroundColor = .black
        webView.isOpaque = false
        webView.overrideUserInterfaceStyle = .dark
    }

    func bind() {
        title = viewModel.title

        viewModel.onLoadUrlString = { [weak self] urlString in
            guard let self, let url = URL(string: urlString) else { return }
            webView.load(URLRequest(url: url))
        }
    }
}
