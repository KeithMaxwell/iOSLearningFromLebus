//
//  ViewController.swift
//  Climate
//
//  Created by 胡晗 on 2020/10/23.
//  Copyright © 2020 maxwell. All rights reserved.
//

import UIKit
import CoreLocation // 第一步：导入CoreLocation包
import Alamofire
import SwiftyJSON
import SVProgressHUD

class ViewController: UIViewController,CLLocationManagerDelegate,SelectCityDelegate {
    // 第四步：遵守CLLocationManagerDelegate协议

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    let weather = Weather()
    let appid = "ea82790127031a954597502b1c33586c"
    
    let locationManager = CLLocationManager()   //  第二步：定义一个CLLocationManager对象
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self //第五步：设置locationManager的委托对象
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //第三步：在viewWillAppear方法中初始化locationManager
        locationManager.requestWhenInUseAuthorization() //请求授权获取当前位置
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //设置位置精度越高，耗电越大
        locationManager.requestLocation() //请求用户位置 -- 只请求一次 这个调用会使用locationManager的代理的方法
    }
    
    func initWeather(weatherJSON:JSON){
        weather.city = weatherJSON["name"].stringValue
        weather.temp = Int(round(weatherJSON["main","temp"].doubleValue-273.15))
        weather.condition = weatherJSON["weather",0,"id"].intValue
    }
    
    func getWeather(params:[String:String]){
        AF.request("https://api.openweathermap.org/data/2.5/weather",parameters: params).responseJSON { response in
            if let json = response.value{
                let weather = JSON(json)
                self.initWeather(weatherJSON: weather)
                self.updateUI()
            }
        }
    }
    
    //第六步：定义必要的方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        print(lat,lon)
        let params = ["lat":"\(lat)","lon":"\(lon)","appid":appid]
        getWeather(params: params)
    }  
    
    //第七步：实现错误处理函数
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func updateUI(){
        cityLabel.text = weather.city
        tempLabel.text = "\(weather.temp)˚"
        weatherImage.image = UIImage(named: weather.icon)
        
    }
    
    func didChangeCity(city: String) {
        let paras = ["q":city,"appid":appid]
        getWeather(params: paras)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "selectCity" ){
            let vc  = segue.destination as! SelectCityViewController
            vc.data = "HELLO,MY NEXT!"
            vc.delegate = self
        }
    }
}

