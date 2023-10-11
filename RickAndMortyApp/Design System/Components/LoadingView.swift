//
//  LoadingView.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import UIKit

final class LoadingView: UIView {

    private let backgroundView = UIView()
    private let spinnerView = UIActivityIndicatorView()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return self
    }
}

private extension LoadingView {
    
    func commonInit() {
        configure(view: self)
        configure(background: backgroundView)
        configure(spinner: spinnerView)

        backgroundColor = .clear
    }
    
    func configure(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
    }
    
    func configure(background: UIView) {
        addSubview(background)
        background.pin(to: self)
        background.backgroundColor = .black
        background.alpha = 0.4
    }
    
    func configure(spinner: UIActivityIndicatorView) {
        addSubview(spinner)
        spinner.center(to: self)
        spinner.startAnimating()
        spinner.style = .large
    }
}
