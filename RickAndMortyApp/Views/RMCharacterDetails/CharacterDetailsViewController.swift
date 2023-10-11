//
//  CharacterDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import SwiftUI

final class CharacterDetailsViewController: UIViewController {
    
    let viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHosting()
        setupBar()
    }
    
    private func setupHosting() {
        let detailsView = CharacterDetailsView(viewModel: viewModel)
        title = ""
        add(view: AnyView(detailsView))
    }
    
    private func setupBar() {
    }
}
