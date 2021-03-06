import UIKit
import StorageService

class FeedViewController: UIViewController {
     var buttonFirst: UIButton = {
        let button = UIButton()
        button.setTitle(Post(title:"Open new post").title, for: .normal)
        button.backgroundColor = .systemMint
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonSecond: UIButton = {
        let button = UIButton()
        button.setTitle(Post(title:"Open new post").title, for: .normal)
        button.backgroundColor = .systemMint
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        view.addSubview(buttonFirst)
        view.addSubview(buttonSecond)
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonFirst)
        stackView.addArrangedSubview(buttonSecond)
        setupViews()
    }
   
    @objc private func didTapButton() {
        let rootVC = PostViewController()
        rootVC.view.backgroundColor = .white
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setupViews() {
        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            buttonFirst.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.45),
            buttonSecond.heightAnchor.constraint(equalTo: buttonFirst.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        view.layoutIfNeeded()
        view.setNeedsLayout()
    }
}

class PostViewController: UIViewController {
   
    let postImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Post(title: "Post").title
        view.addSubview(postImage)
        postImage.image = UIImage(systemName: "rectangle.roundedbottom")
        postImage.frame = CGRect(origin: CGPoint(x: 16, y: 100), size: CGSize(width: 390-32, height: 300))
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain,target: self, action: #selector(didTapButton))
    }
    
    @objc private func didTapButton() {
        let rootVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
}

class InfoViewController: UIViewController {

    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = Post(title: "Share").title
        view.addSubview(button)
        button.setTitle(Post(title:"Share with:").title, for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 60)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    @objc func showAlert() {
        let alert = UIAlertController(title: Post(title:"ERROR").title, message: "Sorry, no share options. Please check later", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            print("OK was pressed")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            print("Cancel was pressed")
        }))
        present(alert, animated: true, completion: nil)
    }
}

