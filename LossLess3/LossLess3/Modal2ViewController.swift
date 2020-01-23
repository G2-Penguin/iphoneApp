import UIKit
import YSCheckBox

class Modal2ViewController: UIViewController, YSCheckBoxViewControllerDelegate {

    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.register(defaults: ["checks": "default"])
        Checkbox()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modoru() {
        dismiss(animated: true, completion: nil)
    }
    
    private func Checkbox() {
        let checkBox = YSCheckBoxViewController(labels: ["すべて","生鮮食品","弁当","惣菜"])
        checkBox.delegate = self
        checkBox.font = UIFont.systemFont(ofSize: 18)
        checkBox.labelColor = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        checkBox.labelMargin = 0
        checkBox.lineWidth = 1
        checkBox.checkBoxSelectedFillSize = 1
        checkBox.checkBoxMargin = 6
        checkBox.checkBoxCorner = 7
        checkBox.checkBoxStroke = .lightGray
        checkBox.checkBoxCheckStroke = .white
        checkBox.checkBoxSelectedFill = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        checkBox.checkBoxBGFill = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

        addChild(checkBox)
        checkBox.view.frame = container.bounds
        container.addSubview(checkBox.view)
        checkBox.didMove(toParent: self)
    }
    
    func didYSCeckBoxSelect(checks: [Bool]) {
        print(checks)
        UserDefaults.standard.set(checks, forKey: "checks")
    }
}
