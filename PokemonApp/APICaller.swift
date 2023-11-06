//
//  APICaller.swift
//  PokemonApp
//
//  Created by Артур Олехно on 06/11/2023.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getPokemons(completion: @escaping (Result<[Card], Error>) -> Void) {
        guard let url = URL(string: "https://api.pokemontcg.io/v1/cards") else { return }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(results.cards))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
}
