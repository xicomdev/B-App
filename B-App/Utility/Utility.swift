//
//  Utility.swift
//  Drinks
//
//  Created by maninder on 8/3/17.
//  Copyright © 2017 Maninderjit Singh. All rights reserved.
//

import Foundation
import UIKit


@objc protocol MSSelectionCallback {
    @objc optional func moveWithFilterSelection()
    @objc optional func moveWithSortSelection()

    
}
func FontBold(size: CGFloat) -> (UIFont)
{
    return UIFont.boldSystemFont(ofSize: size)
}

func FontRegular(size: CGFloat) -> (UIFont)
{
    return UIFont.systemFont(ofSize: size)
}

func FontLight(size: CGFloat) -> (UIFont)
{
    
    return UIFont.systemFont(ofSize: size)
}

func getAuthHeader() -> String {

        if User.me.email == "" {
            return ""
        }else if User.me.password == "" {
            return ""
        }
        let loginString = String(format: "%@:%@", User.me.email, User.me.password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        return "Basic \(base64LoginString)"
    
}

func  showAlert(title : String , message : String , controller : UIViewController)
{
    let objAlertController = UIAlertController(title: title, message: message , preferredStyle: UIAlertControllerStyle.alert)
    let objAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler:
        {Void in
            
    })
    objAlertController.addAction(objAction)
    controller.present(objAlertController, animated: true, completion: nil)
}


func JSONString (paraObject : Any) -> String{
    var strReturning = String()
    do
    {
        if let postData : NSData = try JSONSerialization.data(withJSONObject: paraObject, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData?
        {
            strReturning  = NSString(data: postData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        }
    }
    catch
    {
        print(error)
    }
    return strReturning
}

public func getDayAndDateString(_ date: Date) -> (dayStr:String, dateStr:String){
    let formatter = DateFormatter()
    formatter.dateFormat  = "dd MMMM"
    let dateStr = formatter.string(from: date)
    formatter.dateFormat = "E"
    let dayStr = formatter.string(from: date)
    return (dayStr,dateStr)
}

public func getDateStr(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat  = "yyyy-MM-dd HH:mm:ss"
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.string(from: date)
}
public func getDateStrWithSimpleFormat(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
}

public func getCurrencySymbolFromCode(_ code: String) -> String {
    var symbol: String
    switch code {
    case "USD": symbol = "$"
    case "EUR": symbol = "€"
    case "GBP": symbol = "£"
    default:
        symbol = "$"
    }
    return symbol
}


public func getAreaInMeters(_ area: String, lblArea: UILabel)-> NSMutableAttributedString {
    let str = "m2"
    let aString = NSMutableAttributedString(string: str)
    
    let myFont = UIFont(name: lblArea.font!.fontName, size: 11.0)
    let superscriptAttributes: [String : Any] = [ NSBaselineOffsetAttributeName: 5, NSFontAttributeName:  myFont! ]
    aString.addAttributes(superscriptAttributes, range: NSRange(location: 1, length: 1))
    aString.addAttribute(NSKernAttributeName, value: 1.5, range: NSRange(location: 0, length: 2))
    
    let priceStr = NSMutableAttributedString(string: area, attributes: [NSFontAttributeName: myFont!])
    priceStr.append(aString)
    return priceStr
}

public func generateDatesArrayBetweenTwoDates(startDate: Date , endDate:Date) ->[Date]
{
    var datesArray: [Date] =  [Date]()
    var startDate = startDate
    let calendar = Calendar.current
    
    while startDate <= endDate {
        datesArray.append(startDate)
        startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        
    }
    return datesArray
}

public func resizeImage(_ image: UIImage) -> UIImage {
    
    var actualHeight: CGFloat = image.size.height
    var actualWidth: CGFloat = image.size.width
    let maxHeight: CGFloat = 400.0
    let maxWidth: CGFloat = 400.0
    var imgRatio: CGFloat = actualWidth/actualHeight
    let maxRatio: CGFloat = maxWidth/maxHeight
    let compressionQuality: CGFloat = 0.5;//50 percent compression
    
    if (actualHeight > maxHeight || actualWidth > maxWidth)
    {
        if(imgRatio < maxRatio)
        {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxHeight
        }
        else if(imgRatio > maxRatio)
        {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxWidth
        }
        else
        {
            actualHeight = maxHeight
            actualWidth = maxWidth
        }
    }
    let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
    UIGraphicsBeginImageContext(rect.size)
    image.draw(in: rect)
    let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    let imageData: Data = UIImageJPEGRepresentation(img, compressionQuality)!
    UIGraphicsEndImageContext()
    return UIImage(data: imageData)!
}



