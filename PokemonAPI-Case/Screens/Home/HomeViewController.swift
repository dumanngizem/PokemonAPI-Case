//
//  HomeViewController.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

import UIKit
import TinyConstraints
import UIComponents

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(PokemonCell.self)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        configureLocalize()
        viewModel.viewDidLoad()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - ConfigureLocalize
extension HomeViewController {
    
    private func configureLocalize() {
        navigationItem.title = L10n.Home.title
    }
}

// MARK: - SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        subscribeReloadData()
        subscribeEmptyView()
    }
    
    private func subscribeReloadData() {
        viewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    private func subscribeEmptyView() {
        viewModel.emptyViewState = { [weak self] isShow in
            guard let self = self else { return }
            if isShow {
                self.tableView.setEmptyView(delegate: self)
            } else {
                self.tableView.restore()
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath: indexPath)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonCell = tableView.dequeueReusableCell(for: indexPath)
        let viewModel = viewModel.cellForRowAt(indexPath)
        cell.set(viewModel: viewModel)
        return cell
    }
}

// MARK: - EmptyViewDelegate
extension HomeViewController: EmptyViewDelegate {
    func tryAgainButtonTappedEmptyView() {
        viewModel.viewDidLoad()
    }
}
