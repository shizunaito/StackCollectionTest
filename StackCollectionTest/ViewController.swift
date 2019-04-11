import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapGoToCollectionButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Collection", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? CollectionController else {
            fatalError("Cannot instantiate viewcontroller in \(storyboard)")
        }
        let presenter = CollectionPresenterImpl()
        viewController.set(presenter: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

