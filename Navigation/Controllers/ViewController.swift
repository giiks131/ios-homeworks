
import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let feedViewController = creativeNavController(viewController: FeedViewController(), itemName: "Feed", ItemImage: "newspaper")
        let messagesViewController = creativeNavController(viewController: MessagesViewController(), itemName: "Messages", ItemImage: "message.fill")
        let profileViewController = creativeNavController(viewController: FirstProfileViewController(), itemName: "Profile", ItemImage: "person.crop.circle")
        
        viewControllers = [feedViewController, messagesViewController, profileViewController]

    }
    
    func creativeNavController(viewController: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
     
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
       
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        
        return navController
    }
}

