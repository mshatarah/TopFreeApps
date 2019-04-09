//
//  AppListViewModel.swift
//  Top Free Apps
//
//  Created by Mohammad Shatarah on 4/8/19.
//  Copyright © 2019 Mohammad Shatarah. All rights reserved.
//

import UIKit

class ApplicationListViewModel: NSObject  {
    
    let apiService: APIServiceProtocol
    
    private var applications: [Application] = [Application]()
    
    private var cellViewModels: [AppListCellViewModel] = [AppListCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var isAllowSegue: Bool = false
    
    var selectedApp: Application?
    
    var reloadTableViewClosure: (()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchTopFreeApps{ [weak self] (success, applications, error) in
            self?.isLoading = false
            if let error = error{
                self?.alertMessage = error.rawValue
            }else{
                self?.processFetchedApps(apps: applications!)
            }
            
        }
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> AppListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( app: Application ) -> AppListCellViewModel {
        let imageURL = app.images.count > 0 ? app.images[0].label : ""
        return AppListCellViewModel(appName: app.name.label, imageUrl: imageURL)
    }
    
    private func processFetchedApps( apps: [Application] ) {
        self.applications = apps // Cache
        var vms = [AppListCellViewModel]()
        for app in apps {
            vms.append( createCellViewModel(app: app) )
        }
        self.cellViewModels = vms
    }
}

extension ApplicationListViewModel {
    
    func userPressed( at indexPath: IndexPath ){
        let app = self.applications[indexPath.row]
        self.isAllowSegue = true
        self.selectedApp = app
    }
}

struct AppListCellViewModel {
    let appName: String
    let imageUrl: String
}
