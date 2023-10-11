//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import SwiftUI

struct CharactersListView: View {
    
    @ObservedObject var viewModel: CharacterListViewModel

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: Spacing.s) {                
                switch viewModel.viewState {
                    case .loading:
                        Spacer()
                    case .list:
                        list
                    case .empty:
                        empty
                    case .error:
                        error
                }
            }
            .padding(.top, Spacing.s)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

extension CharactersListView {
    
    var error: some View {
        VStack {
            Image("error")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
            
            Text("Ha ocurrido un error al obtener la lista de personajes...")
                .foregroundColor(.contentHigh)
                .font(RMFont.main)
                .padding(.horizontal, Spacing.s)
                .padding(.top, Spacing.m)
            
            Spacer()

            Button(action: {
                viewModel.onAppear()
            }, label: {
                Text("Volver a intentarlo")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.contentPrimary)
                    .cornerRadius(Spacing.s)
            })
            .padding(.horizontal, Spacing.s)
            
        }
        .padding(.bottom, Spacing.m)
    }
    
    var empty: some View {
        VStack {
            Spacer()
            
            Image("empty")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
            
            Text("No hay ningún personaje que consultar")
                .foregroundColor(.contentHigh)
                .font(RMFont.main)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.s)
                .padding(.top, Spacing.m)
            
            Spacer()
        }
        .padding(.bottom, Spacing.m)
    }
    
    var list: some View {
        List(viewModel.list, id: \.id) { item in
            CharacterListCellView(item: item)
                .onTapGesture {
                    viewModel.showDetails(item: item)
                }
                .onAppear {
                    viewModel.shouldLoadMoreData(id: item.id)
                }
        }
        .padding(.top, Spacing.s)
        .listStyle(.plain)
    }
}

#Preview {
    CharactersListView(viewModel: CharacterListViewModel(characterInteractor: rickyMortyAssembly.characterInteractor,
                                                         characterNavigator: CharacterListNavigatorImp(from: UIViewController(), detailsProvider: rickyMortyAssembly)))
}
