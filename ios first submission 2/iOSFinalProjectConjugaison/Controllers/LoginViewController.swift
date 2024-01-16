import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnMaskPassword: UIButton!

    var isPasswordVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()

        txtPassword.isSecureTextEntry = true 
    }

    @IBAction func btnMaskPasswordTouchDown(_ sender: Any) {
        togglePasswordVisibility()
    }


    @IBAction func btnMaskPasswordReleased(_ sender: Any) {
        togglePasswordVisibility()
    }
    
    @IBAction func btnLoginTouchUpInside(_ sender: Any) {
        
        
        print("Before calling SignIn")
        FrenchVerbAPI.signIn(email: "alex@gmail.com", password: "123456") { token in
            print("Logged in with token \(token)")
            Context.loggedUserToken = token
        } failHandler: { httpStatusCode, errorMessage in
            print("Failed with httpCode \(httpStatusCode) - \(errorMessage)")
        }
        
        print ("After calling SignIn")
    
        
        // VALIDATIONS
//        if txtEmail.text?.isEmpty == true
//        {
//            Toast.ok(view: self, title: "Invalid Information", message: "Please enter a valid email!")
//        }
//        
//        if let email = txtEmail.text, !(email.contains("@") && email.contains("."))
//        {
//            Toast.ok(view: self, title: "Invalid email", message: "Please enter a valid email address!")
//        }
//        
//        if txtPassword.text?.isEmpty == true
//        {
//            Toast.ok(view: self, title: "Invalid Information", message: "Please enter a valid password!")
//        }
//        
//        let minimumPasswordLength = 8
//        if let password = txtPassword.text, password.count < minimumPasswordLength
//        {
//            Toast.ok(view: self, title: "Invalid Password", message: "Password must be at least \(minimumPasswordLength) characters!")
//        }
    }


    private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        txtPassword.isSecureTextEntry = !isPasswordVisible
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toSignUpViewController {
            let signUpViewController = segue.destination as! SignUpViewController
            // Pass any necessary data to the signUpViewController if needed
        } else if segue.identifier == Segue.toHomePageViewController {
            let homePageViewController = segue.destination as! HomePageViewController
            // Pass any necessary data to the homePageViewController if needed
        }
    }
}
