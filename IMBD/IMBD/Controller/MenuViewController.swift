import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func seeMoreBtn(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        category = tag
        
        let new = storyboard?.instantiateViewController(withIdentifier: "MoviePageViewController") as! MoviePageViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
