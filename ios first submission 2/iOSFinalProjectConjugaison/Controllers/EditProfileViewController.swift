import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toEditProfileViewController {
            
            let editProfileViewController = segue.destination as! EditProfileViewController
        }
    }

}
