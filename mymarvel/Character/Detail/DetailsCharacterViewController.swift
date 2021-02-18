//
//  DetailsCharacterViewController.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

import Foundation
import UIKit

class DetailsCharacterViewController: UIViewController {
	
	var characterViewModel: CharacterViewModel!
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var characterImage: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var qtdStories: UILabel!
    @IBOutlet weak var qtdComics: UILabel!
    @IBOutlet weak var qtdSeries: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		nameLabel.text = characterViewModel.name
		descriptionLabel.text = characterViewModel.description
        idLabel.text = String(characterViewModel.id)
        qtdStories.text = String(characterViewModel.storiesQtd)
        qtdComics.text = String(characterViewModel.comicsQtd)
        qtdSeries.text = String(characterViewModel.seriesQtd)

		characterImage.loadImageCache(urlString: characterViewModel.pathImage + "/portrait_fantastic.jpg")
	}
		
}
