//
//  ApplicationListViewController.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

class ApplicationListViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    
    lazy var viewModel: ApplicationListViewModel = {
        return ApplicationListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initVM()
    }
    
    func initView() {
        self.navigationItem.title = "Top Free Apps"
        
        var numberOfColum = 2
        if Util.isPad() {
            numberOfColum = 4
        }
        
        let collectionViewFlowLayout = CustomCollectionViewFlowLayout()
        collectionViewFlowLayout.setNumberOfColumns(number: numberOfColum)
        appsCollectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    func initVM() {
        
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( message )
                }
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.activityIndicator.isHidden = false
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.appsCollectionView.alpha = 0.0
                    })
                }else {
                    self?.activityIndicator.isHidden = true
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.appsCollectionView.alpha = 1.0
                    })
                }
            }
        }
        
        viewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.appsCollectionView.reloadData()
            }
        }
        
        viewModel.initFetch()
    }
    
    func showAlert( _ message: String ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ApplicationListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalVariables.ViewCell.ApplicationListCollectionViewCell.rawValue, for: indexPath) as! ApplicationListCollectionViewCell
        
        let cellVM = viewModel.getCellViewModel( at: indexPath )
        cell.appListCellViewModel = cellVM
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        self.viewModel.userPressed(at: indexPath)
        return true
    }
    
}

extension ApplicationListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ApplicationDetailViewController,
            let app = viewModel.selectedApp {
            vc.application = app
        }
    }
}
