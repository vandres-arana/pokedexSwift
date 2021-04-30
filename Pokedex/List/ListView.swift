//
//  ListView.swift
//  Pokedex
//
//  Created by Cristian Misael Almendro Lazarte on 22/4/21.
//  
//

import Foundation
import UIKit
import Apollo

class ListView: UIViewController {

    // MARK: Properties
    var presenter: ListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var data = [GetAllPokemonsWithLimitQuery.Data.Pokemon]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.startfetchingPokemonList()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ListView: ListViewProtocol {
    
    func showPokemonList(result: Result<GraphQLResult<GetAllPokemonsWithLimitQuery.Data>, Error>) {
        switch result {
            case .success(let results):
                DispatchQueue.main.async {
                self.data.append(contentsOf: results.data!.pokemons)
                self.tableView.reloadData()
                }
            case .failure(_):
                print("error")
        }
    }
    
    func showError() {
        print("Error")
    }
}

extension ListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if !data.isEmpty {
            cell.textLabel?.text = data[indexPath.row].name
            print("miss")
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
}
