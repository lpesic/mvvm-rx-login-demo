//
//  AppDataManager.swift
//  MVVM Demo
//
//  Created by Lazar Pešić on 9/16/18.
//  Copyright © 2018 Lazar Pešić. All rights reserved.
//

import Foundation

class AppDataManager{
    static let shared = AppDataManager()
    private init(){}
    
    func checkLoginData(username: String, password: String, completion: @escaping((Bool) -> Void)){
        //API...
        completion(false)
    }
}
