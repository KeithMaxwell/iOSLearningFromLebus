//
//  SelectCityViewController.swift
//  Climate
//
//  Created by 胡晗 on 2020/10/24.
//  Copyright © 2020 maxwell. All rights reserved.
//

import UIKit

protocol SelectCityDelegate {
    func didChangeCity(city:String)
}

class SelectCityViewController: UIViewController {

    @IBOutlet weak var inputTextF: UITextField!
    
    var data = ""
    var delegate:SelectCityDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("data：\(data)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func queryWeather(_ sender: Any) {
        delegate?.didChangeCity(city: inputTextF.text!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
