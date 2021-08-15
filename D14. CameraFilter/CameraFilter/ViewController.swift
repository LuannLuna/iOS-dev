import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController, let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
            fatalError("Segue destination not found")
        }
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func applyFilterButtonPressed() {
        guard let sourceImage = self.photoImageView.image else { return }
        
        FilterService().applytFilter(to: sourceImage)
            .subscribe(onNext: { newImage in
                DispatchQueue.main.async {
                    self.updateUI(with: newImage)
                }
            }).disposed(by: disposeBag)
        
    }
    
    private
    func updateUI(with image: UIImage) {
        photoImageView.image = image
        applyFilterButton.isHidden = false
    }

}

