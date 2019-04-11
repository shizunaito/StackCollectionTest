import UIKit

class FlexibleLabelView: UIView {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(text: String) {
        textLabel.text = text
    }
}
