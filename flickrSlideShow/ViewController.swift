//
//  ViewController.swift
//  flickrSlideShow
//
//  Created by JAY on 12/23/16.
//  Copyright © 2016 JAY. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerViewDataSource = Array(1...10)
    var duration = 60.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewDataSource.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerViewDataSource[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {

        switch row {
            case 0:  duration = 60
            case 1:  duration = 60*2
            case 2:  duration = 60*3
            case 3:  duration = 60*4
            case 4:  duration = 60*5
            case 5:  duration = 60*6
            case 6:  duration = 60*7
            case 7:  duration = 60*8
            case 8:  duration = 60*9
            case 9:  duration = 60*10
            default : duration = 60
        }
 
        
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start" {
            if let viewController = segue.destination as? SlideShowViewController {
                viewController.aniDuration = duration
            }
        }
    }

}

