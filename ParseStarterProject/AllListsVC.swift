//
//  AllListsVC.swift
//  ParseStarterProject
//
//  Created by Aleksei Petukhov on 04/11/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

var UserLists = [UserList]()
var UserShopLists = [UserList]()
var UserToDoLists = [UserList]()
var UserFavLists = [UserList]()


protocol refreshnumbeofreceivedlistsDelegate
{
    
    func refreshreceivednumber()
}

var submitimage : UIImage = UIImage(named: "SubmitIcon")!
var closeimage : UIImage = UIImage(named: "CloseIcon")!


class AllListsVC: UIViewController, UIPopoverPresentationControllerDelegate, refreshliststableDelegate, sortlistsDelegate, UIGestureRecognizerDelegate, UITextViewDelegate, UITextFieldDelegate {
    
    
    
    func sortandrefreshlists()
    {
        tableView.reloadData()
    }
    
    var shopicon : UIImage = UIImage(named: "4ShopType")!//UIImage(named: "ShoppingCart")!
    var todoicon : UIImage = UIImage(named: "4ToDoType")!
    var receivedicon : UIImage = UIImage(named: "4ReceivedType")!
    
   //var showoption = String()
    
   var showoption : String = "alllists"
    
    
    @IBOutlet var tableView: UITableView!
    
    var maindelegate : refreshmainviewDelegate?
    
    
    func changeshowoptions(option: String) {
        if option == "alllists" {
            showoption = "alllists"
            tableView.reloadData()
        } else if option == "shoplists" {
            showoption = "shoplists"
            tableView.reloadData()
        } else if option == "todolists" {
            showoption = "todolists"
            tableView.reloadData()
        } else if option == "favs" {
            showoption = "favs"
            tableView.reloadData()
        }
    }
    
    
    
    
    @IBOutlet var OpenMenu: UIBarButtonItem!
    
