import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage1: UIImageView!
    @IBOutlet weak var productImage2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(text1: String, text2: String) {
        productImage1.image = UIImage(named: "ロゴ1.png")
        productImage2.image = UIImage(named: "Penguin2_1.png")
        label1.text = text1
        label2.text = text2
    }
}
