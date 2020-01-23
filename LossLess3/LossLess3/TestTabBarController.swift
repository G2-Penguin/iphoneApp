import UIKit

class TestTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = UIColor(red: 83/255, green: 176/255, blue: 154/255, alpha: 1)
        self.selectedIndex = 0
        
        for item in tabBar.items! {
            if( item.tag != self.selectedIndex ) {
                item.badgeValue = "浅川"
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setTabBarItem(index: 0, titile: "もどる", image: UIImage(named: "return_nom_b.png")!, selectedImage: UIImage(named: "return_sel_b.png")!, offColor: UIColor.blue, onColor: UIColor.red)
        self.setTabBarItem(index: 1, titile: "商品一覧", image: UIImage(named: "product_nom_b.png")!, selectedImage: UIImage(named: "product_sel_b.png")!, offColor: UIColor.gray, onColor: UIColor.black)
        self.setTabBarItem(index: 2, titile: "割引商品", image: UIImage(named: "sale_nom_b.png")!, selectedImage: UIImage(named: "sale_sel_b.png")!, offColor: UIColor.gray, onColor: UIColor.black)
        self.setTabBarItem(index: 3, titile: "店舗詳細", image: UIImage(named: "store_nom_b.png")!, selectedImage: UIImage(named: "store_sel_b.png")!, offColor: UIColor.gray, onColor: UIColor.black)
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 11)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 11)], for: .selected)
        
    }

    func setTabBarItem(index: Int, titile: String, image: UIImage, selectedImage: UIImage,  offColor: UIColor, onColor: UIColor) -> Void {
        let tabBarItem = self.tabBarController?.tabBar.items![index]
        tabBarItem!.title = title
        tabBarItem!.image = image.withRenderingMode(.alwaysOriginal)
        tabBarItem!.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        tabBarItem!.setTitleTextAttributes([ .foregroundColor : offColor], for: .normal)
        tabBarItem!.setTitleTextAttributes([ .foregroundColor : onColor], for: .selected)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        /*switch item.tag {
        case 1:
            //店舗一覧を選択した時
            
        case 2:
            //商品一覧を選択した時
        case 3:
            //割引商品を選択した時
        case 4:
            //店舗詳細を選択した時
        default:
            return
        }*/
        item.badgeValue = nil
    }
}
