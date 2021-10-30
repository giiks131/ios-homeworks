import UIKit

class FirstProfileViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Post(title:"Profile").title
    }
}
