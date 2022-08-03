//
//  ListInteractor.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import UIKit
import Combine

class ListInteractor: IteractorInterface {
    weak var presenter: ListPresenterInterface?
    
    
    let url = URL(string: "https://fakestoreapi.com/products")!
    
    func fetchItems(callback: @escaping (Result<[Item], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                callback(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let items = try JSONDecoder().decode([Item].self, from: data)
                    callback(.success(items))
                } catch {
                    callback(.failure(error))
                }
            }
            
        }.resume()
    }
    
    func fetchImage(for url: URL, callback: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                callback(.failure(error))
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                   callback(.success(image))
                } else {
                   callback(.failure("error"))
            }
        }.resume()
            
    }
    
    

}

extension String: Error {}