    @IBAction func MenuBar(sender: AnyObject) {
        
        if !(PFAnonymousUtils.isLinkedWithUser(PFUser.currentUser())) {
            
            if CheckConnection.isConnectedToNetwork() {
                
                   // maindelegate?.checkreceivedlists()
               
            } else {
                print("No internet connection found")
            }
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    
    @IBAction func todoBar(sender: AnyObject) {
        
        performSegueWithIdentifier("createnewtodolistfromall", sender: self)
    }
    
    
    
    
    @IBAction func AddBar(sender: AnyObject) {
        
        self.performSegueWithIdentifier("createnewshoplistfromall", sender: self)
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        // bug? exit segue doesn't dismiss so we do it manually...
      //  self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    //////////// VARS
    var lists = [Dictionary<String, AnyObject>]()
    
    var ShowFavourites = Bool()
    
    
    
    
    var ListsIds = [String]()
    var ListsNames = [String]()
    var ListsNotes = [String]()
    
    //new stuff
    var ListsCreationDates = [NSDate]()
    var ListsIsFavourite = [Bool]()
    //var ListsSharedWith = [String]()
    var ListsSharedWith = [[String]]()
    //var ListsSharedWithArray = [[String]]() //Multidimensional array.    //1st - sender, 2nd - receiver, dont use i
    
    
    var ListsConfirm = [Bool]()
    var ListsIsDeleted = [Bool]()
    var ListsIsShared = [Bool]()
    var ListsShareWith = [[AnyObject]]()
    
    var ListsItemsCount = [Int]()
    var ListsItemsCheckedCount = [Int]()
    
    //var ListsBelongsToUsers = [[String]]()
    
    var ListsBelongsToUser = [String]()
    
    var ListsIsReceived = [Bool]()
    
    var ListsReceivedFrom = [[String]]()
    
    var ListsIsSaved = [Bool]()
    
    var imagePath = String()
    
    //var ListsReceivedFromNames = [String]()
    
    var listtodelete: String?
    var listtofav: String?
    
    var listfromfav: String?
    
    var listtoshare: String?
    
    var listtosharetype = String()
    
    var listtosave: String?
    
    var favimage: UIImage = UIImage()
    var notfavimage: UIImage = UIImage()
    
    
    var ItemsInReceivedList = [String]()
    
    var ListsType = [String]()
    
    var listtoopen = String()
    
    
    
    

    //////////// END VARS
    
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    let progressHUD = ProgressHUD(text: NSLocalizedString("getting", comment: ""))
    let progressHUDdel = ProgressHUD(text: NSLocalizedString("wait", comment: ""))
    let progressHUDsave = ProgressHUD(text: NSLocalizedString("saving", comment: ""))
    
    func pause() {
        
        
        self.view.addSubview(progressHUD)
        
        progressHUD.setup()
        progressHUD.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func pausedeleting() {
        
        
        self.view.addSubview(progressHUDdel)
        
        progressHUDdel.setup()
        progressHUDdel.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func pausesaving() {
        
        
        self.view.addSubview(progressHUDsave)
        
        progressHUDsave.setup()
        progressHUDsave.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }


    
    func restore() {
        
        progressHUD.hide()
       
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    func restoredel() {
        
        progressHUDdel.hide()
        
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    func restoresaving() {
        
        progressHUDsave.hide()
        
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    
    func containslistid(values: [String], element: String) -> Bool {
        // Loop over all values in the array.
        for value in values {
            // If a value equals the argument, return true.
            if value == element {
                return true
            }
        }
        // The element was not found.
        return false
    }
    

    // checker
    func checkreceivedlists() {
        
        
       // var receivedcount : Int = 0
        
        //CHECK SHOP LISTS
        var query = PFQuery(className:"shopLists")
        query.whereKey("BelongsToUser", equalTo: PFUser.currentUser()!.objectId!)
        query.whereKey("isReceived", equalTo: true)
        query.whereKey("isSaved", equalTo: false)
        query.whereKey("isDeleted", equalTo: false)
        query.whereKey("confirmReception", equalTo: false)
        query.orderByDescending("updateDate")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(objects!.count) scores.")
                
                
                if let lists = objects as? [PFObject] {
                    
                    for object in lists {
                        print(object.objectId)
                        if self.containslistid(UserLists.map({ $0.listid }), element: object["listUUID"] as! String) || self.containslistid(UserShopLists.map({ $0.listid }), element: object["listUUID"] as! String){
                            
                            print("object is already retrieved from local datastore")
                        } else {
                            
                            var listid = object["listUUID"] as! String
                            var listname = object["ShopListName"] as! String
                            var listnote = object["ShopListNote"] as! String
                            var listcreationdate = object["updateDate"] as! NSDate
                            var listisfav = object["isFavourite"] as! Bool
                            var listisreceived = object["isReceived"] as! Bool
                            var listbelongsto = object["BelongsToUser"] as! String
                            var listissentfrom = object["sentFromArray"] as! [(String)]
                            var listissaved = object["isSaved"] as! Bool
                            
                            var listconfirm = object["confirmReception"] as! Bool
                            var listisdeleted = object["isDeleted"] as! Bool
                            var listisshared = object["isShared"] as! Bool
                            var listsharewitharray = object["ShareWithArray"] as! [[AnyObject]]
                            
                            var listitemscount = object["ItemsCount"] as! Int
                            var listcheckeditems = object["CheckedItemsCount"] as! Int
                            var listtype = "Shop"
                            var listcurrency = object["ListCurrency"] as! String
                            var listshowcats = object["ShowCats"] as! Bool
                            var listscolor = object["ListColorCode"] as! String
                            
                            
                            var receivedshoplist : UserList = UserList(
                                listid:listid,
                                listname:listname,
                                listnote:listnote,
                                listcreationdate:listcreationdate,
                                listisfavourite:listisfav,
                                listisreceived:listisreceived,
                                listbelongsto:listbelongsto,
                                listreceivedfrom:listissentfrom,
                                listissaved:listissaved,
                                listconfirmreception:listconfirm,
                                listisdeleted:listisdeleted,
                                listisshared:listisshared,
                                listsharedwith:listsharewitharray,
                                listitemscount:listitemscount,
                                listcheckeditemscount:listcheckeditems,
                                listtype:listtype,
                                listcurrency:listcurrency,
                                listcategories:listshowcats,
                                listcolorcode:listscolor
                                
                            )
                            
                            UserShopLists.append(receivedshoplist)
                            
                            //UserLists.extend(UserShopLists)
                            UserLists.append(receivedshoplist)

                            
                            //self.tableView.reloadData() // without this thing, table would contain only 1 row
                            
                            receivedcount += 1
                            
                        }
                        
                        //receivedcount += 1
                        
                        //object.pinInBackground()
                        //I think I do it later when saving
                    }
                    
                    UserLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
                    UserShopLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
                    UserToDoLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
                    UserFavLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
                    
                    dispatch_async(dispatch_get_main_queue(), {
                     self.tableView.reloadData()
                    })
                    
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
        
        //CHECK TODO LISTS
        var querytodo = PFQuery(className:"toDoLists")
        querytodo.whereKey("BelongsToUser", equalTo: PFUser.currentUser()!.objectId!)
        querytodo.whereKey("isReceived", equalTo: true)
        querytodo.whereKey("isSaved", equalTo: false)
        querytodo.whereKey("isDeleted", equalTo: false)
        querytodo.whereKey("confirmReception", equalTo: false)
        querytodo.orderByDescending("updateDate")
        querytodo.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(objects!.count) scores.")
                
                
                if let lists = objects as? [PFObject] {
                    
                    for object in lists {
                        print(object.objectId)
                        
                        if self.containslistid(UserLists.map({ $0.listid }), element: object["listUUID"] as! String) || self.containslistid(UserToDoLists.map({ $0.listid }), element: object["listUUID"] as! String){
                            
                            print("object is already retrieved from local datastore")
                        } else {
                        
                        var listid = object["listUUID"] as! String
                        var listname = object["ToDoListName"] as! String
                        var listnote = object["ToDoListNote"] as! String
                        var listcreationdate = object["updateDate"] as! NSDate
                        var listisfav = object["isFavourite"] as! Bool
                        var listisreceived = object["isReceived"] as! Bool
                        var listbelongsto = object["BelongsToUser"] as! String
                        var listissentfrom = object["SentFromArray"] as! [(String)]
                        var listissaved = object["isSaved"] as! Bool
                        
                        var listconfirm = object["confirmReception"] as! Bool
                        var listisdeleted = object["isDeleted"] as! Bool
                        var listisshared = object["isShared"] as! Bool
                        var listsharewitharray = object["ShareWithArray"] as! [[AnyObject]]
                        
                        var listitemscount = object["ItemsCount"] as! Int
                        var listcheckeditems = object["CheckedItemsCount"] as! Int
                        var listtype = "ToDo"
                        var listscolor = object["ListColorCode"] as! String
                       // var listcurrency = object["ListCurrency"] as! String
                        // var listshowcats = object["ShowCats"] as! Bool
                        
                        
                        var receivedtodolist : UserList = UserList(
                            listid:listid,
                            listname:listname,
                            listnote:listnote,
                            listcreationdate:listcreationdate,
                            listisfavourite:listisfav,
                            listisreceived:listisreceived,
                            listbelongsto:listbelongsto,
                            listreceivedfrom:listissentfrom,
                            listissaved:listissaved,
                            listconfirmreception:listconfirm,
                            listisdeleted:listisdeleted,
                            listisshared:listisshared,
                            listsharedwith:listsharewitharray,
                            listitemscount:listitemscount,
                            listcheckeditemscount:listcheckeditems,
                            listtype:listtype,
                            listcolorcode:listscolor
                            
                        )
                        
                        UserToDoLists.append(receivedtodolist)
                        UserLists.append(receivedtodolist)

                        
                           // self.tableView.reloadData() // without this thing, table would contain only 1 row
                            
                            receivedcount += 1
                        
                        }
                    }
                     dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                        })
                    
                    if receivedcount != 0 {
                        
                       // self.displayAlert("Incoming lists!", message: "You have received \(String(receivedcount)) lists")
                        
                        //JSSAlertView().show(self, title: "You have received \(String(receivedcount)) lists")
                    }
                    //self.displayAlert("Incoming lists!", message: "You have received lists")
                    
                    
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
    }
    
    func displayReceivedAlert(title: String, message: String) {
        
        let customIcon = UIImage(named: "ListSentSuccess")
        let alertview = JSSAlertView().show(self, title: title, text: message, buttonText: "OK", color: UIColorFromHex(0x31797D, alpha: 0.9), iconImage: customIcon)
        alertview.setTextTheme(.Light)
        alertview.addCancelAction(closeCallback)
    }
    
    func closeCallback() {
        tableView.reloadData()
    }
    
    
    
    func sortListsDESC(compare:UserList, to:UserList) -> Bool {
       // return compare.listcreationdate.compare(to.listcreationdate) == NSComparisonResult.OrderedDescending
        return compare.listcreationdate.compare(to.listcreationdate) == NSComparisonResult.OrderedAscending
        //ListsArray.sort({ $0.date.compare($1.date) == NSComparisonResult.OrderedAscending })
    }

    
    func sortArray() {
        let sortedarray = ListsIds.reverse()
        
        
        
        //for (index, element) in enumerate(sortedarray) {
        for (index, element) in sortedarray.enumerate() { //swift 2
            ListsIds[index] = element
        }
        
        tableView.reloadData()
        //refreshControl?.endRefreshing()
    }

    
    /*
    override func viewDidAppear(animated: Bool) {
       
        checkreceivedlists()
        
        tableView.reloadData()
        
    }
    */
    
    
    @IBOutlet var toptoolbar: UIToolbar!
    
    @IBOutlet var bottomtoolbar: UIToolbar!
    
    
    func reloadTableAfterPush() {
        
    //displayReceivedAlert("", message: mesalert)
        
      checkreceivedlists()
      tableView.reloadData()
 
    }

    
    func displayFailAlert(title: String, message: String) {
        
        let customIcon = UIImage(named: "FailAlert")
        let alertview = JSSAlertView().show(self, title: title, text: message, buttonText: "OK", color: UIColorFromHex(0xF23D55, alpha: 0.9), iconImage: customIcon)
        alertview.setTextTheme(.Light)
        // alertview.addAction(cancelCallback)
        alertview.addCancelAction(closeCallback)
    }
    
    func displayInfoAlert(title: String, message: String) {
        
        let customIcon = UIImage(named: "FailAlert")
        let alertview = JSSAlertView().show(self, title: title, text: message, buttonText: "OK", color: UIColorFromHex(0x2A2F36, alpha: 0.9), iconImage: customIcon)
        alertview.setTextTheme(.Light)
        // alertview.addAction(cancelCallback)
        alertview.addCancelAction(closeCallback)
    }
    
    
    
   
    
    func refreshlists() {
        
        
        if CheckConnection.isConnectedToNetwork() {
             checkreceivedlists()
        } else {
            print("No internet connection found")
            displayFailAlert(NSLocalizedString("NoConnection", comment: ""), message: NSLocalizedString("cannotcheck", comment: ""))
        }

        tableView.reloadData()
    }
    
    
    @IBOutlet var newlistname: CustomTextField!//UITextField!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        return
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    @IBOutlet var smalltopview: UIView!
    
    @IBOutlet var OpenMenu2: UIBarButtonItem!
    
 
    
    func backfromsort() {
       // navbutton.imageView!.transform = CGAffineTransformMakeRotation(CGFloat(2*M_PI))
    }
    
    @IBAction func tapsettings(sender: AnyObject) {
        
        performSegueWithIdentifier("sortpopup", sender: self)
        
    }
    func clickthetitle(button: UIButton) {
        

           // navbutton.imageView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        performSegueWithIdentifier("sortpopup", sender: self)

          //  navbutton.imageView!.transform = CGAffineTransformMakeRotation(CGFloat(2*M_PI))

        
    }

    
    @IBAction func addlist(sender: AnyObject) {
        //testview.hidden = false
    }
    
    @IBOutlet var testview: UIView!
    
    
    let navbutton =  UIButton(type: .Custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // navigation title as a button
        
        /*
        navbutton.frame = CGRectMake((((self.view.frame.size.width) / 2) - 80),0,140,40) as CGRect
        navbutton.setTitle("My lists", forState: UIControlState.Normal)
        navbutton.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 14)
        navbutton.setTitleColor(UIColorFromRGB(0x31797D), forState: .Normal)
        /*
        let spacing: CGFloat = 10; // the amount of spacing to appear between image and title
        navbutton.imageEdgeInsets = UIEdgeInsetsMake(2, 100, 0, 0); // top left bottom right
        navbutton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
 */
        let titleimage = UIImage(named: "myliststitle") as UIImage?
        navbutton.setImage(titleimage, forState: .Normal)
        navbutton.addTarget(self, action: Selector("clickthetitle:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let spacing : CGFloat = 3;
        let insetAmount : CGFloat = 0.5 * spacing;
        
        // First set overall size of the button:
        navbutton.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
        navbutton.sizeToFit()
        
        // Then adjust title and image insets so image is flipped to the right and there is spacing between title and image:
        navbutton.titleEdgeInsets  = UIEdgeInsetsMake(0, -navbutton.imageView!.frame.size.width - insetAmount, 0,  navbutton.imageView!.frame.size.width  + insetAmount);
        navbutton.imageEdgeInsets  = UIEdgeInsetsMake(2, navbutton.titleLabel!.frame.size.width + insetAmount, 0, -navbutton.titleLabel!.frame.size.width - insetAmount);
        */
        
        //self.navigationItem.titleView = navbutton
        self.navigationItem.title = "My lists"
        
        //
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableAfterPush", name: "reloadTableLists", object: nil)
        
        
        OpenMenu2.target = self.revealViewController()
        OpenMenu2.action = Selector("revealToggle:")
        
        if let revealController = self.revealViewController() {
           // revealController.panGestureRecognizer()
            revealController.tapGestureRecognizer()
        }
        
       // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        /*
        newclosebuttonoutlet.layer.borderWidth = 1
        newclosebuttonoutlet.layer.borderColor = UIColorFromRGB(0xF23D55).CGColor
        newclosebuttonoutlet.layer.cornerRadius = 4
        
        newdonebutton.layer.cornerRadius = 4
        
        newlistname.leftTextMargin = 10
        
        newnotetextview.layer.borderWidth = 1
        newnotetextview.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
        newnotetextview.layer.cornerRadius = 4
        
        newnotetextview.delegate = self
        newlistname.delegate = self
        
        newlistname.layer.borderWidth = 1
        newlistname.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
        newlistname.layer.cornerRadius = 4
        
        blurredview.layer.cornerRadius = 4
        self.blurredview.clipsToBounds = true
        */
        
       // toptoolbar.barTintColor = UIColorFromRGB(0x31797D)//2a2f36)
        

        
        self.view.layoutMargins = UIEdgeInsetsZero
        
        // Do any additional setup after loading the view.
         ShowFavourites = false
        
        print("Option is \(showoption)")
        
      //  showoption = "alllists"
        
       // showalloutlet.tintColor = UIColorFromRGB(0xE0FFB2)
        
        /*
        print("all [\(UserLists), \(UserLists.count)]")
        print("all [\(UserShopLists), \(UserShopLists.count)]")
        print("all [\(UserToDoLists), \(UserToDoLists.count)]")
        
        
        print(UserLists.map({ $0.listtype }))
        print(UserShopLists.map({ $0.listtype }))
        print(UserToDoLists.map({ $0.listtype }))
*/
            //find(lazy(UserLists).map({ $0.listid }), listtosave!)
        
        //UserLists.sort(self.sortListsDESC)
        //UserShopLists.sort(self.sortListsDESC)
       // UserToDoLists.sort(self.sortListsDESC)
        
        UserLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
         UserShopLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
         UserToDoLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        UserFavLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        
        //SORT FUNCTION BY DATE
        
        let nib = UINib(nibName: "ReceivedListOldx", bundle:nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "receivedlist")
        
        //tableView.reloadData()
        
        
    }
    
    func refreshListsTable(sentshowoption: String) {
        
        showoption = sentshowoption
        tableView.reloadData()
        
        
    }
    
     override func viewWillAppear(animated: Bool) {
        //not sure if need this BUT
        itemsDataDict.removeAll(keepCapacity: true)
        toDoItems.removeAll(keepCapacity: true)
        
        
        //listsretrieval()
        /*
        if CheckConnection.isConnectedToNetwork() {
            //listsretrievalfromcloud()
             dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
           // self.checkreceivedlists()
            })
        } else {
            print("No internet connection found")
        }
        */
       // UserLists.sort(self.sortListsDESC)
        //UserShopLists.sort(self.sortListsDESC)
        //UserToDoLists.sort(self.sortListsDESC)
        
        
        UserLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        UserShopLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        UserToDoLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        UserFavLists.sortInPlace({ $0.listcreationdate.compare($1.listcreationdate) == NSComparisonResult.OrderedDescending })
        
       // checkreceivedlists()
        
      //  showoption = "alllists"
        /*
        if showoption == "alllists" {
            showalloutlet.tintColor = UIColorFromRGB(0xE0FFB2)
            showshopsoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showtodosoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            favsbaroutlet.tintColor = UIColorFromRGB(0xFAFAFA)
        } else if showoption == "shoplists" {
            showalloutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showshopsoutlet.tintColor = UIColorFromRGB(0xE0FFB2)
            showtodosoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            favsbaroutlet.tintColor = UIColorFromRGB(0xFAFAFA)
        } else if showoption == "todolists" {
            showalloutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showshopsoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showtodosoutlet.tintColor = UIColorFromRGB(0xE0FFB2)
            favsbaroutlet.tintColor = UIColorFromRGB(0xFAFAFA)
        } else if showoption == "favs" {
            showalloutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showshopsoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            showtodosoutlet.tintColor = UIColorFromRGB(0xFAFAFA)
            favsbaroutlet.tintColor = UIColorFromRGB(0xE0FFB2)
        }
        */
        
        
        
         tableView.reloadData()
        
      ////  print(UserLists.map({ $0.listtype }))
      //  print(UserShopLists.map({ $0.listtype }))
      //  print(UserToDoLists.map({ $0.listtype }))
      //  print(UserFavLists.map({ $0.listtype }))
        
        
        //badgestuff
        /*
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = label.font.pointSize * 1.2 / 2
        label.backgroundColor = UIColor.orangeColor()
        label.textColor = UIColor.whiteColor()
        label.text = String(receivedcount)
 **/
        /*
        if receivedcount > 0 {
        let toolbar = self.view.viewWithTag(999) as? UIToolbar
        //let menubar = self.view.viewWithTag(99) as? UIButton
            let menubar = toolbar!.viewWithTag(99) as? UIButton
        menubar?.addSubview(label)
        }
        */
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func UIColorFromRGBalpha(rgbValue: UInt, alp: Double) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alp)//CGFloat(1.0)
        )
    }
    
    
        
    
    var idforoptions = String()
    var codeforoptions = ""//String()
    var symbolforoptions = ""//String()
    var colorcodeforoptions = String()
    
    var listtypeforoptions = String()
    
    func optionsaction(indexPath: NSIndexPath) {
        
     listtypeforoptions = "Shop"
        
        if showoption == "alllists" {
            
            idforoptions = UserLists[indexPath.row].listid
            
            print(UserLists[indexPath.row])
            
            print(UserLists[indexPath.row].listcurrency)
            
            var currencyarray = UserLists[indexPath.row].listcurrency as! [AnyObject]
            codeforoptions = UserLists[indexPath.row].listcurrency![0] as! String
            symbolforoptions = UserLists[indexPath.row].listcurrency![1] as! String
            colorcodeforoptions = UserLists[indexPath.row].listcolorcode
            
        } else if showoption == "shoplists" {
            idforoptions = UserShopLists[indexPath.row].listid
            var currencyarray = UserShopLists[indexPath.row].listcurrency as! [AnyObject]
            codeforoptions = UserShopLists[indexPath.row].listcurrency![0] as! String
            symbolforoptions = UserShopLists[indexPath.row].listcurrency![1] as! String
            colorcodeforoptions = UserShopLists[indexPath.row].listcolorcode
        } else if showoption == "todolists" {
            idforoptions = UserToDoLists[indexPath.row].listid
            var currencyarray = UserToDoLists[indexPath.row].listcurrency as! [AnyObject]
            codeforoptions = UserToDoLists[indexPath.row].listcurrency![0] as! String
            symbolforoptions = UserToDoLists[indexPath.row].listcurrency![1] as! String
            colorcodeforoptions = UserToDoLists[indexPath.row].listcolorcode
        } else if showoption == "favs" {
            idforoptions = UserFavLists[indexPath.row].listid
            var currencyarray = UserFavLists[indexPath.row].listcurrency as! [AnyObject]
            codeforoptions = UserFavLists[indexPath.row].listcurrency![0] as! String
            symbolforoptions = UserFavLists[indexPath.row].listcurrency![1] as! String
            colorcodeforoptions = UserFavLists[indexPath.row].listcolorcode
        }
        
        self.performSegueWithIdentifier("Alllistsoptions", sender: self)

    }
    
     var todoidforoptions = String()
    var todocolorcodeforoptions = String()
    
    func todooptionsaction(indexPath: NSIndexPath) {
        
        listtypeforoptions = "ToDo"
        
        if showoption == "alllists" {
            todoidforoptions = UserLists[indexPath.row].listid
            todocolorcodeforoptions = UserLists[indexPath.row].listcolorcode
        } else if showoption == "shoplists" {
            todoidforoptions = UserShopLists[indexPath.row].listid
            todocolorcodeforoptions = UserShopLists[indexPath.row].listcolorcode
        } else if showoption == "todolists" {
            todoidforoptions = UserToDoLists[indexPath.row].listid
            todocolorcodeforoptions = UserToDoLists[indexPath.row].listcolorcode
        } else if showoption == "favs" {
            todoidforoptions = UserFavLists[indexPath.row].listid
            todocolorcodeforoptions = UserFavLists[indexPath.row].listcolorcode
        }
        
        self.performSegueWithIdentifier("todooptionssegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //here I will prepare the data for my list
        
        
        if segue.identifier == "sortpopup" {
            
           let popoverViewController = segue.destinationViewController as! SortPopup//UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
           // popoverViewController.preferredContentSize = CGSize(width: 200, height: 220)
            
          //  popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
          //  popoverViewController.popoverPresentationController!.delegate = self
            
            popoverViewController.delegate = self
            
            
        }

        
        if segue.identifier == "presentNav" {

            let toViewController = segue.destinationViewController as! MenuViewController//UIViewController
            toViewController.view.backgroundColor = UIColorFromRGB(0x1695A3).colorWithAlphaComponent(0.85)
            self.navigationController!.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
            //toViewController.view.alpha = 0.7
            // self.presentViewController(self, animated: true, completion: nil)
        }
        
     
    
        if segue.identifier == "OpenListSegue" {
            
           // let Nav = segue.destinationViewController as! UINavigationController
           // let destinationVC = Nav.viewControllers.first as! ShoppingListCreation
            let destinationVC : ShoppingListCreation = segue.destinationViewController as! ShoppingListCreation
            
            
            
          //  if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                // this is an interesting way but I can do much easier just using listtoopen variable
            
             //if var indexPath = sender as! NSIndexPath {
            if var indexPath = sender {
                
                destinationVC.justCreatedList = false
                
                var isreceived = Bool()
                
                print(UserLists[indexPath.row].listname)
                
                if showoption == "alllists" {
                    isreceived = UserLists[indexPath.row].listisreceived
                    destinationVC.activeList = UserLists[indexPath.row].listid
                }
                else if showoption == "shoplists" {
                    isreceived = UserShopLists[indexPath.row].listisreceived
                    destinationVC.activeList = UserShopLists[indexPath.row].listid
                    
                }
                else if showoption == "todolists" {
                    isreceived = UserToDoLists[indexPath.row].listisreceived
                    destinationVC.activeList = UserToDoLists[indexPath.row].listid
                    
                } else if showoption == "favs" {
                    isreceived = UserFavLists[indexPath.row].listisreceived
                    destinationVC.activeList = UserFavLists[indexPath.row].listid
                    
                } else {
                    isreceived = false
                }
                
                print("IS RECEIVED \(isreceived)")
                
                
                if isreceived == false {
                    destinationVC.isReceivedList = false
                } else {
                    destinationVC.isReceivedList = true
                }
                
            }

            
            
        }
        
        if segue.identifier == "ToDoOpenListSegue" {
            
           // let todoNav = segue.destinationViewController as! UINavigationController
           // let todoVC = todoNav.viewControllers.first as! ToDoListCreation
            
            let todoVC : ToDoListCreation = segue.destinationViewController as! ToDoListCreation

            
            //if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
            
            if var indexPath = sender {
            
                //destinationVC.activeList = ListsIds[indexPath.row]
                //todoVC.activelist = ListsIds[indexPath.row]
                todoVC.justCreated = false
              //  if ListsIsReceived[indexPath.row] == false {
                
                var isreceived = Bool()
                
                if showoption == "alllists" {
                    isreceived = UserLists[indexPath.row].listisreceived
                    todoVC.activelist = UserLists[indexPath.row].listid
                }
                else if showoption == "shoplists" { //just in case, actually this case is impossible
                isreceived = UserShopLists[indexPath.row].listisreceived
                todoVC.activelist = UserShopLists[indexPath.row].listid

                }
                else if showoption == "todolists" {
                isreceived = UserToDoLists[indexPath.row].listisreceived
                todoVC.activelist = UserToDoLists[indexPath.row].listid
                    
                } else if showoption == "favs" {
                    isreceived = UserFavLists[indexPath.row].listisreceived
                    todoVC.activelist = UserFavLists[indexPath.row].listid
                    
                } else {
                isreceived = false
                }

                print("IS RECEIVED \(isreceived)")
               // var isreceived = Bool()
                
                    
                if isreceived == false {
                    
                    todoVC.isReceived = false
                } else {
                    todoVC.isReceived = true
                }
            }
            
            
            
        } //createnewshoplistfromall
        
        if segue.identifier == "createnewshoplistfromall" {
            
          //  let shopNav = segue.destinationViewController as! UINavigationController
            //let shopVC = shopNav.viewControllers.first as! ShoppingListCreation
           
             let shopVC = segue.destinationViewController as! ShoppingListCreation
            
            shopVC.senderVC = self
            shopVC.justCreatedList = true
            shopVC.isReceivedList = false

            
          
            
            
        }
        
        if segue.identifier == "createnewtodolistfromall" {
            
            //  let shopNav = segue.destinationViewController as! UINavigationController
            //let shopVC = shopNav.viewControllers.first as! ShoppingListCreation
            
            let todoVC = segue.destinationViewController as! ToDoListCreation
            
            todoVC.senderVC = self
            todoVC.justCreated = true
            todoVC.isReceived = false
            
            
        }


        
        if segue.identifier == "shareListSegue" {
            
           // let shareNav = segue.destinationViewController as! UINavigationController
            
           // let shareVC = shareNav.viewControllers.first as! SharingViewController
            
            let shareVC = segue.destinationViewController as! SharingViewController
            
            
            shareVC.listToShare = listtoshare
            shareVC.listToShareType = listtosharetype
            
            shareVC.senderVC = "AllListsVC"
            
            
        }
        
        if segue.identifier == "Alllistsoptions" {
            
           let optionsVC = segue.destinationViewController as! ListOptionsPopover
            
         // optionsVC.view.backgroundColor = UIColorFromRGBalpha(0xFAFAFA, alp: 0.8)

            optionsVC.senderVC = "AllListsVC"
            optionsVC.listtoupdate = idforoptions
            optionsVC.code = codeforoptions
            optionsVC.symbol = symbolforoptions
            optionsVC.colorcode = colorcodeforoptions
            
            optionsVC.listtype = "Shop"
        }
        
        if segue.identifier == "todooptionssegue" {
            
            let optionsVC = segue.destinationViewController as! ListOptionsPopover
            
            // optionsVC.view.backgroundColor = UIColorFromRGBalpha(0xFAFAFA, alp: 0.8)
            
            optionsVC.senderVC = "AllListsVC"
            optionsVC.listtoupdate = todoidforoptions
            
            optionsVC.colorcode = todocolorcodeforoptions
            
            optionsVC.listtype = "ToDo"
            
        }
        
        

        
    }
    
    /*
    func adddeletefav(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
        let indexPathFav = tableView.indexPathForCell(cell)
        */
    
        func adddeletefav(indexPathFav: NSIndexPath) {
    
         let cell = tableView.cellForRowAtIndexPath(indexPathFav) as! ShopListCellNew
            
            
        if showoption == "alllists" {
            listfromfav = UserLists[indexPathFav.row].listid
            
            //////ALL
            
            if UserLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()
                if UserLists[indexPathFav.row].listtype == "Shop" {
                    
                    let queryfav = PFQuery(className:"shopLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = false
                            shopList.pinInBackground()
                            // shopList.saveInBackground()
                          //  shopList.saveEventually()
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = false
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }

                    if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserShopLists[foundshoplist].listisfavourite = false
                        
                    }

                    if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                       UserFavLists.removeAtIndex(foundlistinfav)
                        
                    }

                    
                } else if UserLists[indexPathFav.row].listtype == "ToDo" {
                    
                    let queryfav1 = PFQuery(className:"toDoLists")

                    queryfav1.fromLocalDatastore()
                    queryfav1.whereKey("listUUID", equalTo: listfromfav!)

                    queryfav1.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = false
                            todoList.pinInBackground()

                            
                            UserLists[indexPathFav.row].listisfavourite = false
                            
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }

                    if let foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserToDoLists[foundtodolist].listisfavourite = false
                    }
                    

                    if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserFavLists.removeAtIndex(foundlistinfav)
                        
                    }


                }
                
                //notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
               // cell.addToFavOutlet.imageForState(.Normal).
                
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                
                
            } else {
                //add to favs
                
                pause()
                
                if UserLists[indexPathFav.row].listtype == "Shop" {
                    
                    let queryfav = PFQuery(className:"shopLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = true
                            shopList.pinInBackground()

                            
                            UserLists[indexPathFav.row].listisfavourite = true
                            
                            
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        
                    }

                    
                     if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                        UserShopLists[foundshoplist].listisfavourite = true
                        UserFavLists.append(UserShopLists[foundshoplist])
                    }
                    
                    
                    
                } else if UserLists[indexPathFav.row].listtype == "ToDo" {
                    
                    let queryfav1 = PFQuery(className:"toDoLists")

                    queryfav1.fromLocalDatastore()
                    queryfav1.whereKey("listUUID", equalTo: listfromfav!)

                    queryfav1.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = true
                            todoList.pinInBackground()
                            // shopList.saveInBackground()
                           // todoList.saveEventually()
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = true
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }

                    if let foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                            UserToDoLists[foundtodolist].listisfavourite = true
                            UserFavLists.append(UserToDoLists[foundtodolist])
                        }
                }
                
                //favimage = UIImage(named: "ICFavStarActive") as UIImage!
                //cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
            }

            
            //////END ALL
        }
            
            /////// SHOPS ONLY
        else if showoption == "shoplists" {
             listfromfav = UserShopLists[indexPathFav.row].listid
            
            
            
            if UserShopLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()

                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserLists[foundshoplist].listisfavourite = false
                }

                if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserFavLists.removeAtIndex(foundlistinfav)
                    
                }

                    
                    let queryfav = PFQuery(className:"shopLists")

                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = false
                            shopList.pinInBackground()

                            
                            UserShopLists[indexPathFav.row].listisfavourite = false
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                       
                        
                    }
                    
               // } else if UserShopLists[indexPathFav!.row].listtype == "ToDo"
                
               // notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                
            } else {
                //add to favs
                
                 pause()

                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserLists[foundshoplist].listisfavourite = true
                    UserFavLists.append(UserLists[foundshoplist])
                }

                    let queryfav = PFQuery(className:"shopLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = true
                            shopList.pinInBackground()
                            // shopList.saveInBackground()
                            //shopList.saveEventually()
                            
                            
                            
                            UserShopLists[indexPathFav.row].listisfavourite = true
                            
                            
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()

                        
                    }

                
                //favimage = UIImage(named: "ICFavStarActive") as UIImage!
               // cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
            }
            ////// END SHOPS ONLY
            
        }
        else if showoption == "todolists" {
             listfromfav = UserToDoLists[indexPathFav.row].listid
            
            ///// TO DO ONLY
            
            if UserToDoLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()

                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserLists[foundshoplist].listisfavourite = false
                }

                if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserFavLists.removeAtIndex(foundlistinfav)
                    
                }

                    
                    let queryfav = PFQuery(className:"toDoLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = false
                            todoList.pinInBackground()

                            
                            UserToDoLists[indexPathFav.row].listisfavourite = false
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }

                
                //notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                
            } else {
                //add to favs
                
                pause()

                if let foundtodolist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserLists[foundtodolist].listisfavourite = true
                    UserFavLists.append(UserLists[foundtodolist])
                }
                
                    
                    let queryfav1 = PFQuery(className:"toDoLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.fromLocalDatastore()
                    queryfav1.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = true
                            todoList.pinInBackground()

                            
                            UserToDoLists[indexPathFav.row].listisfavourite = true
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }
                    
                    
                
                
               // favimage = UIImage(named: "ICFavStarActive") as UIImage!
               // cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
            }

            
            ///// END TO DO ONLY
            
            
        }
        

        
        
    }
    
    /*
    func adddeletereceivedfav(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ReceivedListOld
        let indexPathFav = tableView.indexPathForCell(cell)
       */
        //listfromfav = ListsIds[indexPathFav!.row]
    func adddeletereceivedfav(indexPathFav: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPathFav) as! ReceivedListOld
    
        if showoption == "alllists" {
            listfromfav = UserLists[indexPathFav.row].listid
            
            //////ALL
            
            if UserLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()
                if UserLists[indexPathFav.row].listtype == "Shop" {
                    
                    let queryfav = PFQuery(className:"shopLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = false
                            shopList.pinInBackground()
                            // shopList.saveInBackground()
                            //shopList.saveEventually()
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = false
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }
                    
                    //if let foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listfromfav!) {
                    if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                        UserShopLists[foundshoplist].listisfavourite = false
                    }
                    
                    //if let foundlistinfav = find(lazy(UserFavLists).map({ $0.listid }), listfromfav!) {
                     if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserFavLists.removeAtIndex(foundlistinfav)
                        
                    }

                    
                } else if UserLists[indexPathFav.row].listtype == "ToDo" {
                    
                    let queryfav1 = PFQuery(className:"toDoLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.fromLocalDatastore()
                    queryfav1.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = false
                            todoList.pinInBackground()
                            // shopList.saveInBackground()
                           // todoList.saveEventually()
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = false
                            
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }
                    
                  //  if let foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listfromfav!) {
                    if let foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {

                    UserToDoLists[foundtodolist].listisfavourite = false
                    }
                    
                    //if let foundlistinfav = find(lazy(UserFavLists).map({ $0.listid }), listfromfav!) {
                    if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserFavLists.removeAtIndex(foundlistinfav)
                        
                    }
                    
                }
                
               // notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                cell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                
                
                
            } else {
                //add to favs
                
                pause()
                
                if UserLists[indexPathFav.row].listtype == "Shop" {
                    
                    let queryfav = PFQuery(className:"shopLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.fromLocalDatastore()
                    queryfav.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav.getFirstObjectInBackgroundWithBlock() {
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let shopList = shopList {
                            shopList["isFavourite"] = true
                            shopList.pinInBackground()
                            // shopList.saveInBackground()
                           // shopList.saveEventually()
                            
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = true
                            
                            
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }
                    
                   // if let foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listfromfav!) {
                    if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                        UserShopLists[foundshoplist].listisfavourite = true
                        UserFavLists.append(UserShopLists[foundshoplist])
                    }
                    
                } else if UserLists[indexPathFav.row].listtype == "ToDo" {
                    
                    let queryfav1 = PFQuery(className:"toDoLists")
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.fromLocalDatastore()
                    queryfav1.whereKey("listUUID", equalTo: listfromfav!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    queryfav1.getFirstObjectInBackgroundWithBlock() {
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                            self.restore()
                        } else if let todoList = todoList {
                            todoList["isFavourite"] = true
                            todoList.pinInBackground()
                            // shopList.saveInBackground()
                           // todoList.saveEventually()
                            
                            
                            UserLists[indexPathFav.row].listisfavourite = true
                            
                            
                            self.restore()
                        }
                        self.tableView.reloadData()
                        //self.listsretrieval()
                        
                    }
                    
                   // if let foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listfromfav!) {
                    if let foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                        UserToDoLists[foundtodolist].listisfavourite = true
                        UserFavLists.append(UserToDoLists[foundtodolist])
                    }
                }
                
               // favimage = UIImage(named: "ICFavStarActive") as UIImage!
               // cell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                cell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
            }
            
            
            //////END ALL
        }
            
            /////// SHOPS ONLY
        else if showoption == "shoplists" {
            listfromfav = UserShopLists[indexPathFav.row].listid
            
            
            
            if UserShopLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()
                
                //if let foundshoplist = find(lazy(UserLists).map({ $0.listid }), listfromfav!) {
                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {

                UserLists[foundshoplist].listisfavourite = false
                }
                
                //if let foundlistinfav = find(lazy(UserFavLists).map({ $0.listid }), listfromfav!) {
                if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserFavLists.removeAtIndex(foundlistinfav)
                    
                }

                
                
                // if UserShopLists[indexPathFav!.row].listtype == "Shop" {
                
                let queryfav = PFQuery(className:"shopLists")
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.fromLocalDatastore()
                queryfav.whereKey("listUUID", equalTo: listfromfav!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.getFirstObjectInBackgroundWithBlock() {
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                        self.restore()
                    } else if let shopList = shopList {
                        shopList["isFavourite"] = false
                        shopList.pinInBackground()
                        // shopList.saveInBackground()
                      //  shopList.saveEventually()
                        
                        
                        UserShopLists[indexPathFav.row].listisfavourite = false
                        
                        
                        self.restore()
                    }
                    self.tableView.reloadData()
                    
                    
                }
                
                // } else if UserShopLists[indexPathFav!.row].listtype == "ToDo"
                
               // notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                
                cell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                
                
            } else {
                //add to favs
                
                pause()
                
                //if let foundshoplist = find(lazy(UserLists).map({ $0.listid }), listfromfav!) {
                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                
                    UserLists[foundshoplist].listisfavourite = true
                    UserFavLists.append(UserLists[foundshoplist])
                }
                
                
                
                //  if UserShopLists[indexPathFav!.row].listtype == "Shop" {
                
                let queryfav = PFQuery(className:"shopLists")
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.fromLocalDatastore()
                queryfav.whereKey("listUUID", equalTo: listfromfav!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.getFirstObjectInBackgroundWithBlock() {
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                        self.restore()
                    } else if let shopList = shopList {
                        shopList["isFavourite"] = true
                        shopList.pinInBackground()
                        // shopList.saveInBackground()
                        //shopList.saveEventually()
                        
                        
                        
                        UserShopLists[indexPathFav.row].listisfavourite = true
                        
                        
                        
                        
                        self.restore()
                    }
                    self.tableView.reloadData()
                    //self.listsretrieval()
                    
                }
                
                //  } else if UserShopLists[indexPathFav!.row].listtype == "ToDo"
                
               // favimage = UIImage(named: "ICFavStarActive") as UIImage!
               // cell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                cell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
            }
            ////// END SHOPS ONLY
            
        }
        else if showoption == "todolists" {
            listfromfav = UserToDoLists[indexPathFav.row].listid
            
            ///// TO DO ONLY
            
            if UserToDoLists[indexPathFav.row].listisfavourite == true {
                //delete from favs
                
                pause()
                
               // if let foundshoplist = find(lazy(UserLists).map({ $0.listid }), listfromfav!) {
                
                if let foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserLists[foundshoplist].listisfavourite = false
                }
                
                //if let foundlistinfav = find(lazy(UserFavLists).map({ $0.listid }), listfromfav!) {
                 if let foundlistinfav = UserFavLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                UserFavLists.removeAtIndex(foundlistinfav)
                    
                }

                
                
                //  if UserToDoLists[indexPathFav!.row].listtype == "Shop" {
                
                let queryfav = PFQuery(className:"toDoLists")
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.fromLocalDatastore()
                queryfav.whereKey("listUUID", equalTo: listfromfav!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav.getFirstObjectInBackgroundWithBlock() {
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                        self.restore()
                    } else if let todoList = todoList {
                        todoList["isFavourite"] = false
                        todoList.pinInBackground()
                        // shopList.saveInBackground()
                       // todoList.saveEventually()
                        
                        
                        UserToDoLists[indexPathFav.row].listisfavourite = false
                        
                        
                        self.restore()
                    }
                    self.tableView.reloadData()
                    //self.listsretrieval()
                    
                }
                
                //  } else if UserToDoLists[indexPathFav!.row].listtype == "ToDo"
                
               // notfavimage = UIImage(named: "ICFavStar") as UIImage!
               // cell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                cell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                
                
            } else {
                //add to favs
                
                pause()
                
               // if let foundtodolist = find(lazy(UserLists).map({ $0.listid }), listfromfav!) {
                
                 if let foundtodolist = UserLists.map({ $0.listid }).lazy.indexOf(listfromfav!) {
                    UserLists[foundtodolist].listisfavourite = true
                    UserFavLists.append(UserLists[foundtodolist])
                }
                
                //else if UserToDoLists[indexPathFav!.row].listtype == "ToDo" {
                
                let queryfav1 = PFQuery(className:"toDoLists")
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav1.fromLocalDatastore()
                queryfav1.whereKey("listUUID", equalTo: listfromfav!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                queryfav1.getFirstObjectInBackgroundWithBlock() {
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                        self.restore()
                    } else if let todoList = todoList {
                        todoList["isFavourite"] = true
                        todoList.pinInBackground()
                        // shopList.saveInBackground()
                        //todoList.saveEventually()
                        
                        
                        UserToDoLists[indexPathFav.row].listisfavourite = true
                        
                        
                        self.restore()
                    }
                    self.tableView.reloadData()
                    //self.listsretrieval()
                    
                }
                
                
                
                
               // favimage = UIImage(named: "ICFavStarActive") as UIImage!
               // cell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                cell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
            }
            
            
            ///// END TO DO ONLY
            
            
        }
        
        
        
        
    }
    
    
    /*
    func saveImageLocally(imageData:NSData!) -> String {
        var uuid = NSUUID().UUIDString
        //let time =  NSDate().timeIntervalSince1970
        let fileManager = NSFileManager.defaultManager()
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] 
        //.stringByAppendingPathComponent(subDirForImage) as String
        
        if !fileManager.fileExistsAtPath(dir) {
            var error: NSError?
            if !fileManager.createDirectoryAtPath(dir, withIntermediateDirectories: true, attributes: nil, error: &error) {
                print("Unable to create directory: \(error)")
                return ""
            }
        }
        
        let pathToSaveImage = dir.stringByAppendingPathComponent("item\(uuid).png")
        //("item\(Int(time)).png")
        
        imageData.writeToFile(pathToSaveImage, atomically: true)
        
        imagePath = "item\(uuid).png"
        
        return imagePath//"item\(Int(time)).png"
    }
    */
    
    func savingtodoitems(shopListItemsIn1: [String]) {
        
        //for var index = 0; index < ItemsInReceivedList.count; index++ {
        for var index = 0; index < shopListItemsIn1.count; index++ {
            var queryitem = PFQuery(className:"toDoItems")
            // queryitem.whereKey("objectId", equalTo: shopListItemsIn1[index])
            queryitem.whereKey("itemUUID", equalTo: shopListItemsIn1[index])
            queryitem.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                if error == nil {
                    print("Successfully retrieved \(objects!.count) scores.")
                    
                    if let listitems = objects as? [PFObject] {
                        
                        for object in listitems {
                            print(object.objectId)
                            
                            object.pin()//InBackground()
     
                        }
                        
                    }
                    
                } else {
                    // Log details of the failure
                    self.restoresaving()
                    print("Error: \(error!) \(error!.userInfo)")
                    print("BITCH DOESNT WORK")
                }
            }
            
        } //end of for loop
        
        ////
        
    }
    
    
    func saveImageLocally(imageData:NSData!) -> String {
        var uuid = NSUUID().UUIDString
        //let time =  NSDate().timeIntervalSince1970
        let fileManager = NSFileManager.defaultManager()
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        //.stringByAppendingPathComponent(subDirForImage) as String
        
        if !fileManager.fileExistsAtPath(dir) {
            do{
                try NSFileManager.defaultManager().createDirectoryAtPath(dir, withIntermediateDirectories: false, attributes: [:])
            } catch {
                print("Error creating SwiftData image folder")
                imagePath = ""
                return imagePath//""
            }
        }
        
        let pathToSaveImage = (dir as NSString).stringByAppendingPathComponent("item\(uuid).png")
        //("item\(Int(time)).png")
        
        imageData.writeToFile(pathToSaveImage, atomically: true)
        
        imagePath = "item\(uuid).png"
        
        return imagePath//"item\(Int(time)).png"
    }
    
    var imageToLoad = UIImage()
    /*
    func loadImageFromLocalStore(imageName: String) -> UIImage {
        let fileManager = NSFileManager.defaultManager()
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        let path = (dir as NSString).stringByAppendingPathComponent(imageName)
        
        if(!path.isEmpty){
            let image = UIImage(contentsOfFile: path)
            print(image);
            if(image != nil){
                //return image!;
                self.imageToLoad = image!
                return imageToLoad
            }
        }
        
        return imagestochoose[0].itemimage//UIImage(named: "activity.png")!
    }
    */
    
    func loadImageFromLocalStore(imageName: String) -> UIImage {
        let fileManager = NSFileManager.defaultManager()
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        //try for ios9.2
        let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(imageName)
        
        // if(!path.isEmpty){
        if path != "" {
            
            let data = NSData(contentsOfURL:path)
            if (data != nil) {
                let image = UIImage(data:data!)
                //}
                print(image);
                if(image != nil){
                    //return image!;
                    self.imageToLoad = image!
                    // return imageToLoad
                } else {
                    self.imageToLoad = imagestochoose[0].itemimage
                }
                
            } else {
                self.imageToLoad = imagestochoose[0].itemimage
            }
            
        } else {
            self.imageToLoad = imagestochoose[0].itemimage
        }
        
        return imageToLoad
    }


    
    
    func changinglistimages(shopListItemsIn1: [String]) {
        // this name means nothing, func only save all items to local datastore
       // pausesaving()
        //for var index = 0; index < ItemsInReceivedList.count; index++ {
        for var index = 0; index < shopListItemsIn1.count; index++ {
            var queryitem = PFQuery(className:"shopItems")
            // queryitem.whereKey("objectId", equalTo: shopListItemsIn1[index])
            queryitem.whereKey("itemUUID", equalTo: shopListItemsIn1[index])
            queryitem.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                if error == nil {
                    print("Successfully retrieved \(objects!.count) scores.")
                    
                    if let listitems = objects as? [PFObject] {
                        
                        for object in listitems {
                            print(object.objectId)
                            
                            //bitch
                            
                            if var imageFile = object["itemImage"] as? PFFile {
                                // if imageFile != nil {
                                var imageData = imageFile.getData()
                                /*
                                if (imageData != nil) {
                                    var image = UIImage(data: imageData!)
                                    thiscatpicture = image!
                                    
                                } else {
                                    thiscatpicture = imagestochoose[0].itemimage
                                }
                            } else {
                                thiscatpicture = imagestochoose[0].itemimage
                            }
                            */
                            self.saveImageLocally(imageData)
                                
                                object["imageLocalPath"] = self.imagePath
                            }
                            //self.saveImageLocally(imageData)
                                object.pin()  //InBackground()


                        }
                        //self.restoresaving()
                    }
                    
                } else {
                    // Log details of the failure
                    self.restoresaving()
                    print("Error: \(error!) \(error!.userInfo)")
                    print("BITCH DOESNT WORK")
                }
            }
            
        } //end of for loop
        
        ////
        
    }
    
    func newsavereceivedlist(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ReceivedListOld
        
        let indexPathSave = tableView.indexPathForCell(cell)
        
        if showoption == "alllists" {
            
            pausesaving()
            
            listtosave = UserLists[indexPathSave!.row].listid
            
            UserLists[indexPathSave!.row].listissaved = true
            UserLists[indexPathSave!.row].listconfirmreception = true
            
            if UserLists[indexPathSave!.row].listtype == "Shop" {
                
                
            //if let foundlist = find(lazy(UserShopLists).map({ $0.listid }), listtosave!) {
              if let foundlist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtosave!) {
                UserShopLists[foundlist].listissaved = true
                UserShopLists[foundlist].listconfirmreception = true
                }
                
                 cell.receivedlistnamebutton.enabled = true
                
                //// now change in local datastore
                
                let querysave = PFQuery(className:"shopLists")
                querysave.whereKey("listUUID", equalTo: listtosave!)
                querysave.getFirstObjectInBackgroundWithBlock() {
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        self.ItemsInReceivedList = shopList["ItemsInTheShopList"] as! [String]
                        
                        print("List to load for changing \(self.ItemsInReceivedList)")
                        
                        self.changinglistimages(self.ItemsInReceivedList)
                        
                        shopList["isSaved"] = true
                        
                        /////////
                        
                        cell.receivedlistnamebutton.enabled = true
                        
                        shopList["confirmReception"] = true // WTF, I already had isSaved!
                        
                        
                        var receiverUser = UserLists[indexPathSave!.row].listreceivedfrom[0]
                        
                        
                        var currentusername = String()
                        ///
                        
                        
                        if PFUser.currentUser()?["name"] != nil {
                            currentusername = PFUser.currentUser()?["name"] as! String
                        } else {
                            currentusername = NSLocalizedString("AnonUser", comment: "")
                        }
                        
                        
                        /////////
                        
                        //shopList.pinInBackground()
                        self.restoresaving()
                        shopList.pinInBackgroundWithBlock({ (success, error) -> Void in
                            if success {
                                self.restoresaving()

                                let userQuery = PFUser.query()
                                userQuery!.whereKey("objectId", equalTo: receiverUser)
                                let pushQuery = PFInstallation.query()
                                pushQuery!.whereKey("user", matchesQuery: userQuery!)
                                var push:PFPush = PFPush()
                                push.setQuery(pushQuery)
                                NSLocalizedString("listwassent", comment: "")
                                var alert : String = "\(currentusername) \(NSLocalizedString("listwasaccepted", comment: ""))"
                                var data:NSDictionary = ["alert":alert,"badge":"Increment", "sound":"default"]
                                push.setData(data as [NSObject : AnyObject])
                                push.sendPushInBackground()

                            } else {
                                print("Failed!")
                            }
                        })
                        
                        
                        
                        shopList.saveEventually()
                        // shopList.saveInBackground()
                        //shopList.saveEventually()
                    }
                    //self.listsretrieval()
                    
                }
                
                tableView.reloadData()
                
                receivedshopscount -= 1
                
                //// end of changing in local datastore
                
            } else if UserLists[indexPathSave!.row].listtype == "ToDo" {
                
            //if let foundlist = find(lazy(UserToDoLists).map({ $0.listid }), listtosave!) {
                if let foundlist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtosave!) {
                    UserToDoLists[foundlist].listissaved = true
                    UserToDoLists[foundlist].listconfirmreception = true
                }
                
                 cell.receivedlistnamebutton.enabled = true
                
                let querysave = PFQuery(className:"toDoLists")
                querysave.whereKey("listUUID", equalTo: listtosave!)
                querysave.getFirstObjectInBackgroundWithBlock() {
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let todoList = todoList {
                        
                        todoList["isSaved"] = true
                        
                        cell.receivedlistnamebutton.enabled = true
                        
                        self.ItemsInReceivedList = todoList["ItemsInTheToDoList"] as! [String]
                        
                        self.savingtodoitems(self.ItemsInReceivedList)
                        
                        todoList["confirmReception"] = true // WTF, I already had isSaved!
                        
                        self.restoresaving()
                        
                        var receiverUser = UserLists[indexPathSave!.row].listreceivedfrom[0]
                        
                        
                        var currentusername = String()
                        ///
                        
                        
                        if PFUser.currentUser()?["name"] != nil {
                            currentusername = PFUser.currentUser()?["name"] as! String
                        } else {
                            currentusername = NSLocalizedString("AnonUser", comment: "")
                        }
                        
                        
                        
                        todoList.pinInBackgroundWithBlock({ (success, error) -> Void in
                            if success {
                                self.restoresaving()
                                
                                let userQuery = PFUser.query()
                                userQuery!.whereKey("objectId", equalTo: receiverUser)
                                let pushQuery = PFInstallation.query()
                                pushQuery!.whereKey("user", matchesQuery: userQuery!)
                                var push:PFPush = PFPush()
                                push.setQuery(pushQuery)
                                NSLocalizedString("listwassent", comment: "")
                                var alert : String = "\(currentusername) \(NSLocalizedString("listwasaccepted", comment: ""))"
                                var data:NSDictionary = ["alert":alert,"badge":"Increment", "sound":"default"]
                                push.setData(data as [NSObject : AnyObject])
                                push.sendPushInBackground()
                            } else {
                                print("Failed!")
                            }
                        })
                        
                        
                        
                        todoList.saveEventually()
                        // shopList.saveInBackground()
                        //shopList.saveEventually()
                    }
                    //self.listsretrieval()
                    
                }
                
                tableView.reloadData()
                
                 receivedtodocount -= 1
            }
            
        }
        else if showoption == "shoplists" {
            
            
            pausesaving()
            
            listtosave = UserShopLists[indexPathSave!.row].listid
            
            UserShopLists[indexPathSave!.row].listissaved = true
            UserShopLists[indexPathSave!.row].listconfirmreception = true
            
           // if let foundlist = find(lazy(UserLists).map({ $0.listid }), listtosave!) {
             if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(listtosave!) {
            UserLists[foundlist].listissaved = true
                UserLists[foundlist].listconfirmreception = true
            }
            
             cell.receivedlistnamebutton.enabled = true
            
            //// now change in local datastore
            
            let querysave = PFQuery(className:"shopLists")
            querysave.whereKey("listUUID", equalTo: listtosave!)
            querysave.getFirstObjectInBackgroundWithBlock() {
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    self.ItemsInReceivedList = shopList["ItemsInTheShopList"] as! [String]
                    
                    print("List to load for changing \(self.ItemsInReceivedList)")
                    
                    self.changinglistimages(self.ItemsInReceivedList)
                    
                    shopList["isSaved"] = true
                    
                    /////////
                    
                    cell.receivedlistnamebutton.enabled = true
                    
                    shopList["confirmReception"] = true // WTF, I already had isSaved!
                    
                    
                    /////////
                    
                    //shopList.pinInBackground()
                    var receiverUser = UserShopLists[indexPathSave!.row].listreceivedfrom[0]
                    
                    
                    var currentusername = String()
                    ///
                    
                    
                    if PFUser.currentUser()?["name"] != nil {
                        currentusername = PFUser.currentUser()?["name"] as! String
                    } else {
                        currentusername = NSLocalizedString("AnonUser", comment: "")
                    }
                    
                    
                    
                    shopList.pinInBackgroundWithBlock({ (success, error) -> Void in
                        if success {
                            self.restoresaving()
                            let userQuery = PFUser.query()
                            userQuery!.whereKey("objectId", equalTo: receiverUser)
                            let pushQuery = PFInstallation.query()
                            pushQuery!.whereKey("user", matchesQuery: userQuery!)
                            var push:PFPush = PFPush()
                            push.setQuery(pushQuery)
                            NSLocalizedString("listwassent", comment: "")
                            var alert : String = "\(currentusername) \(NSLocalizedString("listwasaccepted", comment: ""))"
                            var data:NSDictionary = ["alert":alert,"badge":"Increment", "sound":"default"]
                            push.setData(data as [NSObject : AnyObject])
                            push.sendPushInBackground()
                        } else {
                            print("Failed!")
                        }
                    })
                    
                    
                    
                    shopList.saveEventually()
                    // shopList.saveInBackground()
                    //shopList.saveEventually()
                }
                //self.listsretrieval()
                
            }
            
            tableView.reloadData()
            
            receivedshopscount -= 1
            
        }
        else if showoption == "todolists" {
            
            pausesaving()
            
            listtosave = UserToDoLists[indexPathSave!.row].listid

            UserToDoLists[indexPathSave!.row].listissaved = true
            UserToDoLists[indexPathSave!.row].listconfirmreception = true
            
           // if let foundlist = find(lazy(UserLists).map({ $0.listid }), listtosave!) {
            if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(listtosave!) {
            UserLists[foundlist].listissaved = true
                UserLists[foundlist].listconfirmreception = true
            }

            cell.receivedlistnamebutton.enabled = true
            
            let querysave = PFQuery(className:"toDoLists")
            querysave.whereKey("listUUID", equalTo: listtosave!)
            querysave.getFirstObjectInBackgroundWithBlock() {
                (todoList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let todoList = todoList {
                    
                    self.ItemsInReceivedList = todoList["ItemsInTheToDoList"] as! [String]
                    
                    self.savingtodoitems(self.ItemsInReceivedList)
                    
                    todoList["isSaved"] = true
                    
                    cell.receivedlistnamebutton.enabled = true
                    
                    todoList["confirmReception"] = true // WTF, I already had isSaved!
                    
                    
                    var receiverUser = UserToDoLists[indexPathSave!.row].listreceivedfrom[0]
                    
                    
                    var currentusername = String()
                    ///
                    
                    
                    if PFUser.currentUser()?["name"] != nil {
                        currentusername = PFUser.currentUser()?["name"] as! String
                    } else {
                        currentusername = NSLocalizedString("AnonUser", comment: "")
                    }
                    
                    
                    
                    todoList.pinInBackgroundWithBlock({ (success, error) -> Void in
                        if success {
                            self.restoresaving()
                            let userQuery = PFUser.query()
                            userQuery!.whereKey("objectId", equalTo: receiverUser)
                            let pushQuery = PFInstallation.query()
                            pushQuery!.whereKey("user", matchesQuery: userQuery!)
                            var push:PFPush = PFPush()
                            push.setQuery(pushQuery)
                            NSLocalizedString("listwassent", comment: "")
                            var alert : String = "\(currentusername) \(NSLocalizedString("listwasaccepted", comment: ""))"
                            var data:NSDictionary = ["alert":alert,"badge":"Increment", "sound":"default"]
                            push.setData(data as [NSObject : AnyObject])
                            push.sendPushInBackground()
                        } else {
                            print("Failed!")
                        }
                    })
                    
                    
                    
                    todoList.saveEventually()
                    // shopList.saveInBackground()
                    //shopList.saveEventually()
                }
                //self.listsretrieval()
                
            }

            tableView.reloadData()
            
            receivedtodocount -= 1
            
        }
        
        receivedcount -= 1
        

        cell.addtofavs.hidden = false
        
        cell.acceptlist.hidden = true
        cell.acceptlabel.hidden = true
        
        
        
        
        
    }


    
    func newdeletereceivedlist(sender: UIButton!) {
        
        // pausedeleting()
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        //let cell = innerview.superview as! ShopListCellNew
        let cell = innerview.superview as! ReceivedListOld
        let indexPathDelete = tableView.indexPathForCell(cell)
        print(indexPathDelete)
        
        if showoption == "alllists" {
            //ALLLISTS
            
            listtodelete = UserLists[indexPathDelete!.row].listid
            
            // UserLists.removeAtIndex(indexPathDelete!.row)
            
            if UserLists[indexPathDelete!.row].listtype == "Shop" {
                //Alllists. If shoplist
                
                
               // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                
                if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserShopLists.removeAtIndex(foundshoplist)
                }
                //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                //    UserToDoLists.removeAtIndex(foundtodolist)
                // }
                
                
                
                var query2 = PFQuery(className:"shopLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        shopList.unpinInBackground()
                        
                        
                    }
                    
                }
                
                // set to deleted in Parse
                var query = PFQuery(className:"shopLists")
                query.fromLocalDatastore()
                // query.getObjectInBackgroundWithId(self.listtodelete!) {
                query.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query.getFirstObjectInBackgroundWithBlock() {
                    
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        //shopList.deleteInBackground()
                        shopList["isDeleted"] = true
                        shopList.saveEventually()
                        
                    }
                    
                }

                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"shopItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
                                    
                                    // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                        
                                        object["isDeleted"] = true
                                        
                                        object.unpinInBackground()
                                        
                                      //  object.saveEventually()
                                        
                                    }
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch

                
            } else if UserLists[indexPathDelete!.row].listtype == "ToDo" {
                // Alllists. If To do
                
                // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                //   UserShopLists.removeAtIndex(foundshoplist)
                //}
               // if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                    UserToDoLists.removeAtIndex(foundtodolist)
                }
                
                
                
                var query2 = PFQuery(className:"toDoLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let todoList = todoList {
                        
                        todoList.unpinInBackground()
                        
                        
                    }
                    
                }
                
                //First set to deleted in Parse
                var query = PFQuery(className:"toDoLists")
                query.fromLocalDatastore()
                // query.getObjectInBackgroundWithId(self.listtodelete!) {
                query.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query.getFirstObjectInBackgroundWithBlock() {
                    
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let todoList = todoList {
                        
                        //shopList.deleteInBackground()
                        todoList["isDeleted"] = true
                       //// todoList.saveEventually()
                        
                    }
                    
                }
                ////

                
                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"toDoItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
                                    
                               
                                        
                                        object["isDeleted"] = true
                                        
                                        object.unpinInBackground()
                                        
                                      //  object.saveEventually()
                                        
                                    
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch

                
                
            }
            
            UserLists.removeAtIndex(indexPathDelete!.row)
            
            
            
        } else if showoption == "shoplists" {
            //SHOPLISTS
            
            listtodelete = UserShopLists[indexPathDelete!.row].listid
            
            UserShopLists.removeAtIndex(indexPathDelete!.row)
            
            //Alllists. If shoplist
            
            
            //if var foundshoplist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
             if var foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserLists.removeAtIndex(foundshoplist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            //    UserToDoLists.removeAtIndex(foundtodolist)
            // }
            
            
            
            var query2 = PFQuery(className:"shopLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
        
                    ////
                    
                    shopList.unpinInBackground()
                    
                    
                }
                
            }
            
            //First set to deleted in Parse
            var query = PFQuery(className:"shopLists")
            query.fromLocalDatastore()
            // query.getObjectInBackgroundWithId(self.listtodelete!) {
            query.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    //shopList.deleteInBackground()
                    shopList["isDeleted"] = true
                  //  shopList.saveEventually()
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                   // object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch

            
            
        } else if showoption == "todolists" {
            //TODOLISTS
            
            listtodelete = UserToDoLists[indexPathDelete!.row].listid
            
            UserToDoLists.removeAtIndex(indexPathDelete!.row)
            
            //if var foundtodolist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            
            if var foundtodolist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserLists.removeAtIndex(foundtodolist)
            }
            
            
            
            var query2 = PFQuery(className:"toDoLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (todoList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let todoList = todoList {
                    
                
                    ////
                    
                    todoList.unpinInBackground()
                    
                    
                }
                
            }
            
            //First set to deleted in Parse
            var query = PFQuery(className:"toDoLists")
            query.fromLocalDatastore()
            // query.getObjectInBackgroundWithId(self.listtodelete!) {
            query.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query.getFirstObjectInBackgroundWithBlock() {
                
                (todoList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let todoList = todoList {
                    
                    //shopList.deleteInBackground()
                    todoList["isDeleted"] = true
                   //// todoList.saveEventually()
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"toDoItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                             
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                   // object.saveEventually()
                                    
                                
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch

            
            
        } else if showoption == "favs" {
            //SHOPLISTS
            
            listtodelete = UserFavLists[indexPathDelete!.row].listid
            
            UserFavLists.removeAtIndex(indexPathDelete!.row)
            
            //Alllists. If shoplist
            
            
            //if var foundlist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            if var foundlist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                
            UserLists.removeAtIndex(foundlist)
            }
            
           // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
            if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserShopLists.removeAtIndex(foundshoplist)
            }
           // if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserToDoLists.removeAtIndex(foundtodolist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            //    UserToDoLists.removeAtIndex(foundtodolist)
            // }
            
            
            
            var query2 = PFQuery(className:"shopLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"shopLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let shopList = shopList {
                            
                            //shopList.deleteInBackground()
                            shopList["isDeleted"] = true
                           // shopList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    shopList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                  //  object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        }

        
        
        self.tableView.deleteRowsAtIndexPaths([indexPathDelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
        self.tableView.reloadData()
        
    }
    
    
    func newdeletelist(sender: UIButton!) {
        
       // pausedeleting()
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
       // let cell = view.superview as! ShopListCellNew
        let indexPathDelete = tableView.indexPathForCell(cell)
        print(indexPathDelete)
        
        if showoption == "alllists" {
            //ALLLISTS
            
            listtodelete = UserLists[indexPathDelete!.row].listid
            
           // UserLists.removeAtIndex(indexPathDelete!.row)
            
            if UserLists[indexPathDelete!.row].listtype == "Shop" {
                //Alllists. If shoplist
                
                
               // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                
                if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserShopLists.removeAtIndex(foundshoplist)
                }
                //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                //    UserToDoLists.removeAtIndex(foundtodolist)
               // }
                

                
                var query2 = PFQuery(className:"shopLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        //First set to deleted in Parse
                        var query = PFQuery(className:"shopLists")
                        query.fromLocalDatastore()
                        // query.getObjectInBackgroundWithId(self.listtodelete!) {
                        query.whereKey("listUUID", equalTo: self.listtodelete!)
                        // queryfav.getObjectInBackgroundWithId(listtofav!) {
                        query.getFirstObjectInBackgroundWithBlock() {
                            
                            (shopList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let shopList = shopList {
                                
                                //shopList.deleteInBackground()
                                shopList["isDeleted"] = true
                              //  shopList.saveEventually()
                                
                            }
                            
                        }
                        ////
                        
                        shopList.unpinInBackground()
                        
                        
                    }
                    
                }

                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"shopItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
                                    
                                    // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                        
                                        object["isDeleted"] = true
                                        
                                        object.unpinInBackground()
                                        
                                      //  object.saveEventually()
                                        
                                    }
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch

                
                
            } else if UserLists[indexPathDelete!.row].listtype == "ToDo" {
                // Alllists. If To do
                
               // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                 //   UserShopLists.removeAtIndex(foundshoplist)
                //}
              //  if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                
                if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserToDoLists.removeAtIndex(foundtodolist)
                 }
                
                
                
                var query2 = PFQuery(className:"toDoLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let todoList = todoList {
                        
                        //First set to deleted in Parse
                        var query = PFQuery(className:"toDoLists")
                        query.fromLocalDatastore()
                        // query.getObjectInBackgroundWithId(self.listtodelete!) {
                        query.whereKey("listUUID", equalTo: self.listtodelete!)
                        // queryfav.getObjectInBackgroundWithId(listtofav!) {
                        query.getFirstObjectInBackgroundWithBlock() {
                            
                            (todoList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let todoList = todoList {
                                
                                //shopList.deleteInBackground()
                                todoList["isDeleted"] = true
                               // todoList.saveEventually()
                                
                            }
                            
                        }
                        ////
                        
                        todoList.unpinInBackground()
                        
                        
                    }
                    
                }
                
                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"toDoItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
    
                                        
                                        object["isDeleted"] = true
                                        
                                        object.unpinInBackground()
                                        
                                     //   object.saveEventually()
                                        
                                    
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch

                
            }
            
            UserLists.removeAtIndex(indexPathDelete!.row)
            
        } else if showoption == "shoplists" {
            //SHOPLISTS
            
            listtodelete = UserShopLists[indexPathDelete!.row].listid
            
            UserShopLists.removeAtIndex(indexPathDelete!.row)
            
                //Alllists. If shoplist
                
                
               // if var foundshoplist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            if var foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserLists.removeAtIndex(foundshoplist)
                }
                //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                //    UserToDoLists.removeAtIndex(foundtodolist)
                // }
                
                
                
                var query2 = PFQuery(className:"shopLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        //First set to deleted in Parse
                        var query = PFQuery(className:"shopLists")
                        query.fromLocalDatastore()
                        // query.getObjectInBackgroundWithId(self.listtodelete!) {
                        query.whereKey("listUUID", equalTo: self.listtodelete!)
                        // queryfav.getObjectInBackgroundWithId(listtofav!) {
                        query.getFirstObjectInBackgroundWithBlock() {
                            
                            (shopList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let shopList = shopList {
                                
                                //shopList.deleteInBackground()
                                shopList["isDeleted"] = true
                               // shopList.saveEventually()
                                
                            }
                            
                        }
                        ////
                        
                        shopList.unpinInBackground()
                        
                        
                    }
                    
                }
                
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                 //   object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        } else if showoption == "todolists" {
            //TODOLISTS
            
            listtodelete = UserToDoLists[indexPathDelete!.row].listid
            
            UserToDoLists.removeAtIndex(indexPathDelete!.row)
            
            //if var foundtodolist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            
            if var foundtodolist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserLists.removeAtIndex(foundtodolist)
            }
            
            
            
            var query2 = PFQuery(className:"toDoLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (todoList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let todoList = todoList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"toDoLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let todoList = todoList {
                            
                            //shopList.deleteInBackground()
                            todoList["isDeleted"] = true
                           // todoList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    todoList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"toDoItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                
                                object["isDeleted"] = true
                                
                                object.unpinInBackground()
                                
                              //  object.saveEventually()
                                
                                
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch


        } else if showoption == "favs" {
            //SHOPLISTS
            
            listtodelete = UserFavLists[indexPathDelete!.row].listid
            
            UserFavLists.removeAtIndex(indexPathDelete!.row)
            
            //Alllists. If shoplist
            
            
            //if var foundlist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
             if var foundlist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserLists.removeAtIndex(foundlist)
            }
            
          //  if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
            if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {

            UserShopLists.removeAtIndex(foundshoplist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            
            if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
            UserToDoLists.removeAtIndex(foundtodolist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            //    UserToDoLists.removeAtIndex(foundtodolist)
            // }
            
            
            
            var query2 = PFQuery(className:"shopLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"shopLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let shopList = shopList {
                            
                            //shopList.deleteInBackground()
                            shopList["isDeleted"] = true
                          //  shopList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    shopList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                //    object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        }

        
         self.tableView.deleteRowsAtIndexPaths([indexPathDelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
         self.tableView.reloadData()
        
    }
    
    
    /////// SWIPE DELETE USUAL
    
    
    func swipedeleteusual(indexPathDelete: NSIndexPath) {
        
        // pausedeleting()
        
        
        print(indexPathDelete)
        
        if showoption == "alllists" {
            //ALLLISTS
            
            listtodelete = UserLists[indexPathDelete.row].listid
            
            // UserLists.removeAtIndex(indexPathDelete!.row)
            
            if UserLists[indexPathDelete.row].listtype == "Shop" {
                //Alllists. If shoplist
                
                
                // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                
                if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                    UserShopLists.removeAtIndex(foundshoplist)
                }
                //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                //    UserToDoLists.removeAtIndex(foundtodolist)
                // }
                
                
                
                var query2 = PFQuery(className:"shopLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (shopList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let shopList = shopList {
                        
                        //First set to deleted in Parse
                        var query = PFQuery(className:"shopLists")
                        query.fromLocalDatastore()
                        // query.getObjectInBackgroundWithId(self.listtodelete!) {
                        query.whereKey("listUUID", equalTo: self.listtodelete!)
                        // queryfav.getObjectInBackgroundWithId(listtofav!) {
                        query.getFirstObjectInBackgroundWithBlock() {
                            
                            (shopList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let shopList = shopList {
                                
                                //shopList.deleteInBackground()
                                shopList["isDeleted"] = true
                               // shopList.saveEventually()
                                
                            }
                            
                        }
                        ////
                        
                        shopList.unpinInBackground()
                        
                        
                    }
                    
                }
                
                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"shopItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
                                    
                                    // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                        
                                        object["isDeleted"] = true
                                        
                                        object.unpinInBackground()
                                        
                                      //  object.saveEventually()
                                        
                                    }
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch
                
                
                
            } else if UserLists[indexPathDelete.row].listtype == "ToDo" {
                // Alllists. If To do
                
                // if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
                //   UserShopLists.removeAtIndex(foundshoplist)
                //}
                //  if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
                
                if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                    UserToDoLists.removeAtIndex(foundtodolist)
                }
                
                
                
                var query2 = PFQuery(className:"toDoLists")
                query2.fromLocalDatastore()
                // query2.getObjectInBackgroundWithId(listtodelete!) {
                query2.whereKey("listUUID", equalTo: self.listtodelete!)
                // queryfav.getObjectInBackgroundWithId(listtofav!) {
                query2.getFirstObjectInBackgroundWithBlock() {
                    
                    (todoList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let todoList = todoList {
                        
                        //First set to deleted in Parse
                        var query = PFQuery(className:"toDoLists")
                        query.fromLocalDatastore()
                        // query.getObjectInBackgroundWithId(self.listtodelete!) {
                        query.whereKey("listUUID", equalTo: self.listtodelete!)
                        // queryfav.getObjectInBackgroundWithId(listtofav!) {
                        query.getFirstObjectInBackgroundWithBlock() {
                            
                            (todoList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let todoList = todoList {
                                
                                //shopList.deleteInBackground()
                                todoList["isDeleted"] = true
                             //   todoList.saveEventually()
                                
                            }
                            
                        }
                        ////
                        
                        todoList.unpinInBackground()
                        
                        
                    }
                    
                }
                
                ////// NOW DELETE ALL ITEMS
                dispatch_async(dispatch_get_main_queue(), {
                    //self.countreceivedlists()
                    // self.checkreceivedlists()
                    
                    
                    var query3 = PFQuery(className:"toDoItems")
                    query3.fromLocalDatastore()
                    query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                    query3.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            if let items = objects as? [PFObject] {
                                for object in items {
                                    
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                 //   object.saveEventually()
                                    
                                    
                                    
                                }
                                
                                
                            }
                        } else {
                            // Log details of the failure
                            print("Error: \(error!) \(error!.userInfo)")
                        }
                    }
                    
                }) // end of dispatch
                
                
            }
            
            UserLists.removeAtIndex(indexPathDelete.row)
            
        } else if showoption == "shoplists" {
            //SHOPLISTS
            
            listtodelete = UserShopLists[indexPathDelete.row].listid
            
            UserShopLists.removeAtIndex(indexPathDelete.row)
            
            //Alllists. If shoplist
            
            
            // if var foundshoplist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            if var foundshoplist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserLists.removeAtIndex(foundshoplist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            //    UserToDoLists.removeAtIndex(foundtodolist)
            // }
            
            
            
            var query2 = PFQuery(className:"shopLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"shopLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let shopList = shopList {
                            
                            //shopList.deleteInBackground()
                            shopList["isDeleted"] = true
                          ////  shopList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    shopList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                  //  object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        } else if showoption == "todolists" {
            //TODOLISTS
            
            listtodelete = UserToDoLists[indexPathDelete.row].listid
            
            UserToDoLists.removeAtIndex(indexPathDelete.row)
            
            //if var foundtodolist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            
            if var foundtodolist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserLists.removeAtIndex(foundtodolist)
            }
            
            
            
            var query2 = PFQuery(className:"toDoLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (todoList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let todoList = todoList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"toDoLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (todoList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let todoList = todoList {
                            
                            //shopList.deleteInBackground()
                            todoList["isDeleted"] = true
                           // todoList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    todoList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"toDoItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                
                                object["isDeleted"] = true
                                
                                object.unpinInBackground()
                                
                              //  object.saveEventually()
                                
                                
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        } else if showoption == "favs" {
            //SHOPLISTS
            
            listtodelete = UserFavLists[indexPathDelete.row].listid
            
            UserFavLists.removeAtIndex(indexPathDelete.row)
            
            //Alllists. If shoplist
            
            
            //if var foundlist = find(lazy(UserLists).map({ $0.listid }), listtodelete!) {
            if var foundlist = UserLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserLists.removeAtIndex(foundlist)
            }
            
            //  if var foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), listtodelete!) {
            if var foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                
                UserShopLists.removeAtIndex(foundshoplist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            
            if var foundtodolist = UserToDoLists.map({ $0.listid }).lazy.indexOf(listtodelete!) {
                UserToDoLists.removeAtIndex(foundtodolist)
            }
            //if var foundtodolist = find(lazy(UserToDoLists).map({ $0.listid }), listtodelete!) {
            //    UserToDoLists.removeAtIndex(foundtodolist)
            // }
            
            
            
            var query2 = PFQuery(className:"shopLists")
            query2.fromLocalDatastore()
            // query2.getObjectInBackgroundWithId(listtodelete!) {
            query2.whereKey("listUUID", equalTo: self.listtodelete!)
            // queryfav.getObjectInBackgroundWithId(listtofav!) {
            query2.getFirstObjectInBackgroundWithBlock() {
                
                (shopList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let shopList = shopList {
                    
                    //First set to deleted in Parse
                    var query = PFQuery(className:"shopLists")
                    query.fromLocalDatastore()
                    // query.getObjectInBackgroundWithId(self.listtodelete!) {
                    query.whereKey("listUUID", equalTo: self.listtodelete!)
                    // queryfav.getObjectInBackgroundWithId(listtofav!) {
                    query.getFirstObjectInBackgroundWithBlock() {
                        
                        (shopList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let shopList = shopList {
                            
                            //shopList.deleteInBackground()
                            shopList["isDeleted"] = true
                           // shopList.saveEventually()
                            
                        }
                        
                    }
                    ////
                    
                    shopList.unpinInBackground()
                    
                    
                }
                
            }
            
            
            ////// NOW DELETE ALL ITEMS
            dispatch_async(dispatch_get_main_queue(), {
                //self.countreceivedlists()
                // self.checkreceivedlists()
                
                
                var query3 = PFQuery(className:"shopItems")
                query3.fromLocalDatastore()
                query3.whereKey("ItemsList", equalTo: self.listtodelete!)
                query3.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    if error == nil {
                        if let items = objects as? [PFObject] {
                            for object in items {
                                
                                // if ((object["isFav"] as! Bool) == false) && (((object["isHistory"] as! Bool) == false) && ((object["chosenFromHistory"] as! Bool) == true)) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                
                                if ((object["isFav"] as! Bool) == false) && ((object["isHistory"] as! Bool) == false) && ((object["isDeleted"] as! Bool) == false) && (((object["chosenFromFavs"] as! Bool) == true) || ((object["chosenFromHistory"] as! Bool) == true)) {
                                    
                                    object["isDeleted"] = true
                                    
                                    object.unpinInBackground()
                                    
                                  //  object.saveEventually()
                                    
                                }
                                
                            }
                            
                            
                        }
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error!.userInfo)")
                    }
                }
                
            }) // end of dispatch
            
            
        }
        
        
        self.tableView.deleteRowsAtIndexPaths([indexPathDelete], withRowAnimation: UITableViewRowAnimation.Automatic)
        self.tableView.reloadData()
        
    }
    
    
    
    //////////
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
    

    
    func newopenlistbynameselection(indexPathOpen: NSIndexPath) {
        
       
        /// SO FAR I DON'T REALLY USE listtoopen VARIABLE!
        
        if showoption == "alllists" {
            
            if UserLists[indexPathOpen.row].listisreceived == true {
                
                if UserLists[indexPathOpen.row].listconfirmreception == true {
                    
                    listtoopen = UserLists[indexPathOpen.row].listid
                    
                    if UserLists[indexPathOpen.row].listtype == "Shop" {
                        
                        self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                        
                    } else if UserLists[indexPathOpen.row].listtype == "ToDo" {
                        
                        self.performSegueWithIdentifier("ToDoOpenListSegue", sender: indexPathOpen)
                        
                    }

                    
                } else {
                    self.displayInfoAlert(NSLocalizedString("saveplease", comment: ""), message:NSLocalizedString("saveplease2", comment: ""))
                }
                
                
            } else {
            
            listtoopen = UserLists[indexPathOpen.row].listid
            
            if UserLists[indexPathOpen.row].listtype == "Shop" {
                
                self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                
            } else if UserLists[indexPathOpen.row].listtype == "ToDo" {
                
                self.performSegueWithIdentifier("ToDoOpenListSegue", sender: indexPathOpen)
                
            }
            
        }
        } else if showoption == "shoplists" {
            
            if UserShopLists[indexPathOpen.row].listisreceived == true {
                
                if UserShopLists[indexPathOpen.row].listconfirmreception == true {
                    listtoopen = UserShopLists[indexPathOpen.row].listid
                    
                    self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                } else {
                   self.displayInfoAlert(NSLocalizedString("saveplease", comment: ""), message:NSLocalizedString("saveplease2", comment: ""))
                }

                
            } else {
            
            listtoopen = UserShopLists[indexPathOpen.row].listid
            
            self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                
            }
            
        } else if showoption == "todolists" {
            
            if UserToDoLists[indexPathOpen.row].listisreceived == true {
                
                if UserToDoLists[indexPathOpen.row].listconfirmreception == true {
                    listtoopen = UserToDoLists[indexPathOpen.row].listid
                    
                    self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                } else {
                    self.displayInfoAlert(NSLocalizedString("saveplease", comment: ""), message:NSLocalizedString("saveplease2", comment: ""))
                }
                
                
            } else {

            
            listtoopen = UserToDoLists[indexPathOpen.row].listid
            
            self.performSegueWithIdentifier("ToDoOpenListSegue", sender: indexPathOpen)
                
            }
            
        } else if showoption == "favs" {
            
            if UserFavLists[indexPathOpen.row].listtype == "ToDo" {
            
            if UserFavLists[indexPathOpen.row].listisreceived == true {
                
                if UserFavLists[indexPathOpen.row].listconfirmreception == true {
                    listtoopen = UserFavLists[indexPathOpen.row].listid
                    
                    self.performSegueWithIdentifier("ToDoOpenListSegue", sender: indexPathOpen)
                } else {
                    self.displayInfoAlert(NSLocalizedString("saveplease", comment: ""), message:NSLocalizedString("saveplease2", comment: ""))
                }
                
                
            } else {
            
            listtoopen = UserFavLists[indexPathOpen.row].listid
            
            self.performSegueWithIdentifier("ToDoOpenListSegue", sender: indexPathOpen)
                
            }
            
            } else {
                
                if UserFavLists[indexPathOpen.row].listisreceived == true {
                    
                    if UserFavLists[indexPathOpen.row].listconfirmreception == true {
                        listtoopen = UserFavLists[indexPathOpen.row].listid
                        
                        self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                    } else {
                        self.displayInfoAlert(NSLocalizedString("saveplease", comment: ""), message:NSLocalizedString("saveplease2", comment: ""))
                    }
                    
                    
                } else {
                    
                    listtoopen = UserFavLists[indexPathOpen.row].listid
                    
                    self.performSegueWithIdentifier("OpenListSegue", sender: indexPathOpen)
                    
                }

            }
        }
        
        
    }
    
    func newopenlistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        //let cell = view.superview as! ShopListCellNew
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
        
        let indexPathOpen = tableView.indexPathForCell(cell)
        
        /// SO FAR I DON'T REALLY USE listtoopen VARIABLE!
        
        if showoption == "alllists" {
            
            listtoopen = UserLists[indexPathOpen!.row].listid
            
            if UserLists[indexPathOpen!.row].listtype == "Shop" {
            
                 self.performSegueWithIdentifier("OpenListSegue", sender: cell)
                
            } else if UserLists[indexPathOpen!.row].listtype == "ToDo" {
                
                self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
                
            }
            
        } else if showoption == "shoplists" {
            
             listtoopen = UserShopLists[indexPathOpen!.row].listid
            
             self.performSegueWithIdentifier("OpenListSegue", sender: cell)
            
        } else if showoption == "todolists" {
            
             listtoopen = UserToDoLists[indexPathOpen!.row].listid
            
             self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
            
        } else if showoption == "favs" {
            
            listtoopen = UserFavLists[indexPathOpen!.row].listid
            
            self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
        }

        
    }
    
    //newdeletereceivedlist
    //newsavereceivedlist
    //newopenreceivedlistbyname
    func newopenreceivedlistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        //let cell = view.superview as! ShopListCellNew
        let innerview = view.superview!
        let cell = innerview.superview as! ReceivedListOld
        
        let indexPathOpen = tableView.indexPathForCell(cell)
        
        /// SO FAR I DON'T REALLY USE listtoopen VARIABLE!
        
        if showoption == "alllists" {
            
            listtoopen = UserLists[indexPathOpen!.row].listid
            
            print(UserLists[indexPathOpen!.row].listtype)
            
            if UserLists[indexPathOpen!.row].listtype == "Shop" {
                
                self.performSegueWithIdentifier("OpenListSegue", sender: cell)
               
            } else if UserLists[indexPathOpen!.row].listtype == "ToDo" {
                
                self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
            
            }
            
            
            
        } else if showoption == "shoplists" {
            
            listtoopen = UserShopLists[indexPathOpen!.row].listid
            
            self.performSegueWithIdentifier("OpenListSegue", sender: cell)
            
        } else if showoption == "todolists" {
            
            listtoopen = UserToDoLists[indexPathOpen!.row].listid
            
            self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
            
        } else if showoption == "favs" {
            
            listtoopen = UserFavLists[indexPathOpen!.row].listid
            
            self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
        }
        
    }
    
    /*
    func openlistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        //let cell = view.superview as! ShopListCellNew
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
        
        var indexPathOpen = tableView.indexPathForCell(cell)
        
        self.performSegueWithIdentifier("OpenListSegue", sender: cell)
    }
    
    
    func opentodolistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
       // let cell = view.superview as! ShopListCellNew
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
        
        var indexPathOpen = tableView.indexPathForCell(cell)
        
        self.performSegueWithIdentifier("ToDoOpenListSegue", sender: cell)
    }
*/
    
    func openreceivedtodolistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        let receivedcell = view.superview as! ReceivedListOld
        
        let indexPathReceivedOpen = tableView.indexPathForCell(receivedcell)
        
        self.performSegueWithIdentifier("ToDoOpenListSegue", sender: receivedcell)
    }
    
    
    
    func openreceivedlistbyname(sender: UIButton!) {
        
        let button = sender as UIButton
        let view = button.superview!
        let receivedcell = view.superview as! ShopListCellNew
        
        let indexPathReceivedOpen = tableView.indexPathForCell(receivedcell)
        
        self.performSegueWithIdentifier("OpenListSegue", sender: receivedcell)
    }

    
    
    //////// TABLE CONFIGURATION
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if showoption == "alllists" {
            return UserLists.count
        }
        else if showoption == "shoplists" {
            return UserShopLists.count
        }
        else if showoption == "todolists" {
            return UserToDoLists.count
        } else if showoption == "favs" {
            return UserFavLists.count
        } else {

        return UserLists.count
        }
    }
    
    //func sharelist(sender: UIButton!) {
    func sharelist(indexPath: NSIndexPath!) {
        
        
        /*
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ShopListCellNew
        let indexPathShare = tableView.indexPathForCell(cell)
 */
        
        if showoption == "alllists" {
            listtoshare = UserLists[indexPath.row].listid
            listtosharetype = UserLists[indexPath.row].listtype
        }
        else if showoption == "shoplists" {
            listtoshare = UserShopLists[indexPath.row].listid
            listtosharetype = UserShopLists[indexPath.row].listtype
        }
        else if showoption == "todolists" {
            listtoshare = UserToDoLists[indexPath.row].listid
            listtosharetype = UserToDoLists[indexPath.row].listtype
        }
        else if showoption == "favs" {
            listtoshare = UserFavLists[indexPath.row].listid
            listtosharetype = UserFavLists[indexPath.row].listtype
        }

        
        
        performSegueWithIdentifier("shareListSegue", sender: self)

        
    }
    
    
    func sharereceivedlist(sender: UIButton!) {
        
        
        
        let button = sender as UIButton
        let view = button.superview!
        let innerview = view.superview!
        let cell = innerview.superview as! ReceivedListOld
        let indexPathShare = tableView.indexPathForCell(cell)
        
        if showoption == "alllists" {
            listtoshare = UserLists[indexPathShare!.row].listid
            listtosharetype = UserLists[indexPathShare!.row].listtype
        }
        else if showoption == "shoplists" {
            listtoshare = UserShopLists[indexPathShare!.row].listid
            listtosharetype = UserShopLists[indexPathShare!.row].listtype
        }
        else if showoption == "todolists" {
            listtoshare = UserToDoLists[indexPathShare!.row].listid
            listtosharetype = UserToDoLists[indexPathShare!.row].listtype
        }
        else if showoption == "favs" {
            listtoshare = UserFavLists[indexPathShare!.row].listid
            listtosharetype = UserFavLists[indexPathShare!.row].listtype
        }
        
        
        performSegueWithIdentifier("shareListSegue", sender: self)
        
        
    }

    
    /*
    func closenotes(sender: UIButton!) {
        
        let button = sender as UIButton
        let view1 = button.superview!
        let view2 = view1.superview!
        
        view2.removeFromSuperview()
        
    }
    
    func showreceivednotes(sender: UIButton!) {
        
        let button = sender as UIButton
        let view1 = button.superview!
        let innerview = view1.superview!
        
        let cell = innerview.superview as! ReceivedListOld
        let indexPath = tableView.indexPathForCell(cell)
        
        var notetext = String()
        
        if showoption == "alllists" {
            notetext = UserLists[indexPath!.row].listnote
        } else if showoption == "shoplists" {
            notetext = UserShopLists[indexPath!.row].listnote
        } else if showoption == "todolists" {
            notetext = UserToDoLists[indexPath!.row].listnote
        } else if showoption == "favs" {
            notetext = UserFavLists[indexPath!.row].listnote
        }

        
        
        let dimmer : UIView = UIView()
        dimmer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        dimmer.backgroundColor = UIColorFromRGBalpha(0x2a2f36, alp: 0.5)
        self.view.addSubview(dimmer)
        
        let noteview : UIView = UIView()
        //noteview.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 200, 200)
        //noteview.frame = CGRectMake(cell.frame.origin.x + 20, cell.frame.origin.y + button.frame.origin.y + 10, self.view.frame.size.width*0.8, 200)
      //  noteview.frame = CGRectMake(cell.frame.origin.x + 20, cell.frame.origin.y + 120, self.view.frame.size.width*0.8, 120)
        noteview.frame = CGRectMake(self.view.frame.size.width*0.1, self.view.frame.origin.y + self.view.frame.size.height*0.5 - 100, self.view.frame.size.width*0.8, 200)
        
        noteview.backgroundColor = UIColorFromRGBalpha(0xFAFAFA, alp: 1)//UIColor.whiteColor()
        
        noteview.layer.cornerRadius = 10
        noteview.layer.borderWidth = 1
        noteview.layer.borderColor = UIColorFromRGB(0xCFCFCF).CGColor
        dimmer.addSubview(noteview)
        
        
        
        let field: UITextView = UITextView()
        field.frame = CGRectMake(20, 35, noteview.frame.size.width*0.8, noteview.frame.size.height*0.7)
        //field.backgroundColor=UIColor.grayColor()
        field.textAlignment = NSTextAlignment.Left //.Center
        field.backgroundColor = UIColorFromRGBalpha(0xFAFAFA, alp: 1)
        field.font = UIFont(name: "Avenir-Book", size: 16)
        field.text = notetext
        field.hidden = false
        noteview.addSubview(field)
        
        let btn: UIButton = UIButton()
        btn.frame=CGRectMake((noteview.frame.size.width - 120), 10, 110, 20)
        
        
        btn.setTitleColor(UIColorFromRGB(0x31797D), forState: UIControlState.Normal)
        btn.setTitle(NSLocalizedString("close", comment: ""), forState: UIControlState.Normal)
        btn.titleLabel!.font =  UIFont(name: "Avenir-Book", size: 18)
        btn.setImage(closeimage, forState: UIControlState.Normal)
        btn.addTarget(self, action: "closenotes:", forControlEvents: UIControlEvents.TouchUpInside)
        noteview.addSubview(btn)
        noteview.bringSubviewToFront(btn)
        
    }
    */
    
    /// NEW SHARE PART 
    
    
    @IBOutlet var blurredview: UIView!
    
    
    @IBOutlet var newsendbuttonoutlet: UIButton!
    
    
    @IBAction func newsendbutton(sender: AnyObject) {
        
         performSegueWithIdentifier("shareListSegue", sender: self)
    }
    
    @IBOutlet var newoptionsoutlet: UIButton!
    
    
    @IBAction func newoptions(sender: AnyObject) {
        
        if listtosharetype == "Shop" {
        self.performSegueWithIdentifier("Alllistsoptions", sender: self)
        } else {
        self.performSegueWithIdentifier("todooptionssegue", sender: self)
        }
    }
    
    
    @IBOutlet var newnotelabel: UILabel!
    
    
    @IBOutlet var newnotetextview: UITextView!
    
    
    @IBOutlet var newdonebutton: UIButton!
    
    

    
    @IBOutlet var newclosebuttonoutlet: UIButton!
    
    
    @IBAction func newclosebutton(sender: AnyObject) {
        
        dimmer.removeFromSuperview()
        
        
        mytopconstr.constant = -370
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (value: Bool) -> Void in
                self.newnotetextview.text = ""
                self.listtoshare = ""
                self.listtosharetype = ""
                self.idforoptions = ""
                self.blurredview.hidden = true
        }

        

    }
    
    @IBOutlet var newsharelabel: UILabel!
    
    @IBOutlet var newoptionslabel: UILabel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       
    }
    
    
    func handlebvTap(sender: UITapGestureRecognizer? = nil) {
        
        dimmer.removeFromSuperview()
        
        
        mytopconstr.constant = -370
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
             self.view.layoutIfNeeded()
            }) { (value: Bool) -> Void in
                self.newnotetextview.text = ""
                self.listtoshare = ""
                self.listtosharetype = ""
                self.idforoptions = ""
                self.blurredview.hidden = true
        }

        
    }
    
     let dimmer : UIView = UIView()
    
    
    @IBOutlet var mytopconstr: NSLayoutConstraint!
    
    func showreceivednotes(sender: UIButton!) {
        
        let button = sender as UIButton
        let view1 = button.superview!
        let innerview = view1.superview!
        
        let cell = innerview.superview as! ReceivedListOld
        let indexPath = tableView.indexPathForCell(cell)
        
        var notetext = String()
        
        var listname = String()
        
        
        if showoption == "alllists" {
            listname = UserLists[indexPath!.row].listname
            notetext = UserLists[indexPath!.row].listnote
            listtoshare = UserLists[indexPath!.row].listid
            listtosharetype = UserLists[indexPath!.row].listtype
            idforoptions = UserLists[indexPath!.row].listid
            
        } else if showoption == "shoplists" {
            listname = UserShopLists[indexPath!.row].listname
            notetext = UserShopLists[indexPath!.row].listnote
            listtoshare = UserShopLists[indexPath!.row].listid
            listtosharetype = UserShopLists[indexPath!.row].listtype
            idforoptions = UserShopLists[indexPath!.row].listid
        } else if showoption == "todolists" {
            listname = UserToDoLists[indexPath!.row].listname
            notetext = UserToDoLists[indexPath!.row].listnote
            listtoshare = UserToDoLists[indexPath!.row].listid
            listtosharetype = UserToDoLists[indexPath!.row].listtype
            idforoptions = UserToDoLists[indexPath!.row].listid
        } else if showoption == "favs" {
            listname = UserFavLists[indexPath!.row].listname
            notetext = UserFavLists[indexPath!.row].listnote
            listtoshare = UserFavLists[indexPath!.row].listid
            listtosharetype = UserFavLists[indexPath!.row].listtype
            idforoptions = UserFavLists[indexPath!.row].listid
        }
        
        //  let dimmer : UIView = UIView()
        dimmer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        dimmer.backgroundColor = UIColorFromRGBalpha(0x2a2f36, alp: 0.5)
        
        
        let blurredtap = UITapGestureRecognizer(target: self, action: Selector("handlebvTap:"))
        blurredtap.delegate = self
        dimmer.userInteractionEnabled = true
        dimmer.addGestureRecognizer(blurredtap)
        
        self.view.addSubview(dimmer)
        // blurredview.is
        
        blurredview.hidden = false
        mytopconstr.constant = 137
        
        self.newnotetextview.text = notetext
        self.newlistname.text = listname
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            //self.blurredview.center.y = self.view.center.y
            self.view.layoutIfNeeded()
            }) { (value: Bool) -> Void in
                
        }
        
        
        
        
        
        self.view.bringSubviewToFront(blurredview)

        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        shiftview(true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        shiftview(false)
    }
    
   
    
    
    func shiftview(up: Bool) {
        
        if up == true {
            
            mytopconstr.constant = 20
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                }, completion: { (value: Bool) -> Void in
                    
            })
            // self.view.frame.origin.y -= 200
            
        } else if up == false {
            
            mytopconstr.constant = 137
            
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                }, completion: { (value: Bool) -> Void in
                    
            })
        }
    }
    
    
    func shownotes(sender: UIButton!) {
        
        let button = sender as UIButton
        let view1 = button.superview!
        let innerview = view1.superview!

        let cell = innerview.superview as! ShopListCellNew
        let indexPath = tableView.indexPathForCell(cell)
       
        var notetext = String()
        
        var listname = String()
       

        if showoption == "alllists" {
            listname = UserLists[indexPath!.row].listname
        notetext = UserLists[indexPath!.row].listnote
            listtoshare = UserLists[indexPath!.row].listid
            listtosharetype = UserLists[indexPath!.row].listtype
             idforoptions = UserLists[indexPath!.row].listid

        } else if showoption == "shoplists" {
            listname = UserShopLists[indexPath!.row].listname
        notetext = UserShopLists[indexPath!.row].listnote
            listtoshare = UserShopLists[indexPath!.row].listid
            listtosharetype = UserShopLists[indexPath!.row].listtype
            idforoptions = UserShopLists[indexPath!.row].listid
        } else if showoption == "todolists" {
            listname = UserToDoLists[indexPath!.row].listname
        notetext = UserToDoLists[indexPath!.row].listnote
            listtoshare = UserToDoLists[indexPath!.row].listid
            listtosharetype = UserToDoLists[indexPath!.row].listtype
            idforoptions = UserToDoLists[indexPath!.row].listid
        } else if showoption == "favs" {
            listname = UserFavLists[indexPath!.row].listname
        notetext = UserFavLists[indexPath!.row].listnote
            listtoshare = UserFavLists[indexPath!.row].listid
            listtosharetype = UserFavLists[indexPath!.row].listtype
            idforoptions = UserFavLists[indexPath!.row].listid
        }
        
      //  let dimmer : UIView = UIView()
        dimmer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        dimmer.backgroundColor = UIColorFromRGBalpha(0x2a2f36, alp: 0.5)
        
        
        let blurredtap = UITapGestureRecognizer(target: self, action: Selector("handlebvTap:"))
        blurredtap.delegate = self
        dimmer.userInteractionEnabled = true
        dimmer.addGestureRecognizer(blurredtap)

        self.view.addSubview(dimmer)
       // blurredview.is
        
        blurredview.hidden = false
         mytopconstr.constant = 137
        
        self.newnotetextview.text = notetext
        self.newlistname.text = listname
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
             //self.blurredview.center.y = self.view.center.y
            self.view.layoutIfNeeded()
            }) { (value: Bool) -> Void in
               
        }
        
        
        
       
        
       self.view.bringSubviewToFront(blurredview)
        
          }
    
    
    func tableView(tableView: UITableView,
        willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    /*
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
     newopenlistbynameselection(indexPath)
        
        

    }
   /*
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.reuseIdentifier == "receivedlist" {
                return 136.0
            }
        }
        return 116.0
    }
    */
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        var thislisttype = String()
        if showoption == "alllists" {
            thislisttype = UserLists[indexPath.row].listtype
        } else if showoption == "shoplists" {
            thislisttype = UserShopLists[indexPath.row].listtype
        } else if showoption == "todolists" {
            thislisttype = UserToDoLists[indexPath.row].listtype
        } else if showoption == "favs" {
            thislisttype = UserFavLists[indexPath.row].listtype
        }
        
        var thisisreceived = Bool()
        var confirm = Bool()
        if showoption == "alllists" {
            thisisreceived = UserLists[indexPath.row].listisreceived
            confirm = UserLists[indexPath.row].listissaved
        } else if showoption == "shoplists" {
            thisisreceived = UserShopLists[indexPath.row].listisreceived
            confirm = UserShopLists[indexPath.row].listissaved
        } else if showoption == "todolists" {
            thisisreceived = UserToDoLists[indexPath.row].listisreceived
            confirm = UserToDoLists[indexPath.row].listissaved
        } else if showoption == "favs" {
            thisisreceived = UserFavLists[indexPath.row].listisreceived
            confirm = UserFavLists[indexPath.row].listissaved
        }
        
        // DELETE
        let deleteAction = UITableViewRowAction(style: .Normal, title: "    ") { (action , indexPath ) -> Void in
            
            self.editing = false
            self.swipedeleteusual(indexPath)
            
            
        }
        
        if let adelete = UIImage(named: "4DeleteButton") {
            deleteAction.backgroundColor = UIColor.imageWithBackgroundColor(adelete, bgColor: UIColor.redColor(), w: 50, h: 70)
        
        }
        
        // SHARE
        let shareAction = UITableViewRowAction(style: .Normal, title: "    ") { (action , indexPath) -> Void in
            self.editing = false
            
            //self.optionsaction(indexPath)
            self.sharelist(indexPath)
            
        }
        
        if let ashare = UIImage(named: "4ShareButton") {
            shareAction.backgroundColor = UIColor.imageWithBackgroundColor(ashare, bgColor: UIColorFromRGB(0x7FC2C6), w: 50, h: 70)
        }
        
        // OPTIONS
        let optionsAction = UITableViewRowAction(style: .Normal, title: "    ") { (action , indexPath) -> Void in
            self.editing = false
            
            self.optionsaction(indexPath)
            print("Settings")
            
        }

        if let aoptions = UIImage(named: "4SettingsButton") {
             optionsAction.backgroundColor = UIColor.imageWithBackgroundColor(aoptions, bgColor: UIColor.clearColor(), w: 50, h: 70)
        }
        
        let todooptionsAction = UITableViewRowAction(style: .Normal, title: "    ") { (action , indexPath) -> Void in
            self.editing = false

            self.todooptionsaction(indexPath)
            
        }
        todooptionsAction.backgroundColor = UIColorFromRGB(0x31797D)
        
        // FAV
        let favAction = UITableViewRowAction(style: .Normal, title: "    ") { (action , indexPath) -> Void in
            self.editing = false
            
            
            if !thisisreceived {
                self.adddeletefav(indexPath)
            } else {
                self.adddeletereceivedfav(indexPath)
            }
            //self.optionsaction(indexPath)
            print("edit")
            
        }
        
        if let afav = UIImage(named: "4FavlistButton") {
            favAction.backgroundColor = UIColor.imageWithBackgroundColor(afav, bgColor: UIColor.clearColor(), w: 50, h: 70)
        }
        


        
        /*
        var thislisttype = String()
        if showoption == "alllists" {
            thislisttype = UserLists[indexPath.row].listtype
        } else if showoption == "shoplists" {
            thislisttype = UserShopLists[indexPath.row].listtype
        } else if showoption == "todolists" {
            thislisttype = UserToDoLists[indexPath.row].listtype
        } else if showoption == "favs" {
            thislisttype = UserFavLists[indexPath.row].listtype
        }
        */
        /*
        if thislisttype == "Shop" {
        
        return [deleteAction, shareAction, editingAction, optionsAction]
        } else if thislisttype == "ToDo" {
        return [optionsAction, editingAction, shareAction, deleteAction]
        } else {
            return [deleteAction]
        }
        */
        
        
        
        if thisisreceived && !confirm {
            return [deleteAction]
        } else {
            if thislisttype == "Shop" {
        return [deleteAction, shareAction, optionsAction, favAction]
            } else if thislisttype == "ToDo" {
                return [deleteAction, shareAction, todooptionsAction, favAction]
            } else {
                return [deleteAction]
            }
        }

    }

    
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            //cString = cString.substringFromIndex(advance(cString.startIndex, 1))
             cString = cString.substringFromIndex(cString.startIndex.advancedBy(1)) //Swift 2
            //str.removeAtIndex(str.endIndex.advancedBy(-1))
        }
        
        //if (count(cString) != 6) {
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func changeprogress(overall: Int, checked: Int, thelabel: UILabel) -> (pcol:UIColor, theangle: Double) {
        
        if overall > 0 {
            var percentage : Double = 100.0 * Double(checked)/Double(overall)
            
            var theangle : Double = 360.0 * (percentage/100.0)
            
            thelabel.text = "\(Int(percentage))%"
        
        if (percentage > 0.0) && (percentage <= 25.0) {
            return (UIColorFromRGB(0xF5A623), theangle)
            
        } else if (percentage > 25.0) && (percentage <= 50.0) {
        return (UIColorFromRGB(0xA2AF36), theangle)
        } else if (percentage > 50.0) && (percentage <= 75.0) {
            return (UIColorFromRGB(0x64B320), theangle)
        } else if (percentage > 75.0) && (percentage <= 90.0) {
            return (UIColorFromRGB(0x20B343), theangle)
        } else if (percentage > 90.0) && (percentage <= 100.0) {
            return (UIColorFromRGB(0x61C791), theangle)
        } else if (percentage == 0.0) {
            return (UIColorFromRGB(0xF23D55), 1.0)
        } else {
            return (UIColorFromRGB(0xD8D8D8), theangle)
        }
        } else {
            thelabel.text = "0%"
            return (UIColorFromRGB(0xF23D55), 1.0)
        }
    }
    
    
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
            if showoption == "alllists" || showoption == "" {
                
               
            
                if UserLists[indexPath.row].listisreceived == true {
                    
                    let receivedcell  = tableView.dequeueReusableCellWithIdentifier("receivedlist", forIndexPath: indexPath) as! ReceivedListOld
                    
                   
                    
                    let thiscolor : String = UserLists[indexPath.row].listcolorcode
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    receivedcell.receivedlistnamebutton.textColor = colorWithHexString(thiscolor)
                    
                    receivedcell.receivedlistnamebutton.text = UserLists[indexPath.row].listname
                    receivedcell.receivedlistnamebutton.tag = indexPath.row
                    
                   /*
                    if UserLists[indexPath.row].listconfirmreception == true {
                        
                        if UserLists[indexPath.row].listtype == "Shop" {
                            receivedcell.newlisttype.image = shopicon
                        } else {
                            receivedcell.newlisttype.image = todoicon
                        }
                    } else {
                            receivedcell.newlisttype.image = receivedicon
                    }
                    */
                    receivedcell.newlisttype.image = receivedicon
                    
                    var email = String()
                    if UserLists[indexPath.row].listreceivedfrom[2] != "default@default.com" {

                        email = UserLists[indexPath.row].listreceivedfrom[2]
                    } else {
                        email = NSLocalizedString("Anonymous", comment: "")
                    }

                    
                    receivedcell.sendername.text = "\(UserLists[indexPath.row].listreceivedfrom[1]) (\(email))" //name
                    
                   
                    
                    if UserLists[indexPath.row].listisfavourite == true {
                        //favimage = UIImage(named: "ICFavStarActive") as UIImage!
                        //receivedcell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)

                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // receivedcell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                   
                    
                    //receivedcell.addtofavs.addTarget(self, action: "adddeletereceivedfav:", forControlEvents: .TouchUpInside)
                    
                   
                
                    
                    
                    receivedcell.acceptlist.addTarget(self, action: "newsavereceivedlist:", forControlEvents: .TouchUpInside)
                    
                    if UserLists[indexPath.row].listconfirmreception == true {
                        

                        receivedcell.addtofavs.hidden  = false
                        receivedcell.acceptlist.hidden = true
                        receivedcell.acceptlabel.hidden = true
                      
                        
                    } else {

                        receivedcell.addtofavs.hidden  = true
                        receivedcell.acceptlist.hidden = false
                        receivedcell.acceptlabel.hidden = false
                    }

                    let dateFormatter1 = NSDateFormatter()
                    dateFormatter1.dateFormat = "dd MMM yyyy"
                    let date1 = dateFormatter1.stringFromDate(UserLists[indexPath.row].listcreationdate)
                    receivedcell.receivedlistdate.text = date1
                    
                    let allcount : String = String(UserLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserLists[indexPath.row].listcheckeditemscount)
                    
                    receivedcell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    receivedcell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).pcol]
                    receivedcell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).theangle
                    //
                    
                    
                    if UserLists[indexPath.row].listissaved != true {
                       receivedcell.selectionStyle = UITableViewCellSelectionStyle.None
                    }
                    
                    
                    return receivedcell
                    
                } else {
                    //usual list
                    
                    
                    let cellIdentifier1 = "userlist"
                    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as!  ShopListCellNew

                    
                    let thiscolor : String = UserLists[indexPath.row].listcolorcode
                    
                    cell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    cell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    cell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    cell.ShopListNameButton.text = UserLists[indexPath.row].listname
                    
                    cell.ShopListNameButton.textColor = colorWithHexString(thiscolor)

                    
                    if UserLists[indexPath.row].listtype == "Shop" {
                        cell.newlisttype.image = shopicon
                    } else {
                        cell.newlisttype.image = todoicon
                    }

                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let date = dateFormatter.stringFromDate(UserLists[indexPath.row].listcreationdate)
                    cell.creationDate.text = date

                    if UserLists[indexPath.row].listisfavourite == true {
                       // favimage = UIImage(named: "ICFavStarActive") as UIImage!
                        //cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                  
                    // Progress change
                    
                    cell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).pcol]
                    cell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).theangle
                    //

                    
                  //  cell.addToFavOutlet.addTarget(self, action: "adddeletefav:", forControlEvents: .TouchUpInside)
                    
                    let allcount : String = String(UserLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserLists[indexPath.row].listcheckeditemscount)

                    cell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    
                    return cell
                    
                }
                
            } else if showoption == "shoplists" {
                
            
                
                 if UserShopLists[indexPath.row].listisreceived == true {
                    
                     let receivedcell  = tableView.dequeueReusableCellWithIdentifier("receivedlist", forIndexPath: indexPath) as! ReceivedListOld
                    
 
                    
                    receivedcell.receivedlistnamebutton.text = UserShopLists[indexPath.row].listname                   // receivedcell.receivedlistnamebutton.tag = indexPath.row
                    
                    let thiscolor : String = UserShopLists[indexPath.row].listcolorcode
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    receivedcell.receivedlistnamebutton.textColor = colorWithHexString(thiscolor)
                    
              
                    /*
                     if UserLists[indexPath.row].listconfirmreception == true {
                        receivedcell.newlisttype.image = shopicon
                     } else {
                        receivedcell.newlisttype.image = receivedicon
                        }
                    */
                    
                    receivedcell.newlisttype.image = receivedicon
                    
                    receivedcell.acceptlist.addTarget(self, action: "newsavereceivedlist:", forControlEvents: .TouchUpInside)
                    
                    if UserShopLists[indexPath.row].listconfirmreception == true {
                        
 
                        receivedcell.addtofavs.hidden  = false
                        receivedcell.acceptlist.hidden = true
                        receivedcell.acceptlabel.hidden = true
                        
                    } else {

                        receivedcell.addtofavs.hidden  = true
                        receivedcell.acceptlist.hidden = false
                        receivedcell.acceptlabel.hidden = false
                    }
                    
                    if UserShopLists[indexPath.row].listisfavourite == true {
                       // favimage = UIImage(named: "ICFavStarActive") as UIImage!
                       // receivedcell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
                        
                    } else {
                      //  notfavimage = UIImage(named: "ICFavStar") as UIImage!
                      //  receivedcell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                        
                    }
                    
                    
                  //  receivedcell.addtofavs.addTarget(self, action: "adddeletereceivedfav:", forControlEvents: .TouchUpInside)
                    
                    var email = String()
                    if UserShopLists[indexPath.row].listreceivedfrom[2] != "default@default.com" {

                        email = UserShopLists[indexPath.row].listreceivedfrom[2]
                    } else {

                        email = NSLocalizedString("Anonymous", comment: "")
                    }
                    
                    
                    receivedcell.sendername.text = "\(UserShopLists[indexPath.row].listreceivedfrom[1]) (\(email))" //name

                    
                    let dateFormatter1 = NSDateFormatter()
                    dateFormatter1.dateFormat = "dd MMM yyyy"
                    let date1 = dateFormatter1.stringFromDate(UserShopLists[indexPath.row].listcreationdate)
                    receivedcell.receivedlistdate.text = date1
                    
                    let allcount : String = String(UserShopLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserShopLists[indexPath.row].listcheckeditemscount)
                    
                    receivedcell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    
                    // Progress change
                    
                    receivedcell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).pcol]
                    receivedcell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).theangle
                    //

                    
                    
                    return receivedcell
                    
                 } else {
                    
                    
                    let cellIdentifier1 = "userlist"
                    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as!  ShopListCellNew
                    
                    cell.ShopListNameButton.text = UserShopLists[indexPath.row].listname
                    let thiscolor : String = UserShopLists[indexPath.row].listcolorcode
                    
                    cell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    cell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    cell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    cell.ShopListNameButton.text = UserLists[indexPath.row].listname
                    
                    cell.ShopListNameButton.textColor = colorWithHexString(thiscolor)
                    
                  //  cell.shownote.addTarget(self, action: "shownotes:", forControlEvents: .TouchUpInside)
                   
                        cell.newlisttype.image = shopicon
                   

                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let date = dateFormatter.stringFromDate(UserShopLists[indexPath.row].listcreationdate)
                    cell.creationDate.text = date
                    
                    
                    if UserShopLists[indexPath.row].listisfavourite == true {
                      //  favimage = UIImage(named: "ICFavStarActive") as UIImage!
                      //  cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                       
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                    
                   // cell.addToFavOutlet.addTarget(self, action: "adddeletefav:", forControlEvents: .TouchUpInside)
                    
                    let allcount : String = String(UserShopLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserShopLists[indexPath.row].listcheckeditemscount)
                    
                    cell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    cell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).pcol]
                    cell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).theangle
                    //

                    
                    return cell
                }
                
            } else if showoption == "todolists" {
               

                
                if UserToDoLists[indexPath.row].listisreceived == true {
                    
                    
                    let receivedcell  = tableView.dequeueReusableCellWithIdentifier("receivedlist", forIndexPath: indexPath) as! ReceivedListOld
                   

                    
                    receivedcell.receivedlistnamebutton.text = UserToDoLists[indexPath.row].listname
                    
                    let thiscolor : String = UserToDoLists[indexPath.row].listcolorcode
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    
                    receivedcell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    receivedcell.receivedlistnamebutton.textColor = colorWithHexString(thiscolor)
                    
                  

                receivedcell.acceptlist.addTarget(self, action: "newsavereceivedlist:", forControlEvents: .TouchUpInside)
                    
                 
                    if UserToDoLists[indexPath.row].listconfirmreception == true {

                        receivedcell.addtofavs.hidden  = false
                        receivedcell.acceptlist.hidden = true
                        receivedcell.acceptlabel.hidden = true
                        
                    } else {

                        receivedcell.addtofavs.hidden  = true
                        receivedcell.acceptlist.hidden = false
                        receivedcell.acceptlabel.hidden = false
                    }
                    /*
                  if UserLists[indexPath.row].listconfirmreception == true {
                        receivedcell.newlisttype.image = todoicon
                  } else {
                    receivedcell.newlisttype.image = receivedicon
                    }
                    */
                    
                    receivedcell.newlisttype.image = receivedicon
                    
                    if UserToDoLists[indexPath.row].listisfavourite == true {
                       // favimage = UIImage(named: "ICFavStarActive") as UIImage!
                       // receivedcell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                        // cell.addToFavOutlet.addTarget(self, action: "delfromfav:", forControlEvents: .TouchUpInside)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
                        
                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // receivedcell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                        // cell.addToFavOutlet.addTarget(self, action: "addtofav:", forControlEvents: .TouchUpInside)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                        
                    }
                    
                    
                    
                   // receivedcell.addtofavs.addTarget(self, action: "adddeletereceivedfav:", forControlEvents: .TouchUpInside)
                    
                    
                    var email = String()
                    if UserToDoLists[indexPath.row].listreceivedfrom[2] != "default@default.com" {
                        //receivedcell.senderemail.text = UserLists[indexPath.row].listreceivedfrom[2] //email
                        email = UserToDoLists[indexPath.row].listreceivedfrom[2]
                    } else {
                        // receivedcell.senderemail.text = "Anonymous"
                        email = NSLocalizedString("Anonymous", comment: "")
                    }
                    
                    
                    receivedcell.sendername.text = "\(UserToDoLists[indexPath.row].listreceivedfrom[1]) (\(email))" //name
  
                    
                    let dateFormatter1 = NSDateFormatter()
                    dateFormatter1.dateFormat = "dd MMM yyyy"
                    let date1 = dateFormatter1.stringFromDate(UserToDoLists[indexPath.row].listcreationdate)
                    receivedcell.receivedlistdate.text = date1
                    
                    let allcount : String = String(UserToDoLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserToDoLists[indexPath.row].listcheckeditemscount)
                    
                    receivedcell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    receivedcell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).pcol]
                    receivedcell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).theangle
                    //

                    
                    return receivedcell
                    
                } else {
                    
                    let cellIdentifier1 = "userlist"
                    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as!  ShopListCellNew
                    
                    
                    cell.ShopListNameButton.text = UserToDoLists[indexPath.row].listname
                    let thiscolor : String = UserToDoLists[indexPath.row].listcolorcode
                    cell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    cell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    cell.newlisttype.tintColor = colorWithHexString(thiscolor)
  
                    
                    cell.ShopListNameButton.textColor = colorWithHexString(thiscolor)
                    
                   // cell.shownote.addTarget(self, action: "shownotes:", forControlEvents: .TouchUpInside)
               
                        cell.newlisttype.image = todoicon
               

                 
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let date = dateFormatter.stringFromDate(UserToDoLists[indexPath.row].listcreationdate)
                    cell.creationDate.text = date
                    
                    
                    if UserToDoLists[indexPath.row].listisfavourite == true {
                       // favimage = UIImage(named: "ICFavStarActive") as UIImage!
                       // cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                    
                   // cell.addToFavOutlet.addTarget(self, action: "adddeletefav:", forControlEvents: .TouchUpInside)
                    
                    let allcount : String = String(UserToDoLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserToDoLists[indexPath.row].listcheckeditemscount)
                    
                    cell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    cell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).pcol]
                    cell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).theangle
                    //

                    
                    return cell
                    
                }
                
                
            }  else if showoption == "favs" {
                
                
                
                if UserFavLists[indexPath.row].listisreceived == true {
                    
                    let receivedcell  = tableView.dequeueReusableCellWithIdentifier("receivedlist", forIndexPath: indexPath) as! ReceivedListOld
                    
                    /*
                    if UserLists[indexPath.row].listconfirmreception == true {

                    if UserFavLists[indexPath.row].listtype == "Shop" {
                        receivedcell.newlisttype.image = shopicon
                    } else {
                        receivedcell.newlisttype.image = todoicon
                    }
                    } else {
                         receivedcell.newlisttype.image = receivedicon
                    }
                    */
                    receivedcell.newlisttype.image = receivedicon
                    
                    receivedcell.receivedlistnamebutton.text = UserFavLists[indexPath.row].listname
                    
                    let thiscolor : String = UserFavLists[indexPath.row].listcolorcode
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    receivedcell.receivedlistnamebutton.textColor = colorWithHexString(thiscolor)
                    
                   
                    
                    receivedcell.acceptlist.addTarget(self, action: "newsavereceivedlist:", forControlEvents: .TouchUpInside)
                    
                    if UserFavLists[indexPath.row].listconfirmreception == true {

                        receivedcell.addtofavs.hidden  = false
                        receivedcell.acceptlist.hidden = true
                        receivedcell.acceptlabel.hidden = true
                        
                    } else {

                        receivedcell.addtofavs.hidden  = true
                        receivedcell.acceptlist.hidden = false
                        receivedcell.acceptlabel.hidden = false
                    }
                    
                   // receivedcell.newlisttype.image = shopicon

                    
                    if UserFavLists[indexPath.row].listisfavourite == true {
                       // favimage = UIImage(named: "ICFavStarActive") as UIImage!
                       // receivedcell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
                        

                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // receivedcell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                        
                    }
                    
                    
                    
                   // receivedcell.addtofavs.addTarget(self, action: "adddeletereceivedfav:", forControlEvents: .TouchUpInside)
                    
                    var email = String()
                    if UserFavLists[indexPath.row].listreceivedfrom[2] != "default@default.com" {
                        //receivedcell.senderemail.text = UserLists[indexPath.row].listreceivedfrom[2] //email
                        email = UserFavLists[indexPath.row].listreceivedfrom[2]
                    } else {
                        // receivedcell.senderemail.text = "Anonymous"
                        email = NSLocalizedString("Anonymous", comment: "")
                    }
                    
                    
                    receivedcell.sendername.text = "\(UserFavLists[indexPath.row].listreceivedfrom[1]) (\(email))"
                    
                    let dateFormatter1 = NSDateFormatter()
                    dateFormatter1.dateFormat = "dd MMM yyyy"
                    let date1 = dateFormatter1.stringFromDate(UserFavLists[indexPath.row].listcreationdate)
                    receivedcell.receivedlistdate.text = date1
                    
                    let allcount : String = String(UserFavLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserFavLists[indexPath.row].listcheckeditemscount)
                    
                    receivedcell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    receivedcell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).pcol]
                    receivedcell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).theangle
                    //
                    
                    return receivedcell
                    
                } else {
                    
                    
                    let cellIdentifier1 = "userlist"
                    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as!  ShopListCellNew

                    
                    let thiscolor : String = UserFavLists[indexPath.row].listcolorcode
                    cell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    
                    cell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    cell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    cell.ShopListNameButton.textColor = colorWithHexString(thiscolor)
                    
                    cell.ShopListNameButton.text = UserFavLists[indexPath.row].listname
                   // cell.shownote.addTarget(self, action: "shownotes:", forControlEvents: .TouchUpInside)
                    
                    //cell.newlisttype.image = shopicon
                    
                    if UserFavLists[indexPath.row].listtype == "Shop" {
                        cell.newlisttype.image = shopicon
                    } else {
                        cell.newlisttype.image = todoicon
                    }
                    

                   
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let date = dateFormatter.stringFromDate(UserFavLists[indexPath.row].listcreationdate)
                    cell.creationDate.text = date
                    
                    
                    if UserFavLists[indexPath.row].listisfavourite == true {
                        //favimage = UIImage(named: "ICFavStarActive") as UIImage!
                        //cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
                    } else {
                        //notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                    
                   // cell.addToFavOutlet.addTarget(self, action: "adddeletefav:", forControlEvents: .TouchUpInside)
                    
                    let allcount : String = String(UserFavLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserFavLists[indexPath.row].listcheckeditemscount)
                    
                    cell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    cell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).pcol]
                    cell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).theangle
                    //

                    
                    return cell
                }
                
            } else {
                
                
                
                
              
                
                if UserLists[indexPath.row].listisreceived == true {
                    
                     let receivedcell  = tableView.dequeueReusableCellWithIdentifier("receivedlist", forIndexPath: indexPath) as! ReceivedListOld
                   

                    receivedcell.receivedlistnamebutton.text = UserLists[indexPath.row].listname
                    
                    let thiscolor : String = UserLists[indexPath.row].listcolorcode
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    
                    receivedcell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    receivedcell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    receivedcell.receivedlistnamebutton.textColor = colorWithHexString(thiscolor)

                    
                
                    
                    receivedcell.acceptlist.addTarget(self, action: "newsavereceivedlist:", forControlEvents: .TouchUpInside)
                    
                    /*
                    if UserLists[indexPath.row].listconfirmreception == true {
                        
                        if UserLists[indexPath.row].listtype == "Shop" {
                            receivedcell.newlisttype.image = shopicon
                        } else {
                            receivedcell.newlisttype.image = todoicon
                        }
                    } else {
                        receivedcell.newlisttype.image = receivedicon
                    }
                    */
                    
                    receivedcell.newlisttype.image = receivedicon
                    
                    if UserLists[indexPath.row].listconfirmreception == true {
                        

                        receivedcell.addtofavs.hidden  = false
                        receivedcell.acceptlist.hidden = true
                        receivedcell.acceptlabel.hidden = true
                        
                    } else {

                        receivedcell.addtofavs.hidden  = true
                        receivedcell.acceptlist.hidden = false
                        receivedcell.acceptlabel.hidden = false
                    }
                    
                    
                    if UserLists[indexPath.row].listisfavourite == true {
                        //favimage = UIImage(named: "ICFavStarActive") as UIImage!
                        //receivedcell.addtofavs.setImage(favimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xA2AF36)
                        
                    } else {
                       // notfavimage = UIImage(named: "ICFavStar") as UIImage!
                       // receivedcell.addtofavs.setImage(notfavimage, forState: UIControlState.Normal)
                        receivedcell.addtofavs.tintColor = UIColorFromRGB(0xD9D9D9)
                        
                    }
                    
                    
                    
                   // receivedcell.addtofavs.addTarget(self, action: "adddeletereceivedfav:", forControlEvents: .TouchUpInside)

            
                    
                    
                    var email = String()
                    if UserLists[indexPath.row].listreceivedfrom[2] != "default@default.com" {

                        email = UserLists[indexPath.row].listreceivedfrom[2]
                    } else {

                        email = NSLocalizedString("Anonymous", comment: "")
                    }
                    
                    
                    receivedcell.sendername.text = "\(UserLists[indexPath.row].listreceivedfrom[1]) (\(email))"
                    

                    
                    let dateFormatter1 = NSDateFormatter()
                    dateFormatter1.dateFormat = "dd MMM yyyy"
                    let date1 = dateFormatter1.stringFromDate(UserLists[indexPath.row].listcreationdate)
                    receivedcell.receivedlistdate.text = date1
                    
                    let allcount : String = String(UserLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserLists[indexPath.row].listcheckeditemscount)
                    
                    receivedcell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    
                    // Progress change
                    
                    receivedcell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).pcol]
                    receivedcell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: receivedcell.percents).theangle
                    //
                    
                    return receivedcell
                    
                } else {
                    //usual list
                    
                    let cellIdentifier1 = "userlist"
                    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as!  ShopListCellNew
                    
                  
                    
                    cell.ShopListNameButton.text = UserLists[indexPath.row].listname
                 
                    
                    let thiscolor : String = UserLists[indexPath.row].listcolorcode
                    cell.colorcodeviewoutlet.backgroundColor = colorWithHexString(thiscolor)
                    
                    cell.storyline.backgroundColor = colorWithHexString(thiscolor)
                    cell.newlisttype.tintColor = colorWithHexString(thiscolor)
                    
                    
                    cell.ShopListNameButton.textColor = colorWithHexString(thiscolor)

                    
                   // cell.shownote.addTarget(self, action: "shownotes:", forControlEvents: .TouchUpInside)
                    
                    
                    if UserLists[indexPath.row].listtype == "Shop" {
                        cell.newlisttype.image = shopicon
                    } else {
                        cell.newlisttype.image = todoicon
                    }
                 
            
                    
                    
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd MMM yyyy"
                    let date = dateFormatter.stringFromDate(UserLists[indexPath.row].listcreationdate)
                    cell.creationDate.text = date
                    
                    
                    if UserLists[indexPath.row].listisfavourite == true {
                      //  favimage = UIImage(named: "ICFavStarActive") as UIImage!
                      //  cell.addToFavOutlet.setImage(favimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xA2AF36)
                    } else {
                      //  notfavimage = UIImage(named: "ICFavStar") as UIImage!
                      //  cell.addToFavOutlet.setImage(notfavimage, forState: UIControlState.Normal)
                        
                        cell.addToFavOutlet.tintColor = UIColorFromRGB(0xD9D9D9)
                    }
                    
                    
                   // cell.addToFavOutlet.addTarget(self, action: "adddeletefav:", forControlEvents: .TouchUpInside)
                    
                    let allcount : String = String(UserLists[indexPath.row].listitemscount)
                    let checkedcount : String = String(UserLists[indexPath.row].listcheckeditemscount)
                    
                    cell.itemscount.text = "\(allcount)/\(checkedcount)"
                    
                    // Progress change
                    
                    cell.progresscircle.progressColors = [changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).pcol]
                    cell.progresscircle.angle = changeprogress(UserLists[indexPath.row].listitemscount, checked: UserLists[indexPath.row].listcheckeditemscount, thelabel: cell.percents).theangle
                    //

                    
                    
                    return cell
                    
                }
                
        
        
        }
    }


}
