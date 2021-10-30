import UIKit

class ProfileViewController: UIViewController {

    let header = ProfileViewHeader()
    
    override func viewWillLayoutSubviews() {
        header.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = Post(title:"Profile").title
        view.addSubview(header)
    }

}
