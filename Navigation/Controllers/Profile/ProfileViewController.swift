import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var userLoggedIn: Bool = false
    private lazy var logInViewController = LogInViewController()
    private let profileTableView = UITableView(frame: .zero, style: .grouped)
    
    enum CellReuseID: String {
        case `default` = "TableViewCellReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemGray6
        view.addSubview(profileTableView)
        setupConstraints()
        setupTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if (userLoggedIn) == false {
            userLogIn()
        }
    }
    
    func userLogIn() {
        navigationController?.pushViewController(logInViewController, animated: true)
        userLoggedIn = true
    }
    
    func setupTableView() {
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.default.rawValue)
        profileTableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.rowHeight = UITableView.automaticDimension
    }

    func setupConstraints() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}




extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            DataStorage.profileTableViewPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: CellReuseID.default.rawValue, for: indexPath) as! PostTableViewCell
            cell.post = DataStorage.profileTableViewPosts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = profileTableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return view.bounds.width * 0.3 + 100
        } else {
            return 0
        }
    }
  
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.CGFloatNumbers.px0
    }
}
