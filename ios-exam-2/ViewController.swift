//
//  ViewController.swift
//  ios-exam-2
//
//  Created by liushangwei on 2019/11/17.
//  Copyright © 2019 zhouhaijian. All rights reserved.
//

import UIKit





class ViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var loginName: UILabel!
    @IBOutlet weak var plane: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        username.delegate = self
        password.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyUpEvent), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyDownEvent), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        
    }

    
    @objc func keyUpEvent(_ notif: Notification) -> Void {
        guard let userInfo = notif.userInfo,let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else{
            return
        }
        let height = rect.height
        view.frame.origin.y = -height
       
    }
    @objc func keyDownEvent(_ notif: Notification) -> Void {

        view.frame.origin.y = 0
       
    }
    
    @IBAction func colorSet(_ sender: Any) {
        let setColorAlert:UIAlertController = UIAlertController(title: "背景颜色设置", message: "", preferredStyle: .actionSheet)
        
        setColorAlert.addAction(UIAlertAction(title: "红色", style: .default, handler: {(action) in
            self.view.backgroundColor = .red
        }))
        
        setColorAlert.addAction(UIAlertAction(title: "黄色", style: .default, handler: {(action) in
            self.view.backgroundColor = .yellow
        }))
        
        setColorAlert.addAction(UIAlertAction(title: "蓝色", style: .default, handler: {(action) in
            self.view.backgroundColor = .blue
        }))
        
        setColorAlert.addAction(UIAlertAction(title: "白色", style: .default, handler: {(action) in
            self.view.backgroundColor = .white
        }))
        setColorAlert.addAction(UIAlertAction(title: "返回", style: .cancel, handler: {(action) in
            self.view.backgroundColor = .white
        }))
        present(setColorAlert, animated: true, completion: nil)
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func login(_ sender: Any) {
        if username.text == password.text{
            let name = username.text
             self.loginName.text = name
            let loginAlert:UIAlertController = UIAlertController(title: "Login", message: "验证成功！确认登陆？", preferredStyle: .alert)
            
            loginAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(action) in
                self.loginName.text = "SESSUCE"
                //s定时显示，可自定义
                let timer=Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(self.imgShow), userInfo:nil, repeats:true)

               
                                       
            }))
            loginAlert.addAction(UIAlertAction(title: "NO", style: .default, handler: {(action) in
                
            }))
             present(loginAlert, animated: true, completion: nil)
           
        }
        else{
            let loginAlert:UIAlertController = UIAlertController(title: "Login", message: "验证失败！请保证用户名与密码一致！", preferredStyle: .alert)
            loginAlert.addAction(UIAlertAction(title: "YES", style: .cancel, handler: {(action) in
                
            }))
             present(loginAlert, animated: true, completion: nil)
        }
        
    }
    @IBAction func clear(_ sender: Any) {
        username.text = "";
        password.text = "";
    }
    @objc func imgShow(){
        
        //改变透明度
        plane.alpha = abs(1-plane.alpha)

    }
}

