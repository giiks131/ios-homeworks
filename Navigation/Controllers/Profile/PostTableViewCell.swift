import UIKit

class PostTableViewCell: UITableViewCell {

    var post: ProfilePost? {
        didSet {
            postAuthor.text = post?.author
            postDescription.text =  post?.description
            postImage.image = UIImage(imageLiteralResourceName: post?.image ?? "image not found")
            postAmountOfLikes.text = "Likes: \(post?.likes ?? 0)"
            postAmoutOfViews.text = "Views: \(post?.views ?? 0)"
        }
    }
    
    private let postAuthor: UILabel = {
        let postAuthor = UILabel()
        postAuthor.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.numberOfLines = 2
        
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        
        return postAuthor
    }()
    
    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        
        postImage.translatesAutoresizingMaskIntoConstraints = false
        
        return postImage
    }()
    
    private let postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        
        return postDescription
    }()
    
    private let postAmountOfLikes: UILabel = {
        let postAmountOfLikes = UILabel()
        postAmountOfLikes.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px16, weight: .regular)
        postAmountOfLikes.textColor = .black
        
        postAmountOfLikes.translatesAutoresizingMaskIntoConstraints = false
        
        return postAmountOfLikes
    }()
    
    private let postAmoutOfViews: UILabel = {
        let postAmoutOfViews = UILabel()
        postAmoutOfViews.font = UIFont.systemFont(ofSize: Constants.CGFloatNumbers.px16, weight: .regular)
        postAmoutOfViews.textColor = .black
        
        postAmoutOfViews.translatesAutoresizingMaskIntoConstraints = false
        
        return postAmoutOfViews
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(postAuthor)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(postAmountOfLikes)
        contentView.addSubview(postAmoutOfViews)
        
        postAuthor.sizeToFit()
        postAmountOfLikes.sizeToFit()
        postAmoutOfViews.sizeToFit()
        
        let constraints = [
            
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.CGFloatNumbers.px16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            
            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: Constants.CGFloatNumbers.px12),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: Constants.CGFloatNumbers.px16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            
            postAmountOfLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Constants.CGFloatNumbers.px16),
            postAmountOfLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.CGFloatNumbers.px16),
            
            postAmoutOfViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Constants.CGFloatNumbers.px16),
            postAmoutOfViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.CGFloatNumbers.px16),
            
            contentView.bottomAnchor.constraint(equalTo: postAmountOfLikes.bottomAnchor, constant: Constants.CGFloatNumbers.px16)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}

