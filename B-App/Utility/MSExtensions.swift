//
//  MSExtensions.swift
//  iCheckbook
//
//  Created by maninder on 27/02/17.
//  Copyright © 2017 maninder. All rights reserved.
//

import Foundation
import UIKit



var dateFormate : DateFormatter = DateFormatter()
let APP_DateFormat = "dd-MMM-yyyy"
let APP_DateFormatNew = "yyyy-mm-dd"




@objc protocol MSProtocolCallback {
    
  //  @objc  optional var check : Bool
    @objc optional func actionMoveToPreviousVC( )
    @objc optional func actionMovingWithData(objData : AnyObject)
    @objc optional func actionMoveToPreviousVC(objAny : AnyObject )

    @objc optional func actionMoveToPreviousVC(action: Bool )
    @objc optional func actionMoveWithObj(obj : AnyObject , test : Bool )

    
}

func appDelegate() ->  AppDelegate{
    return UIApplication.shared.delegate as! AppDelegate
}
extension NSObject{
    
    //MARK: ------ Popular Objects
    
    var timeStamp: String{
        let time = String(format: "%0.0f", Date().timeIntervalSince1970 * 1000)
        return time
    }
    
        
        
        //MARK: ------ Popular Objects
        var ScreenHeight: CGFloat{
            return UIScreen.main.bounds.size.height //UIScreen.main.bounds.size.height
        }
        var ScreenWidth: CGFloat{
            return UIScreen.main.bounds.size.width
        }
        
    
}








extension Date {
    
    
    
    public static func timestamp() -> String {
        return "\(Date().timeIntervalSince1970 * 1000)" as String
    }
    
}

 extension NSDate {
   
    public func getStringFromDate() -> String
    {
       dateFormate.dateFormat = APP_DateFormat
        let dateString = dateFormate.string(from: self as Date)
        return dateString
    }
}

extension String
{
    
    
    func getNumberString() -> String{
        var strLocal = self
        strLocal = strLocal.removeParticularCharacterString(character: "-")
        strLocal = strLocal.removeParticularCharacterString(character: ".")
        return strLocal
    }
    
    func getDoubleString() -> String{
        
        var strLocal = self
        strLocal = strLocal.removeParticularCharacterString(character: "-")
        return strLocal
    }
    
    func getDoubleValue() -> Double{
        
        var strLocal = self

        strLocal = strLocal.removeParticularCharacterString(character: "-")
        
        return Double(strLocal)!
        
    }
    
    public func getDateFromString() -> Date
    {
        dateFormate.dateFormat = APP_DateFormat
        return dateFormate.date(from: self)!
    }
    
    
    public  func getAgeFromDOB() -> Int
    {
        let userDOB = dateFormate.date(from: self)!
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let ageComponent = gregorian.components(.year, from: userDOB , to: Date(), options: [])
        return ageComponent.year!
    }

    
    public func getTimeFromTimestamp() -> String {
        let formattr = DateFormatter()
        formattr.dateFormat = "h:mm a"
        let timestampDate = Date(timeIntervalSince1970: TimeInterval(self)!)
        return formattr.string(from: timestampDate)
    }
    
    public func isValidEmail() ->Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }

    
    public func removeSpacesInString() -> String
    {
       return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    

    public func getNumberFromString()-> Double
    {
        let newSTR = self.removeParticularCharacterString(character: ",")
        if let number = Int(newSTR) {
            return Double(number)
        }
        return 0.0
    }

    
    public func removeParticularCharacterString(character: String) -> String
    {
        return self.replacingOccurrences(of: character, with: "", options: NSString.CompareOptions.literal, range: nil)
    }
    
    
    public func removeMultipleCharactersString(arrayMutliple : [String]) -> String
    {
        var newString = self
        for item in arrayMutliple{
            newString =  newString.replacingOccurrences(of: item, with: "", options: NSString.CompareOptions.literal, range: nil)
        }
        return newString
    }


    public func isStringEmpty() -> Bool
    {
        let testingString = self
        if testingString.characters.count == 0 || checkIsEmpty()
        {
            return true
        }
        return false
    }
    
    func checkIsEmpty()-> Bool{
        let trimmedString = self.trimmingCharacters(in:  CharacterSet.whitespaces)
        if trimmedString.characters.count == 0 {
            return true
        }else{
            return false
        }
    }
    
    func removeEndingSpaces() -> String
    {
        let strTrimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return strTrimmed
    }
    
    func toDateWithSimpleFormat() -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self)
    }
}

extension UIView
{
    public func cornerRadius(value: CGFloat){
        let view:UIView = self
        view.layer.cornerRadius = value;
        view.clipsToBounds = true
    }

    
    
    public func addBorderWithColorAndLineWidth(color: UIColor , borderWidth : Float){
        let view:UIView = self
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = CGFloat(borderWidth)
    }

}

extension UILabel
{
    public func makeCircularBorder() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderColor = self.textColor.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
    }
}


extension UIViewController
{
    public func navTitle(title:NSString,color:UIColor,font:UIFont){
        let label: UILabel = UILabel()
        label.backgroundColor = UIColor.clear
        label.text = title as String
        label.font = font
        label.textAlignment = NSTextAlignment.center
        label.isUserInteractionEnabled = true;
        label.textColor = color
        self.navigationItem.titleView = label
        label.sizeToFit()
    }
    
    
    public func presentControllerWithNavController(objNextVC: UIViewController)
    {
        let navigation = UINavigationController(rootViewController: objNextVC)
        navigation.isNavigationBarHidden = true
        self.navigationController?.present(navigation, animated: true, completion: nil)
    }
    
    public func pushViewController(controllerName: String, storyboardName: UIStoryboard)
    {
        let objVc = storyboardName.instantiateViewController(withIdentifier: "\(controllerName)")
        self.navigationController?.pushViewController(objVc, animated: true)
    }
    
}

extension UITextField{
    
    public func acceptOnly15CharactersOnly(strNew: String)-> Bool
    {
        let txtFPara : UITextField = self
        if strNew == ""
        {
            return true
        }else if txtFPara.text?.characters.count == 15 {
            return false
        }
        return true
    }
    
    public func setBorder(corners:Int, borderWidth: Int, borderColor: UIColor) {
        self.layer.cornerRadius = CGFloat(corners)
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        let vw = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = vw
        self.leftViewMode = .always
        self.clipsToBounds = true
    }
    
    
    public func setDollarSign(){
        
        let view :UITextField = self
        let leftView : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: view.frame.size.height))
        leftView.backgroundColor = UIColor.clear
        leftView.text = "$";
        leftView.font = FontLight(size: 15)
        leftView.textAlignment = NSTextAlignment.center;
        view.leftView = leftView
        view.leftViewMode = .always
        view.contentVerticalAlignment = .center
    }
    
    public func isBlank() -> Bool {
        return self.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty ? true : false
    }
    
    public func trimmedText() -> String {
        return self.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}


extension UITableView{
    public func registerNibsForCells(arryNib : NSArray)
    {
        for i in 0  ..< arryNib.count
        {
            let nibName = arryNib.object(at: i) as! String
            print(nibName)
            let nibCell = UINib.init(nibName:nibName, bundle: nil);
            self.register(nibCell, forCellReuseIdentifier:nibName)
        }
    }
}

