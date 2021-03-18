//
//  LoginFormController.swift
//  MyVK_IOSapp
//
//  Created by Ниязов Ринат Раимжанович on 2/2/21.
//

import UIKit

class LoginFormController: UIViewController {
   
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text, let password = passwordInput.text else { return false }
        
        if login == "admin" && password == "123" {
            let session = Session.instance
            session.token="rgr54rttv56gtrvb56hybgjmku7hjik87u6yhbre"
            session.userId=23
            
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
