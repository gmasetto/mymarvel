//
//  CharacterViewModel.swift
//  mymarvel
//
//  Created by Gilberto Masetto on  18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation

struct CharacterViewModel {
	
	let id: Int
	let name: String
	let description: String
	let pathImage: String
	let formatImage: String
    let comicsQtd: Int
    let storiesQtd: Int
    let seriesQtd: Int

	init(character: Character) {
		self.id = character.id
		self.name = character.name
		self.description = character.description
		self.pathImage = character.thumbnail.path
		self.formatImage = character.thumbnail.format
        self.comicsQtd = character.comics.qtd
        self.storiesQtd = character.stories.qtd
        self.seriesQtd = character.series.qtd
	}
}
