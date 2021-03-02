//
//  ViewController.swift
//  mymarvel
//
//  Created by Gilberto Masetto on  18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CharacterView {
	
	var viewModel: CharacterListViewModel? {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let presenter = CharacterPresenter(view: self)
		let worker = CharacterWorker()
		let interactor = CharacterInteractor(worker: worker, presenter: presenter)
		interactor.fetchCharacters()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.items.count ?? 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let character: CharacterViewModel = (viewModel?.items[indexPath.row])!
        let nameCelula = "cellCharacter"

        let celula = tableView.dequeueReusableCell(withIdentifier: nameCelula, for: indexPath) as! CellCharacter

		celula.nameLabel.text = character.name
		celula.descriptionLabel.text = character.description
        
		celula.characterImage.loadImageCache(urlString: character.pathImage + "/portrait_xlarge.jpg")
		
		celula.characterImage.layer.cornerRadius = 42
		celula.characterImage.clipsToBounds = true
		
		celula.layer.borderWidth = 2
		celula.layer.cornerRadius = 10
		celula.layer.borderColor = UIColor.darkGray.cgColor
						
        return celula
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "detailCharacter" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let characterViewModel = self.viewModel?.items[indexPath.row]
				let viewControllerTarget = segue.destination as! DetailsCharacterViewController
				
				viewControllerTarget.characterViewModel = characterViewModel
			}
		}
	}
	
	func setTitle(_ title: String) {
		self.title = title
	}
	
	func showCharacters(characterListViewModel: CharacterListViewModel) {
		self.viewModel = characterListViewModel
	}
}

