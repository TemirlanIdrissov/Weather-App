import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
    }()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
    }
    
    @objc private func handleShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    
    
    private func configureUI() {
        view.backgroundColor = .white
        searchBar.delegate = self
        searchBar.sizeToFit()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Weather App"
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .red
        showSearchBarButton(shouldShow: true)
        
        
    }
        
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        }else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    private func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = "api.openweathermap.org/data/2.5/weather?q=\(searchBar.text)&appid=759918948d8ac27f75325a85486c5b33"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error { print(error); return }
            guard let data = data else { return }
            print(searchBar.text)
            do {
                
            }
        }
        
        
//        let task = URLSession.shared.dataTask(with: url!) { data,response , error  in
//
//        }
//        task.resume()
    }
}






//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchBar.layer.borderWidth = 0.5
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        searchBar.layer.borderWidth = 0.0
//    }
