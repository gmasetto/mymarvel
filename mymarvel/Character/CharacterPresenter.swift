//
//  CharacterPresenter.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation

protocol CharacterPresentable{
	func showViewModel(characters: [Character])
}

class CharacterPresenter: CharacterPresentable {
	
	init(view: CharacterView) {
		self.view = view
		view.setTitle("Character")
	}
	
	internal weak var view: CharacterView?
	
	func showViewModel(characters: [Character]) {
		let characterListViewModel = parse(characters: characters)
		view?.showCharacters(characterListViewModel: characterListViewModel)
	}
	
	private func parse(characters: [Character]) -> CharacterListViewModel {
		let items = characters.map {
			CharacterViewModel(character: $0)
		}
		
		return CharacterListViewModel(items: items)
	}
	
}
