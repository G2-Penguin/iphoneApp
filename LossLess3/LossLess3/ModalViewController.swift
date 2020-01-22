import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modoru() {
        dismiss(animated: true, completion: nil)
    }
}
