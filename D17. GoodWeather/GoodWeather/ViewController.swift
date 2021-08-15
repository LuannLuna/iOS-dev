//
//  ViewController.swift
//  GoodWeather
//
//  Created by Luann Luna on 15/08/21.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeather(nil)
        
        cityNameTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map { self.cityNameTextField.text }
            .subscribe(onNext: {
                if let city = $0 {
                    if city.isEmpty {
                        self.displayWeather(nil)
                    } else {
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: disposeBag)
        
        
    }
    
    private func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL.urlForWeatherAPI(city: cityEncoded) else { return }
        
        let resource = Resource<WeatherResult>(url: url)
        //        URLRequest.load(resource: resource)
        //            .observeOn(MainScheduler.instance)
        //            .catchErrorJustReturn(WeatherResult.empty)
        //            .subscribe(onNext: { result in
        //                let weather = result.main
        //                self.displayWeather(weather)
        //            }).disposed(by: disposeBag)
        
//        let search = URLRequest.load(resource: resource)
//            .observeOn(MainScheduler.instance)
//            .asDriver(onErrorJustReturn: WeatherResult.empty)
        
        let search = URLRequest.load(resource: resource)
            .retry(3)
            .observeOn(MainScheduler.instance)
            .catchError { error in
                print(error.localizedDescription)
                return Observable.just(WeatherResult.empty)
            }.asDriver(onErrorJustReturn: WeatherResult.empty)
        
        search.map { "\($0.main.temp) ℉" }
            .drive(temperatureLabel.rx.text)
            .disposed(by: disposeBag)
        
        search.map { "\($0.main.humidity) 💦"}
            .drive(humidityLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
    
    
    private func displayWeather(_ weather: Weather?) {
        if let weather = weather {
            temperatureLabel.text = "\(weather.temp) ℉"
            humidityLabel.text = "\(weather.humidity) 💦"
        } else {
            temperatureLabel.text = "🙈"
            humidityLabel.text = "⚭"
        }
    }
    
}

