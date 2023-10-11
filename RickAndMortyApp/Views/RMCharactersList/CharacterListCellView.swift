//
//  CharacterListCellView.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 10/10/23.
//

import SwiftUI

private enum ViewLayout {
    static var imageSize = 80.0
}

struct CharacterListCellView: View {
    
    var item: CharacterInfo
    
    var body: some View {
        HStack(spacing: Spacing.s) {
            AsyncImage(url: URL(string: item.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ViewLayout.imageSize, height: ViewLayout.imageSize)
                    .cornerRadius(ViewLayout.imageSize/2)
                
            } placeholder: {
                Image("image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ViewLayout.imageSize, height: ViewLayout.imageSize)
                    .cornerRadius(ViewLayout.imageSize/2)
            }
            
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: Spacing.xxs) {
                    HStack(spacing: Spacing.xxs) {
                        (item.gender?.image ?? Image("genderless"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16, height: 16)
                        
                        Text(item.name ?? "")
                            .foregroundColor(.contentHigh)
                            .font(RMFont.main)
                    }
                    Spacer()
                    Text(item.status?.rawValue ?? "")
                        .foregroundColor(item.status?.color ?? .contentHigh)
                        .font(RMFont.secondary)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack(spacing: Spacing.xxs) {
                    Text("\(item.episode?.count ?? 0) episodes")
                        .foregroundColor(.contentHigh)
                        .font(RMFont.secondary)
                    
                    Spacer()
                }
                .padding(.top, Spacing.xxs)
                
                Spacer()
            }
            .padding(.top, Spacing.xxs)
        }
        .opacity(item.status == .dead ? 0.6 : 1)
    }
}
