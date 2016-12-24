//
//  FlickrAPIHandler.swift
//  flickrSlideShow
//
//  Created by JAY on 12/23/16.
//  Copyright © 2016 JAY. All rights reserved.
//

import Foundation
import UIKit

class FlickrAPIHandler: NSObject, XMLParserDelegate, URLSessionDelegate{
    
    var parser: XMLParser
    var currentElement: String = ""
    var passImageLink: Bool = false
    
    var imageLinks = [String]()
    var images = [UIImage]()
    
    var delegate: XMLParserDelegate?
    
    init?(contentsOf url: URL) {
        guard var parser = XMLParser(contentsOf: url) else { return nil}
        self.parser = parser
        super.init()
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        if(elementName == "link" && attributeDict["rel"] == "enclosure"){
            let imgLink = attributeDict["href"]! as String
            imageLinks.append(imgLink)
            passImageLink = true
        }
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement = ""
        if(elementName == "link"){
            if(elementName == "id"){
                passImageLink = false
            }
        }
    }
    
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("failure error: %@", parseError)
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
    }
}
