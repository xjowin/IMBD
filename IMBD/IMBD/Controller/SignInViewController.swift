import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        sleep(UInt32(1))
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let l = login.text
        let p = password.text
        
        if l!.isEmpty || p!.isEmpty {
            let alert = UIAlertController(title: "Error", message: "All fields are required!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
        else if userData[l!] != p! {
            let alert = UIAlertController(title: "Error", message: "Invalid username or password!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
        else {
            let new = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            
            new.modalPresentationStyle = .fullScreen
            self.present(new, animated: true)
        }
    }
    
    
    @IBAction func createAccBtn(_ sender: Any) {
        let new = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
