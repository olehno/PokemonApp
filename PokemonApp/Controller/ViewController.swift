//
//  ViewController.swift
//  PokemonApp
//
//  Created by Артур Олехно on 06/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pokey:[Card] = []
    
    private let pokemonsTable: UITableView = {
        let table = UITableView()
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(pokemonsTable)
        pokemonsTable.delegate = self
        pokemonsTable.dataSource = self
//        loadPokemonData()
        fetchPokemons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pokemonsTable.frame = view.bounds
    }
    
    private func fetchPokemons() {
        APICaller.shared.getPokemons { [weak self] result in
            switch result {
            case .success(let pokemons):
                self?.pokey = pokemons
                DispatchQueue.main.async {
                    self?.pokemonsTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        guard let url = URL(string:jsonUrl) else { return }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request){
            data,response,error in
            if error != nil{
                print((error?.localizedDescription)!)
            }
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(Pokemon.self,from:data)
                self.pokey = jsonData.cards
                
            }catch{
                print("error::::",error)
            }
        }.resume()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        let pokemon = pokey[indexPath.row]
        cell.configure(imageURL: pokemon.imageURL, name: pokemon.name, subtype: pokemon.subtype ?? "Unknown subtype")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
