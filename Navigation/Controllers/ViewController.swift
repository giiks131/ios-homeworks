
import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .systemGray5
    }
    
    func setupTabBar() {
        let feedViewController = creativeNavController(viewController: FeedViewController(), itemName: "Feed", ItemImage: "newspaper")
        let messagesViewController = creativeNavController(viewController: MessagesViewController(), itemName: "Messages", ItemImage: "message.fill")
        let profileViewController = creativeNavController(viewController: LogInViewController(), itemName: "Profile", ItemImage: "person.crop.circle")
        
        viewControllers = [feedViewController, messagesViewController, profileViewController]

    }
    
    func creativeNavController(viewController: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
     
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 6, left: 0, bottom: -6, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: -1)
       
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
}


