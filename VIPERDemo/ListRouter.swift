//
//  ListRouter.swift
//  Dunzo
//
//  Created by Suryakant Sharma on 03/08/22.
//

import Foundation
import UIKit

class ListRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = main.instantiateViewController(withIdentifier: String(describing: ListViewController.self)) as? ListViewController else {
            return UIViewController()
        }
        
        let presenter = ListPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController

        let interactor = ListInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        
        return viewController
    }
    
    func routeDetail() {
        
    }
}

protocol IteractorInterface: AnyObject {
    var presenter: ListPresenterInterface? {get set}

    func fetchItems(callback: @escaping (Result<[Item], Error>) -> Void)
    func fetchImage(for url: URL, callback: @escaping (Result<UIImage, Error>) -> Void)
}

protocol ListPresenterInterface: AnyObject {
    var interactor: IteractorInterface? {get set}
    func fetchItems()
    func fetchImage(for url: URL, callback: @escaping (Result<(UIImage, URL), Error>) -> Void)
}

protocol ListView: AnyObject {
    var presenter: ListPresenterInterface? { get set }
    
    func updateUI(_ items: [Item])
    func showError(message: String)
}



