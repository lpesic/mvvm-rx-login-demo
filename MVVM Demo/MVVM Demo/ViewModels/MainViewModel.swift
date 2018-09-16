//
//  MainViewModel.swift
//  MVVM Demo
//
//  Created by Lazar Pešić on 9/16/18.
//  Copyright © 2018 Lazar Pešić. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel {
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isEnable: Observable<Bool>{
        return Observable.combineLatest(username.asObservable(), password.asObservable()){ (username, password) -> Bool in
            return username.count > 0 && password.count > 0
        }
    }
    
    func checkUsernameAndPassword(completion: @escaping((Bool) -> Void)) {
        AppDataManager.shared.checkLoginData(username: username.value, password: password.value){ result in
            completion(result)
        }
    }
}
