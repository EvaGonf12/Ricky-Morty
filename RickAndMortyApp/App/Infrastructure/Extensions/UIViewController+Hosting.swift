//
//  UIViewController+Hosting.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import SwiftUI

extension UIViewController {
    
    func add(view: AnyView) {
        let hostingController = UIHostingController(rootView: view)
        guard let swiftUIView = hostingController.view else { return }
        
        self.addChild(hostingController)
        self.view.addSubview(swiftUIView)

        swiftUIView.pin(to: self.view)
        
        hostingController.didMove(toParent: self)
    }
}
