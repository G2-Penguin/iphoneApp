import UIKit

class StoreAllViewController: UIViewController {
    
    @IBOutlet weak var ShopAimg: UIButton!
    @IBOutlet weak var ShopBimg: UIButton!
    @IBOutlet weak var ShopCimg: UIButton!
    @IBOutlet weak var ShopDimg: UIButton!
    
    var numA = 0
    var numB = 0
    var numC = 0
    var numD = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func shopAbt() {
        
    }
    
    @IBAction func shopBbt() {
        
    }
    
    @IBAction func shopbtC() {
        
    }
    
    @IBAction func shopbtD() {
        
    }
    
    @IBAction func shopAlikebt() {
        if numA == 0 {
            let image = UIImage(systemName: "star.fill")
            let state = UIControl.State.normal
            ShopAimg.setImage(image, for: state)
            numA = 1
        }
        else {
            let image = UIImage(systemName: "star")
            let state = UIControl.State.normal
            ShopAimg.setImage(image, for: state)
            numA = 0
        }
    }
    
    @IBAction func shopBlikebt() {
        if numB == 0 {
            let image = UIImage(systemName: "star.fill")
            let state = UIControl.State.normal
            ShopBimg.setImage(image, for: state)
            numB = 1
        }
        else {
            let image = UIImage(systemName: "star")
            let state = UIControl.State.normal
            ShopBimg.setImage(image, for: state)
            numB = 0
        }
    }
    
    @IBAction func shopClikebt() {
        if numC == 0 {
            let image = UIImage(systemName: "star.fill")
            let state = UIControl.State.normal
            ShopCimg.setImage(image, for: state)
            numC = 1
        }
        else {
            let image = UIImage(systemName: "star")
            let state = UIControl.State.normal
            ShopCimg.setImage(image, for: state)
            numC = 0
        }
    }
    
    @IBAction func shopDlikebt() {
        if numD == 0 {
            let image = UIImage(systemName: "star.fill")
            let state = UIControl.State.normal
            ShopDimg.setImage(image, for: state)
            numD = 1
        }
        else {
            let image = UIImage(systemName: "star")
            let state = UIControl.State.normal
            ShopDimg.setImage(image, for: state)
            numD = 0
        }
    }
}
