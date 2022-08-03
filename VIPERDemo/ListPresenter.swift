//
//  ListPresenter.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import UIKit

class ListPresenter: ListPresenterInterface {
    var interactor: IteractorInterface?
    weak var view: ListView?
    
    func fetchItems() {
        interactor?.fetchItems(callback: { [weak self] result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self?.view?.updateUI(items)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.view?.showError(message: error.localizedDescription)
                }
            }
        })
    }
    
    func fetchImage(for url: URL, callback: @escaping (Result<(UIImage, URL), Error>) -> Void) {
        interactor?.fetchImage(for: url, callback: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    callback(.success((image, url)))
                case .failure(let error):
                    callback(.failure(error))
                }
            }
        })
    }
    
}
