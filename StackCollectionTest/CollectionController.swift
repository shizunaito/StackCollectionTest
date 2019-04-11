import UIKit

class CollectionController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var topView: TopView?
    var presenter: CollectionPresenter?
    
    func set(presenter: CollectionPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = UINib(nibName: "TopView", bundle: nil).instantiate(withOwner: self, options: nil).first as? TopView {
            topView = view
        }
        
        presenter?.output = self
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presenter?.viewDidLayoutSubviews()
    }
}

extension CollectionController: CollectionOutput {
    func setText(text: String) {
        guard let topView = topView else { return }
        topView.set(text: text)
        collectionView.addSubview(topView)
        let stackViewHeight = topView.stackView.bounds.height
        collectionView.contentInset = UIEdgeInsets(top: stackViewHeight, left: 0, bottom: 0, right: 0)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: -stackViewHeight),
            topView.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            topView.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            topView.widthAnchor.constraint(equalTo: collectionView.widthAnchor)
            ])
    }
}

extension CollectionController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension CollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 5.0
        let width: CGFloat = UIScreen.main.bounds.width / 3 - margin * 2
        return CGSize(width: width, height: width)
    }
}

extension CollectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.set(color: UIColor.randomColor())
        return cell
    }
}
