import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    @IBOutlet weak var btnMaskPassword: UIButton!
    
    var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPassword.isSecureTextEntry = true
                txtConfirmPassword.isSecureTextEntry = true
    }
    
   
    
    
    @IBAction func btnMaskPasswordTouchDown(_ sender: Any) {
        togglePasswordVisibility()
    }
    
    
    @IBAction func btnMaskPasswordReleased(_ sender: Any) {
        togglePasswordVisibility()
    }
    
    @IBAction func btnRegisterTouchUpInside(_ sender: Any) {
        
        guard let name = txtName.text, !name.isEmpty else {
            Toast.ok(view: self, title: "Invalid Name", message: "Please enter your name")
            return
        }
        
        guard let email = txtEmail.text, !email.isEmpty, email.contains("@"), email.contains(".") else {
            Toast.ok(view: self, title: "Invalid Email", message: "Please enter a valid email address")
            return
        }
        
        let minimumPasswordLength = 8
        guard let password = txtPassword.text, !password.isEmpty, password.count >= minimumPasswordLength else {
            Toast.ok(view: self, title: "Invalid Password", message: "Password must be at least \(minimumPasswordLength) characters long")
            return
        }
        
        guard let confirmPassword = txtConfirmPassword.text, confirmPassword == password else {
            Toast.ok(view: self, title: "Password Mismatch", message: "Passwords do not match")
            return
        }
    }
    
    private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        txtPassword.isSecureTextEntry = !isPasswordVisible
    }

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.backToLoginViewController {
            
            let loginViewController = segue.destination as! LoginViewController
        }
        
        
    }
}
