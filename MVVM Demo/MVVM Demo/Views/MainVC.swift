//
//  ViewController.swift
//  MVVM Demo
//
//  Created by Lazar Pešić on 9/16/18.
//  Copyright © 2018 Lazar Pešić. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let mainViewModel = MainViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViews()
    }
    
    private func bindViews(){
        usernameTextField.rx.text.map({ $0 ?? ""})
        .bind(to: mainViewModel.username)
        .disposed(by: disposeBag)
        
        passwordTextField.rx.text.map({ $0 ?? ""})
        .bind(to: mainViewModel.password)
        .disposed(by: disposeBag)
        
        loginButton.rx.tap.asObservable()
            .subscribe(onNext: {
                self.mainViewModel.checkUsernameAndPassword(){ result in
                    if result {
                        //Next ViewController
                    } else {
                        //Error message
                    }
                }
            })
            .disposed(by: disposeBag)
        
        mainViewModel.isEnable.bind(to: loginButton.rx.isEnabled)
        .disposed(by: disposeBag)
    }
}
