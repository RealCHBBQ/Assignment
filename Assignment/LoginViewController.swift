//
//  LoginViewController.swift
//  Assignment
//
//  Created by RealCH on 6/1/2022.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    func notifyUser(_ msg: String, err: String?) {
        
        let alert = UIAlertController(title: msg,message: err,preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK",style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Login(_ sender: Any) {
        
        let context = LAContext()
        
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,localizedReason: "Access requires authentication",reply:{(success, error) in
                DispatchQueue.main.async{
                    if let err = error{
                        switch err._code{
                        case LAError.Code.systemCancel.rawValue:
                            self.notifyUser ("Session cancelled",
                                             err: err.localizedDescription)
                        case LAError.Code.userCancel.rawValue:
                            self.notifyUser ( "Please try again",
                                              err: err.localizedDescription)
                        case LAError.Code.userFallback.rawValue:
                            self.notifyUser ("Authentication",
                                             err:
                                                "Password option selected")
                        // Custom code to obtain password here
                        default:
                            self.notifyUser ("Authentication failed",
                                             err: err.localizedDescription)
                        }
                        } else{
                    self.notifyUser ("Authentication Successful",
                                     err: "You now have full access")
                    }
                    }
                                   }
                                   )
        }else {
            // Device cannot use biometric authentication
            if let err
                = error{
                switch err.code{
                case LAError.Code.biometryNotEnrolled.rawValue:
                    notifyUser ( "User is not enrolled",
                                 err: err.localizedDescription)
                case LAError.Code.passcodeNotSet.rawValue:
                    notifyUser ("A passcode has not been set",
                                err: err.localizedDescription)
                case LAError.Code.biometryNotAvailable.rawValue:
                    notifyUser ( "Biometric authentication not available",
                                 err: err.localizedDescription)
                default:
                    notifyUser ( "Unknown error",
                                 err: err.localizedDescription)
        }
    }
}
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
