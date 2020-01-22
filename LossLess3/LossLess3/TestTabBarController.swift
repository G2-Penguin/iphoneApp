import UIKit

class TestTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        
        for item in tabBar.items! {
            if( item.tag != self.selectedIndex ) {
                item.badgeValue = "浅川"
            }
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = nil
    }
}
