//
//  CharactersListViewController.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import SwiftUI

final class CharactersListViewController: UIViewController {
    
    private lazy var loading: LoadingView = {
        let loading = LoadingView()
        loading.isHidden = true
        loading.isUserInteractionEnabled = false
        return loading
    }()
    
    var viewModel: CharacterListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ricky & Morty"
        setupHosting()
    }
    
    private func setupHosting() {
        guard let viewModel = viewModel else { return }
        let listView = CharactersListView(viewModel: viewModel)
        add(view: AnyView(listView))
    }
}

extension CharactersListViewController: CharacterListViewModelDelegate {
    
    func loading(visible: Bool) {
        if visible {
            view.addSubview(loading)
            loading.pin(to: view)
        } else {
            loading.removeFromSuperview()
        }
    }
}
