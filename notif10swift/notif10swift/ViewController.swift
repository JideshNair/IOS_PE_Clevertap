
import UIKit
import CleverTapSDK;


class ViewController: UIViewController, CleverTapProductConfigDelegate {
    var productConfig: CleverTapProductConfig? = CleverTap.sharedInstance()?.productConfig
    var headerFromInternalServer = NSMutableDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
     //   productConfig?.delegate = self;
        setProductConfigDefaultsAndFetch()

       
    func setProductConfigDefaultsAndFetch() {
         
    //        guard headerFromInternalServer.count > 0 else {
    //            return
    //        }
          
            headerFromInternalServer.setValue("check", forKey: "forTest")
            headerFromInternalServer.setValue("NEU", forKey: "rewardString")
            headerFromInternalServer.setValue(false, forKey: "FeatValue")
            headerFromInternalServer.setValue(1.2, forKey: "DoubleValue")
            headerFromInternalServer.setValue(100, forKey: "NumberValue")
            headerFromInternalServer.setValue(100, forKey: "JsonValue")



            CleverTap.sharedInstance()?.productConfig.delegate = self;
            CleverTap.sharedInstance()?.productConfig.setDefaults(headerFromInternalServer as? [String : NSObject])
            CleverTap.sharedInstance()?.productConfig.fetch(withMinimumInterval: 60*1)
        }

//        let defaults = NSMutableDictionary()
//         defaults.setValue("value", forKey: "New Test 20 Jan")
//        productConfig?.setDefaults(defaults as? [String : NSObject])
      
       
        // Do any additional setup after loading the view, typically from a nib.
        
       
  
    }
    func ctProductConfigInitialized() {

  // productConfig?.fetch()
      //  print("previous value + \(ctValueNew) yes")
    }
        
    func ctProductConfigFetched() {
        productConfig?.activate()
        print("Product Config Fetched")
        let ctValue = productConfig?.get("New Test 20 Jan")
        print("Product Config Activated + \(ctValue) + yes")
    }
        
    func ctProductConfigActivated() {
        let ctValue = productConfig?.get("New Test 20 Jan")
        print("Product Config Activated + \(ctValue) + yes")
        
        let config = CleverTap.sharedInstance()?.productConfig.get("forTest")
        print("Product 0 :: forTest ",config as Any)
        let config1 = CleverTap.sharedInstance()?.productConfig.get("rewardString")
        print("Product 1:: rewardString ",config1 as Any)
        let config2 = CleverTap.sharedInstance()?.productConfig.get("FeatValue")
        print("Product 2:: FeatValue ",config2 as Any)
        let config3 = CleverTap.sharedInstance()?.productConfig.get("DoubleValue")
        print("Product 2:: DoubleValue ",config3 as Any)

        let config4 = CleverTap.sharedInstance()?.productConfig.get("NumberValue")
        print("Product 2:: NumberValue ",config4 as Any)
        let config5 = CleverTap.sharedInstance()?.productConfig.get("JsonValue")
        print("Product 2:: JsonValue ",config5 as Any)



        var headerFromProductConfig: [[String: Any]] = []

        for (key, _) in headerFromInternalServer {
            if let configValue = CleverTap.sharedInstance()?.productConfig.get(key as! String as! String) {
     //           headerFromProductConfig.append([String.getString(key): getProductConfigHeaderValue(value: configValue)])
            }
        }

        print(headerFromInternalServer as Any)
        
    }
    private func getProductConfigHeaderValue(value: CleverTapConfigValue) -> Any {
        if let val = value.stringValue {
            return val
        } else if let val = value.numberValue {
            return val
        } else {
            return value.boolValue
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      

}

