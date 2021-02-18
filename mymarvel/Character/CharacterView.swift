//
//  CharacterView.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation

protocol CharacterView: class {
	
	func setTitle(_ title: String)
	func showCharacters(characterListViewModel: CharacterListViewModel)
    
}
