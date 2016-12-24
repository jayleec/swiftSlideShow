//
//  SlideShowViewController.swift
//  flickrSlideShow
//
//  Created by JAY on 12/23/16.
//  Copyright © 2016 JAY. All rights reserved.
//

import UIKit
import Foundation


class SlideShowViewController: UIViewController {
    
    var imagelinks = [String]()
    var imageArray = [UIImage]()
    var aniDuration = Double()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("aniDuration = \(aniDuration)")
        
        loadImagesFromFlickr()
        
        for link in self.imagelinks {
            self.imageFromServerURL(urlString: link)
        }
        
    }
    
    
    func startAnimation(){
        imageView.animationImages = imageArray
        imageView.animationDuration = aniDuration
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    
    func loadImagesFromFlickr(){
        var apiStr = "https://api.flickr.com/services/feeds/photos_public.gne"
        var strToURL: NSURL = NSURL(string: apiStr)!
        var flickrHander = FlickrAPIHandler.init(contentsOf: strToURL as URL)
        
        imagelinks = (flickrHander?.imageLinks)!
        print("load from url")
        flickrHander = nil
    }
    
    
    func imageFromServerURL(urlString: String) {
        var session = URLSession.shared
        session.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.imageArray.append(image!)
                print("fetching image")
                
                if self.imageArray.count > 2 {
                    self.startAnimation()
                }
                
            })
            
        }).resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }
    
}


