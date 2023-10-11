//
//  CharacterDetailsView.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                        
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: viewModel.details.image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image("image-placeholder")
                        .resizable()                        
                        .scaledToFit()
                }
                
                VStack(spacing: Spacing.xs) {
                    
                    HStack(spacing: Spacing.xxs) {
                        (viewModel.details.gender?.image ?? Image("genderless"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                        
                        Text(viewModel.details.name ?? "")
                            .foregroundColor(.contentHigh)
                            .font(RMFont.main)
                        
                        Spacer()
                            
                        Text(viewModel.details.status?.rawValue ?? "")
                            .foregroundColor(viewModel.details.status?.color ?? .contentHigh)
                            .font(RMFont.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Text(viewModel.details.species ?? "")
                        .foregroundColor(.contentHigh)
                        .font(RMFont.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Origin: \(viewModel.details.origin?.name ?? "")")
                        .foregroundColor(.contentHigh)
                        .font(RMFont.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Location: \(viewModel.details.location?.name ?? "")")
                        .foregroundColor(.contentHigh)
                        .font(RMFont.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, Spacing.s)
                .padding(.top, Spacing.xs)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    CharacterDetailsView(viewModel: CharacterDetailsViewModel(details: CharacterInfo.mock))
}
