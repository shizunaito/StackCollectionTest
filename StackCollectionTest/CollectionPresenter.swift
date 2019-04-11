protocol CollectionPresenter: class {
    var output: CollectionOutput? { get set }
    func viewDidLoad()
    func viewDidLayoutSubviews()
}

protocol CollectionOutput: class {
    func setText(text: String)
}

class CollectionPresenterImpl: CollectionPresenter {
    private var isFirstLayout = true
    
    func viewDidLayoutSubviews() {
        guard isFirstLayout else { return }
        let text = "fojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\n\n\nfojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\nfojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\n\n\nfojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\nfojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\n\n\nfojijsefkwleskfwj\nfiowejfjw\nsjfoiew\n\n\nfeklweksifjwe\n\n\n"
        output?.setText(text: text)
        //isFirstLayout = false
    }
    
    weak var output: CollectionOutput?

    func viewDidLoad() {
    }
}
