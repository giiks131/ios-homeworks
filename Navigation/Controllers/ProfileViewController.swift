import UIKit

class FirstProfileViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Post(title:"Profile").title
        
        view.addSubview(button)
        button.setTitle(Post(title:"Show my Card").title, for: .normal)
        button.backgroundColor = .systemMint
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        button.addTarget(self, action: #selector(didTapButtonOne), for: .touchUpInside)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain,target: self, action: #selector(didTapButtonTwo))
    }
   
    @objc private func didTapButtonOne() {
        let rootVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
    @objc private func didTapButtonTwo() {
        let rootVC = SecondProfileViewController()
        rootVC.view.backgroundColor = .white
        navigationController?.pushViewController(rootVC, animated: true)
    }
}

class SecondProfileViewController: UIViewController {
   
    private let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        view.addSubview(button)
        button.setTitle(Post(title: "Show my settings").title, for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
   
    @objc func showAlert() {
        let alert = UIAlertController(title: Post(title:"My settings").title, message: "Settings:", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            print("Settings were shown")
        }))
        present(alert, animated: true)
    }
}

class InfoViewController: UIViewController {

    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        title = Post(title: "My profile").title
        view.addSubview(button)
        button.setTitle(Post(title:"Show Info").title, for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: Post(title:"Info").title, message: "Sorry, no info. Please check settings", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            print("Info was shown")
        }))
        present(alert, animated: true)
    }
}

struct Post {
    let title: String
}
