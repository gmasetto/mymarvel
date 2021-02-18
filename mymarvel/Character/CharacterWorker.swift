//
//  CharacterService.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation

protocol CharacterWorkerProtocol {
	func fetchCharacters(onComplete: @escaping ([Character]) -> Void)
}

class CharacterWorker: CharacterWorkerProtocol {

	let basePath = "https://gateway.marvel.com/v1/public/characters?ts=1595375344&apikey=3c580ad5ca4e2430b31df8d6f301cccf&hash=3030a20d5de9da7fd008c8153940954b"
	
	func fetchCharacters(onComplete: @escaping ([Character]) -> Void) {
		let request = URLRequest(url: URL(string: self.basePath)!)
		
		let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
			if let data = data {
				do {
					let obj = try JSONDecoder().decode(Response.self, from: data)
					
					onComplete(obj.data.characters)
				} catch {
					print(error)
				}
			}

		})
		task.resume()
	}
}
