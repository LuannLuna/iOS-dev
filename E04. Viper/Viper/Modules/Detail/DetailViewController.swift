import UIKit
import WebKit


protocol DetailViewInputs: class {
    func configure(entities: DetailEntities)
    func requestWebView(with request: URLRequest)
    func indicatorView(animate: Bool)
}

protocol DetailViewOutputs: class {
    func viewDidLoad()
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
}


final class DetailViewController: UIViewController {

    internal var presenter: DetailViewOutputs?

    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}


extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        presenter?.webView(webView, didFinish: navigation)
    }
}

extension DetailViewController: DetailViewInputs {

    func configure(entities: DetailEntities) {
        navigationItem.title = entities.entryEntity.gitHubRepository.fullName
    }

    func requestWebView(with request: URLRequest) {
        webView.load(request)
    }

    func indicatorView(animate: Bool) {
        DispatchQueue.main.async { [weak self] in
            _ = animate ? self?.indicatorView.startAnimating() : self?.indicatorView.stopAnimating()
        }
    }

}

extension DetailViewController: Viewable {}
