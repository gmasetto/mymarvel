//
//  Character.swift
//  mymarvel
//
//  Created by Gilberto Masetto on 18/02/21.
//  Copyright © 2021 Gilberto Masetto. All rights reserved.
//

struct Response: Codable {
	let code: Int
	let data: Data
}

struct Data: Codable {
	let total: Int
	let characters: [Character]
	
	enum CodingKeys: String, CodingKey {
		case total
		case characters = "results"
	}
}

struct Character: Codable {
	let id: Int
	let name: String
	let description: String
	let modified: String
	let thumbnail: Thumbnail
    let comics: Comics
    let stories: Stories
    let series: Series
	
}

struct Thumbnail: Codable{
	let path: String
	let format: String
	
	enum CodingKeys: String, CodingKey {
		case path
		case format = "extension"
	}
}

struct Comics: Codable {
    let qtd: Int


    enum CodingKeys: String, CodingKey {
        case qtd = "available"
    }
}

struct Stories: Codable {
    let qtd: Int


    enum CodingKeys: String, CodingKey {
        case qtd = "available"
    }
}

struct Series: Codable {
    let qtd: Int


    enum CodingKeys: String, CodingKey {
        case qtd = "available"
    }
}

