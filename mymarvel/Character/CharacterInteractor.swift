//
//  CharacterPresenter.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation

class CharacterInteractor {
	
	private let worker: CharacterWorkerProtocol
	internal let presenter: CharacterPresentable
	
	init(worker: CharacterWorkerProtocol, presenter: CharacterPresentable) {
		self.worker = worker
		self.presenter = presenter
	}
	
	
	func fetchCharacters() {
		self.worker.fetchCharacters { (characters) in
			self.presenter.showViewModel(characters: characters)
		}
	}
	
}
