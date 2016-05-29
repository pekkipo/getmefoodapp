//
//  ShoppingListCreation.swift
//  ParseStarterProject
//
//  Created by Aleksei Petukhov on 21/07/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ASHorizontalScrollView

import Foundation
/*
var customcategories = [Category]()

var catalogcategories = [
Category(catId:"DefaultOthers",catname:"Others",catimage:UIImage(named: "restau.png")!,isCustom:false),
Category(catId:"DefaultVegetables",catname:"Vegetables",catimage:UIImage(named: "veg_icon.jpg")!,isCustom:false),
Category(catId:"DefaultFruits",catname:"Fruits",catimage:UIImage(named: "fruits_icon.jpg")!,isCustom:false),
Category(catId:"DefaultBeverages",catname:"Beverages",catimage:UIImage(named: "check.png")!,isCustom:false),
Category(catId:"DefaultPoultry",catname:"Poultry",catimage:UIImage(named: "testimage.png")!,isCustom:false),
Category(catId:"DefaultDomesticStuff",catname:"Domestic stuff",catimage:UIImage(named: "testimage.png")!,isCustom:false)
]
*/

var messageimage : UIImage = UIImage(named: "Tutorial5")!

var customcatalogitems = [CatalogItem]()


var catalogitems = [
    CatalogItem(itemId:"CatalogVegetables",itemname:NSLocalizedString("vegetables", comment: ""),itemimage:UIImage(named: "icvegetables")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"ictomatoes",itemname:NSLocalizedString("tomatoes", comment: ""),itemimage:UIImage(named: "ictomatoes")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCucumbers",itemname:NSLocalizedString("cucumbers", comment: ""),itemimage:UIImage(named: "iccucumbers")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBrocolli",itemname:NSLocalizedString("brocolli", comment: ""),itemimage:UIImage(named: "icbroccoli")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCarrot",itemname:NSLocalizedString("carrot", comment: ""),itemimage:UIImage(named: "iccarrot")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLettuce",itemname:NSLocalizedString("lettuce", comment: ""),itemimage:UIImage(named: "icsalad")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCabbage",itemname:NSLocalizedString("cabbage", comment: ""),itemimage:UIImage(named: "iccabbage")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMushrooms",itemname:NSLocalizedString("mushrooms", comment: ""),itemimage:UIImage(named: "icmushrooms")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOnion",itemname:NSLocalizedString("onion", comment: ""),itemimage:UIImage(named: "iconion")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPotato",itemname:NSLocalizedString("potato", comment: ""),itemimage:UIImage(named: "icpotato")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSpinach",itemname:NSLocalizedString("spinach", comment: ""),itemimage:UIImage(named: "icspinage")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogEggplant",itemname:NSLocalizedString("eggplant", comment: ""),itemimage:UIImage(named: "iceggplant")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPumpkin",itemname:NSLocalizedString("pumpkin", comment: ""),itemimage:UIImage(named: "icpumpkin")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRadish",itemname:NSLocalizedString("radish", comment: ""),itemimage:UIImage(named: "icradish")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGarlic",itemname:NSLocalizedString("garlic", comment: ""),itemimage:UIImage(named: "icgarlic")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGreenBeans",itemname:NSLocalizedString("greenbeans", comment: ""),itemimage:UIImage(named: "icgreenbeans")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBellPepper",itemname:NSLocalizedString("bellpepper", comment: ""),itemimage:UIImage(named: "icpepper")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCorn",itemname:NSLocalizedString("corn", comment: ""),itemimage:UIImage(named: "iccorn")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCelery",itemname:NSLocalizedString("celery", comment: ""),itemimage:UIImage(named: "iccelery")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBeans",itemname:NSLocalizedString("beans", comment: ""),itemimage:UIImage(named: "icbeans")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAsparagus",itemname:NSLocalizedString("asparagus", comment: ""),itemimage:UIImage(named: "icasparagus")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBeetroot",itemname:NSLocalizedString("beetroot", comment: ""),itemimage:UIImage(named: "icbeetroot")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCauliflower",itemname:NSLocalizedString("cauliflower", comment: ""),itemimage:UIImage(named: "iccauliflower")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCherryTomatoes",itemname:NSLocalizedString("cherrytomatoes", comment: ""),itemimage:UIImage(named: "iccherrytomatoes")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChillies",itemname:NSLocalizedString("chillies", comment: ""),itemimage:UIImage(named: "icchillies")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogCilantro",itemname:NSLocalizedString("cilantro", comment: ""),itemimage:UIImage(named: "iccilantro")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogZucchini",itemname:NSLocalizedString("zucchini", comment: ""),itemimage:UIImage(named: "iczucchini")!,itemcategory:catalogcategories[1], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogFruits",itemname:NSLocalizedString("fruits", comment: ""),itemimage:UIImage(named: "icfruits")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogApples",itemname:NSLocalizedString("apples", comment: ""),itemimage:UIImage(named: "icapples")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOranges",itemname:NSLocalizedString("oranges", comment: ""),itemimage:UIImage(named: "icoranges")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLemons",itemname:NSLocalizedString("lemons", comment: ""),itemimage:UIImage(named: "iclemons")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLimes",itemname:NSLocalizedString("limes", comment: ""),itemimage:UIImage(named: "iclimes")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBananas",itemname:NSLocalizedString("bananas", comment: ""),itemimage:UIImage(named: "icbananas")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCherries",itemname:NSLocalizedString("cherries", comment: ""),itemimage:UIImage(named: "iccherries")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGrapefruits",itemname:NSLocalizedString("grapefruits", comment: ""),itemimage:UIImage(named: "icgrapefruits")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGrapes",itemname:NSLocalizedString("grapes", comment: ""),itemimage:UIImage(named: "icgrapes")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogKiwi",itemname:NSLocalizedString("kiwi", comment: ""),itemimage:UIImage(named: "ickiwi")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTangerines",itemname:NSLocalizedString("tangerines", comment: ""),itemimage:UIImage(named: "ictangerines")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMango",itemname:NSLocalizedString("mango", comment: ""),itemimage:UIImage(named: "icmango")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAvocado",itemname:NSLocalizedString("avocado", comment: ""),itemimage:UIImage(named: "icavocado")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMelons",itemname:NSLocalizedString("melons", comment: ""),itemimage:UIImage(named: "icmelons")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogStrawberries",itemname:NSLocalizedString("strawberries", comment: ""),itemimage:UIImage(named: "icstrawberries")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBlueberries",itemname:NSLocalizedString("blueberries", comment: ""),itemimage:UIImage(named: "icblueberry")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRaspberries",itemname:NSLocalizedString("raspberries", comment: ""),itemimage:UIImage(named: "icraspberry")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBlackberries",itemname:NSLocalizedString("blackberries", comment: ""),itemimage:UIImage(named: "icblackberry")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWatermelon",itemname:NSLocalizedString("watermelon", comment: ""),itemimage:UIImage(named: "icwatermelon")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPeaches",itemname:NSLocalizedString("peaches", comment: ""),itemimage:UIImage(named: "icpeaches")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPears",itemname:NSLocalizedString("pears", comment: ""),itemimage:UIImage(named: "icpears")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPineapples",itemname:NSLocalizedString("pineapples", comment: ""),itemimage:UIImage(named: "icpineapples")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNectarines",itemname:NSLocalizedString("nectarines", comment: ""),itemimage:UIImage(named: "icnektarines")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPlums",itemname:NSLocalizedString("plums", comment: ""),itemimage:UIImage(named: "icplums")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPapaya",itemname:NSLocalizedString("papaya", comment: ""),itemimage:UIImage(named: "icpapaya")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFigs",itemname:NSLocalizedString("figs", comment: ""),itemimage:UIImage(named: "icfigs")!,itemcategory:catalogcategories[2], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogDairy",itemname:NSLocalizedString("dairy", comment: ""),itemimage:UIImage(named: "icdairy")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMilk",itemname:NSLocalizedString("milk", comment: ""),itemimage:UIImage(named: "icmilk")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogButter",itemname:NSLocalizedString("butter", comment: ""),itemimage:UIImage(named: "icbutter")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCheese",itemname:NSLocalizedString("cheese", comment: ""),itemimage:UIImage(named: "iccheese")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCream",itemname:NSLocalizedString("cream", comment: ""),itemimage:UIImage(named: "iccream")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCreamcheese",itemname:NSLocalizedString("creamcheese", comment: ""),itemimage:UIImage(named: "iccreamcheese")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogEggs",itemname:NSLocalizedString("eggs", comment: ""),itemimage:UIImage(named: "iceggs")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFeta",itemname:NSLocalizedString("feta", comment: ""),itemimage:UIImage(named: "icfeta")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogParmesan",itemname:NSLocalizedString("parmesan", comment: ""),itemimage:UIImage(named: "icparmesan")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMargarine",itemname:NSLocalizedString("margarine", comment: ""),itemimage:UIImage(named: "icmargarine")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMascarpone",itemname:NSLocalizedString("mascarpone", comment: ""),itemimage:UIImage(named: "icmascarpone")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMozarella",itemname:NSLocalizedString("mozarella", comment: ""),itemimage:UIImage(named: "icmozarella")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRicotta",itemname:NSLocalizedString("ricotta", comment: ""),itemimage:UIImage(named: "icricotta")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSourcream",itemname:NSLocalizedString("sourcream", comment: ""),itemimage:UIImage(named: "icsourcream")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSoymilk",itemname:NSLocalizedString("soymilk", comment: ""),itemimage:UIImage(named: "icsoymilk")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogYogurt",itemname:NSLocalizedString("yogurt", comment: ""),itemimage:UIImage(named: "icyogurt")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSchreddedcheese",itemname:NSLocalizedString("schreddedcheese", comment: ""),itemimage:UIImage(named: "icgratedcheese")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPudding",itemname:NSLocalizedString("pudding", comment: ""),itemimage:UIImage(named: "icpuding")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDrinkingyogurt",itemname:NSLocalizedString("drinkingyougurt", comment: ""),itemimage:UIImage(named: "icdrinkingyogurt")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCottagecheese",itemname:NSLocalizedString("cottagecheese", comment: ""),itemimage:UIImage(named: "iccottagecheese")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogKefir",itemname:NSLocalizedString("kefir", comment: ""),itemimage:UIImage(named: "ickefir")!,itemcategory:catalogcategories[3], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogMeat",itemname:NSLocalizedString("meat", comment: ""),itemimage:UIImage(named: "icmeat")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBeef",itemname:NSLocalizedString("beef", comment: ""),itemimage:UIImage(named: "icbeef")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChicken",itemname:NSLocalizedString("chicken", comment: ""),itemimage:UIImage(named: "icchicken2")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGroundbeef",itemname:NSLocalizedString("groundbeef", comment: ""),itemimage:UIImage(named: "icgroundbeef")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSteak",itemname:NSLocalizedString("steak", comment: ""),itemimage:UIImage(named: "icsteak")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTurkey",itemname:NSLocalizedString("turkey", comment: ""),itemimage:UIImage(named: "icturkey")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPork",itemname:NSLocalizedString("pork", comment: ""),itemimage:UIImage(named: "icpork")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPorkchops",itemname:NSLocalizedString("porkchops", comment: ""),itemimage:UIImage(named: "icporkchop")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSausages",itemname:NSLocalizedString("sausages", comment: ""),itemimage:UIImage(named: "icsausages")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDuck",itemname:NSLocalizedString("duck", comment: ""),itemimage:UIImage(named: "icduck")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBacon",itemname:NSLocalizedString("bacon", comment: ""),itemimage:UIImage(named: "icbacon")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChickenbreast",itemname:NSLocalizedString("chickenbreast", comment: ""),itemimage:UIImage(named: "icchickenbreast")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHam",itemname:NSLocalizedString("ham", comment: ""),itemimage:UIImage(named: "ickolbasa")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogProsciutto",itemname:NSLocalizedString("prosciutto", comment: ""),itemimage:UIImage(named: "icprosciutto")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSalami",itemname:NSLocalizedString("salami", comment: ""),itemimage:UIImage(named: "icsalami")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogVeal",itemname:NSLocalizedString("veal", comment: ""),itemimage:UIImage(named: "icveal")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBarbeque",itemname:NSLocalizedString("barbeque", comment: ""),itemimage:UIImage(named: "icbbq")!,itemcategory:catalogcategories[4], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogSeafood",itemname:NSLocalizedString("seafood", comment: ""),itemimage:UIImage(named: "icseafood")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAnchovies",itemname:NSLocalizedString("anchovies", comment: ""),itemimage:UIImage(named: "icanchovies")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFish",itemname:NSLocalizedString("fish", comment: ""),itemimage:UIImage(named: "icfish")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSalmon",itemname:NSLocalizedString("salmon", comment: ""),itemimage:UIImage(named: "icsalmon")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLobsters",itemname:NSLocalizedString("lobsters", comment: ""),itemimage:UIImage(named: "iclobsters")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSchrimps",itemname:NSLocalizedString("schrimps", comment: ""),itemimage:UIImage(named: "icshrimps")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOysters",itemname:NSLocalizedString("oysters", comment: ""),itemimage:UIImage(named: "icoysters")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTuna",itemname:NSLocalizedString("tuna", comment: ""),itemimage:UIImage(named: "ictuna")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogClams",itemname:NSLocalizedString("clams", comment: ""),itemimage:UIImage(named: "icclams")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogScallops",itemname:NSLocalizedString("scallops", comment: ""),itemimage:UIImage(named: "icscallops")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCodfish",itemname:NSLocalizedString("codfish", comment: ""),itemimage:UIImage(named: "iccodfish")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPinksalmon",itemname:NSLocalizedString("pinksalmon", comment: ""),itemimage:UIImage(named: "icpinksalmon")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSprats",itemname:NSLocalizedString("sprats", comment: ""),itemimage:UIImage(named: "icsprats")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHerring",itemname:NSLocalizedString("herring", comment: ""),itemimage:UIImage(named: "icherring")!,itemcategory:catalogcategories[5], itemischecked:false, itemaddedid: ""),
    
    
    
    CatalogItem(itemId:"CatalogBread",itemname:NSLocalizedString("bread", comment: ""),itemimage:UIImage(named: "icbread")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"Catalogbreadrolls",itemname:NSLocalizedString("breadrolls", comment: ""),itemimage:UIImage(named: "icbreadrolls")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHamburgerbuns",itemname:NSLocalizedString("hamburgerbuns", comment: ""),itemimage:UIImage(named: "icburgerbuns")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBagels",itemname:NSLocalizedString("bagels", comment: ""),itemimage:UIImage(named: "icbagels")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPie",itemname:NSLocalizedString("pie", comment: ""),itemimage:UIImage(named: "icpie")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDarkbread",itemname:NSLocalizedString("darkbread", comment: ""),itemimage:UIImage(named: "ichleb")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCookies",itemname:NSLocalizedString("cookies", comment: ""),itemimage:UIImage(named: "iccookies")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCakes",itemname:NSLocalizedString("cakes", comment: ""),itemimage:UIImage(named: "iccake")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWaffels",itemname:NSLocalizedString("waffles", comment: ""),itemimage:UIImage(named: "icwaffles")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPretzels",itemname:NSLocalizedString("pretzels", comment: ""),itemimage:UIImage(named: "icpretzels")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCroissants",itemname:NSLocalizedString("croissants", comment: ""),itemimage:UIImage(named: "iccroissants")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBiscuits",itemname:NSLocalizedString("biscuits", comment: ""),itemimage:UIImage(named: "icbiscuit")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCrispbread",itemname:NSLocalizedString("crispbread", comment: ""),itemimage:UIImage(named: "iccrispbread")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMuffins",itemname:NSLocalizedString("muffins", comment: ""),itemimage:UIImage(named: "icmuffin")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToasts",itemname:NSLocalizedString("toasts", comment: ""),itemimage:UIImage(named: "ictoasts")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPizzadough",itemname:NSLocalizedString("pizzadough", comment: ""),itemimage:UIImage(named: "icpizzadough")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSlicedbread",itemname:NSLocalizedString("slicedbread", comment: ""),itemimage:UIImage(named: "icslicedbread")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTortillas",itemname:NSLocalizedString("tortillas", comment: ""),itemimage:UIImage(named: "ictortillas")!,itemcategory:catalogcategories[6], itemischecked:false, itemaddedid: ""),
    
    
    CatalogItem(itemId:"CatalogSnacks",itemname:NSLocalizedString("snacks", comment: ""),itemimage:UIImage(named: "icsnacks")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChips",itemname:NSLocalizedString("chips", comment: ""),itemimage:UIImage(named: "icchips")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDriedfruits",itemname:NSLocalizedString("driedfruits", comment: ""),itemimage:UIImage(named: "icdriedfruits")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCrackers",itemname:NSLocalizedString("crackers", comment: ""),itemimage:UIImage(named: "iccrackers")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNachoes",itemname:NSLocalizedString("nachoes", comment: ""),itemimage:UIImage(named: "icnachos")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPopcorn",itemname:NSLocalizedString("popcorn", comment: ""),itemimage:UIImage(named: "icpopcorn")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPeanuts",itemname:NSLocalizedString("peanuts", comment: ""),itemimage:UIImage(named: "icpeanuts")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNuts",itemname:NSLocalizedString("nuts", comment: ""),itemimage:UIImage(named: "icnuts")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPistachios",itemname:NSLocalizedString("pistachios", comment: ""),itemimage:UIImage(named: "icpistachos")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCahsews",itemname:NSLocalizedString("cashews", comment: ""),itemimage:UIImage(named: "iccashews")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGreenolives",itemname:NSLocalizedString("greenolives", comment: ""),itemimage:UIImage(named: "icolives")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBlackolives",itemname:NSLocalizedString("blackolives", comment: ""),itemimage:UIImage(named: "icblackolives")!,itemcategory:catalogcategories[7], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogBeverages",itemname:NSLocalizedString("beverages", comment: ""),itemimage:UIImage(named: "icbeverages")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWater",itemname:NSLocalizedString("water", comment: ""),itemimage:UIImage(named: "icwater")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMineralwater",itemname:NSLocalizedString("mineralwater", comment: ""),itemimage:UIImage(named: "icmineralwater")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogJuice",itemname:NSLocalizedString("juice", comment: ""),itemimage:UIImage(named: "icjuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOrangejuice",itemname:NSLocalizedString("orangejuice", comment: ""),itemimage:UIImage(named: "icorangejuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogApplejuice",itemname:NSLocalizedString("applejuice", comment: ""),itemimage:UIImage(named: "icapplejuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCherryjuice",itemname:NSLocalizedString("cherryjuice", comment: ""),itemimage:UIImage(named: "iccherryjuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGrapejuice",itemname:NSLocalizedString("grapejuice", comment: ""),itemimage:UIImage(named: "icgrapejuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLemonjuice",itemname:NSLocalizedString("lemonjuice", comment: ""),itemimage:UIImage(named: "iclemonjuice")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCocacola",itemname:NSLocalizedString("cocacola", comment: ""),itemimage:UIImage(named: "iccocacola")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPepsi",itemname:NSLocalizedString("pepsi", comment: ""),itemimage:UIImage(named: "icpepsi")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLemonade",itemname:NSLocalizedString("lemonade", comment: ""),itemimage:UIImage(named: "iclemonade")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDrpepper",itemname:NSLocalizedString("drpepper", comment: ""),itemimage:UIImage(named: "icdrpepper")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"Catalog5lwater",itemname:NSLocalizedString("5lwater", comment: ""),itemimage:UIImage(named: "ic5lwater")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTea",itemname:NSLocalizedString("tea", comment: ""),itemimage:UIImage(named: "ictea")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCoffee",itemname:NSLocalizedString("coffee", comment: ""),itemimage:UIImage(named: "iccoffee")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogIcetea",itemname:NSLocalizedString("icetea", comment: ""),itemimage:UIImage(named: "icicetea")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCider",itemname:NSLocalizedString("cider", comment: ""),itemimage:UIImage(named: "iccider")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHotchocolade",itemname:NSLocalizedString("hotchocolate", comment: ""),itemimage:UIImage(named: "ichotchocolate")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogEnergydrink",itemname:NSLocalizedString("energydrink", comment: ""),itemimage:UIImage(named: "icenergy")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSportdrink",itemname:NSLocalizedString("sportdrink", comment: ""),itemimage:UIImage(named: "icsportdrink")!,itemcategory:catalogcategories[8], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogAlcohol",itemname:NSLocalizedString("alcohol", comment: ""),itemimage:UIImage(named: "icalcohol")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBeer",itemname:NSLocalizedString("beer", comment: ""),itemimage:UIImage(named: "icbeer")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChampagne",itemname:NSLocalizedString("champagne", comment: ""),itemimage:UIImage(named: "icchampagne")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogVodka",itemname:NSLocalizedString("vodka", comment: ""),itemimage:UIImage(named: "icvodka")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRedrum",itemname:NSLocalizedString("redrum", comment: ""),itemimage:UIImage(named: "icredrum")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWhiterum",itemname:NSLocalizedString("whiterum", comment: ""),itemimage:UIImage(named: "icwhiterum")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTequila",itemname:NSLocalizedString("tequila", comment: ""),itemimage:UIImage(named: "ictequila")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWhiskey",itemname:NSLocalizedString("whiskey", comment: ""),itemimage:UIImage(named: "icwhiskey")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGin",itemname:NSLocalizedString("gin", comment: ""),itemimage:UIImage(named: "icgin")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTonic",itemname:NSLocalizedString("tonic", comment: ""),itemimage:UIImage(named: "ictonic")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogProsecco",itemname:NSLocalizedString("prosecco", comment: ""),itemimage:UIImage(named: "icprosecco")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWine",itemname:NSLocalizedString("justwine", comment: ""),itemimage:UIImage(named: "icredwine")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRedwine",itemname:NSLocalizedString("redwine", comment: ""),itemimage:UIImage(named: "icredwine")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWhitewine",itemname:NSLocalizedString("whitewine", comment: ""),itemimage:UIImage(named: "icwhitewine")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPinkwine",itemname:NSLocalizedString("pinkwine", comment: ""),itemimage:UIImage(named: "icpinkwine")!,itemcategory:catalogcategories[9], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogCereals",itemname:NSLocalizedString("cereals", comment: ""),itemimage:UIImage(named: "iccereals")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHoney",itemname:NSLocalizedString("honey", comment: ""),itemimage:UIImage(named: "ichoney")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOatmeal",itemname:NSLocalizedString("oatmeal", comment: ""),itemimage:UIImage(named: "icoatmeal")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCornflakes",itemname:NSLocalizedString("cornflakes", comment: ""),itemimage:UIImage(named: "iccornflakes")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNesquick",itemname:NSLocalizedString("nesquick", comment: ""),itemimage:UIImage(named: "icnesquick")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGranola",itemname:NSLocalizedString("granola", comment: ""),itemimage:UIImage(named: "icgranola")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogJam",itemname:NSLocalizedString("jam", comment: ""),itemimage:UIImage(named: "icjam")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMuesli",itemname:NSLocalizedString("muesli", comment: ""),itemimage:UIImage(named: "icmuesli")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPorridge",itemname:NSLocalizedString("porridge", comment: ""),itemimage:UIImage(named: "icporridge")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPancakes",itemname:NSLocalizedString("pancakes", comment: ""),itemimage:UIImage(named: "icpancakes")!,itemcategory:catalogcategories[10], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogSweets",itemname:NSLocalizedString("sweets", comment: ""),itemimage:UIImage(named: "icsweets")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChocolate",itemname:NSLocalizedString("chocolate", comment: ""),itemimage:UIImage(named: "icchocolate")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCandy",itemname:NSLocalizedString("candy", comment: ""),itemimage:UIImage(named: "iccandy")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChewinggum",itemname:NSLocalizedString("chewinggum", comment: ""),itemimage:UIImage(named: "icchewinggum")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNougat",itemname:NSLocalizedString("nougatcreme", comment: ""),itemimage:UIImage(named: "icnougatcreme")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChocolatecream",itemname:NSLocalizedString("chocolatecream", comment: ""),itemimage:UIImage(named: "icchocolatecream")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDessert",itemname:NSLocalizedString("dessert", comment: ""),itemimage:UIImage(named: "icdessert")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogChristmascookies",itemname:NSLocalizedString("christmascookies", comment: ""),itemimage:UIImage(named: "icchristmascookies")!,itemcategory:catalogcategories[11], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogOil",itemname:NSLocalizedString("oil", comment: ""),itemimage:UIImage(named: "icoil")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogOliveoil",itemname:NSLocalizedString("oliveoil", comment: ""),itemimage:UIImage(named: "icoliveoil")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSpices",itemname:NSLocalizedString("spices", comment: ""),itemimage:UIImage(named: "icspices")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSalt",itemname:NSLocalizedString("salt", comment: ""),itemimage:UIImage(named: "icsalt")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSugar",itemname:NSLocalizedString("sugar", comment: ""),itemimage:UIImage(named: "icsugar")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPepper",itemname:NSLocalizedString("pepper", comment: ""),itemimage:UIImage(named: "icsmallpepper")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogMayonnaise",itemname:NSLocalizedString("mayonnaise", comment: ""),itemimage:UIImage(named: "icmayonnaise")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMustard",itemname:NSLocalizedString("mustard", comment: ""),itemimage:UIImage(named: "icmustard")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogKetchup",itemname:NSLocalizedString("ketchup", comment: ""),itemimage:UIImage(named: "icketchup")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSalsa",itemname:NSLocalizedString("salsa", comment: ""),itemimage:UIImage(named: "icsalsasauce")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPastasauce",itemname:NSLocalizedString("pastasauce", comment: ""),itemimage:UIImage(named: "icpastasauce")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSeasonings",itemname:NSLocalizedString("seasonings", comment: ""),itemimage:UIImage(named: "icseasonings")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSyrup",itemname:NSLocalizedString("syrup", comment: ""),itemimage:UIImage(named: "icsyrup")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSoysauce",itemname:NSLocalizedString("soysauce", comment: ""),itemimage:UIImage(named: "icsoysauce")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBrownsugar",itemname:NSLocalizedString("brownsugar", comment: ""),itemimage:UIImage(named: "icbrownsugar")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFlour",itemname:NSLocalizedString("flour", comment: ""),itemimage:UIImage(named: "icflour")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogJelly",itemname:NSLocalizedString("jelly", comment: ""),itemimage:UIImage(named: "icjelly")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPeanutbutter",itemname:NSLocalizedString("peanutbutter", comment: ""),itemimage:UIImage(named: "icpeanutbutter")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBbqsauce",itemname:NSLocalizedString("bbqsauce", comment: ""),itemimage:UIImage(named: "icbbqsauce")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBakingpowder",itemname:NSLocalizedString("bakingpowder", comment: ""),itemimage:UIImage(named: "icbakingpowder")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBalsamicvinegar",itemname:NSLocalizedString("balsamicvinegar", comment: ""),itemimage:UIImage(named: "icbalsamicvinegar")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSoda2",itemname:NSLocalizedString("soda2", comment: ""),itemimage:UIImage(named: "icsoda2")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBreadcrumbs",itemname:NSLocalizedString("breadcrumbs", comment: ""),itemimage:UIImage(named: "icbreadcrumbs")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCinnamon",itemname:NSLocalizedString("cinnamon", comment: ""),itemimage:UIImage(named: "iccinnamon")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMaplesyrup",itemname:NSLocalizedString("maplesyrup", comment: ""),itemimage:UIImage(named: "icmaplesyrup")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPaprika",itemname:NSLocalizedString("paprika", comment: ""),itemimage:UIImage(named: "icpaprika")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSaladdressing",itemname:NSLocalizedString("saladdressing", comment: ""),itemimage:UIImage(named: "icsaladdressing")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogVanilla",itemname:NSLocalizedString("vanilla", comment: ""),itemimage:UIImage(named: "icvanilla")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogYeast",itemname:NSLocalizedString("yeast", comment: ""),itemimage:UIImage(named: "icyeast")!,itemcategory:catalogcategories[12], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogCannedfood",itemname:NSLocalizedString("cannedfood", comment: ""),itemimage:UIImage(named: "iccannedfood")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCannedbeans",itemname:NSLocalizedString("cannedbeans", comment: ""),itemimage:UIImage(named: "iccannedbeans")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCannedcorn",itemname:NSLocalizedString("cannedcorn", comment: ""),itemimage:UIImage(named: "iccannedcorn")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCannedfruits",itemname:NSLocalizedString("cannedfruits", comment: ""),itemimage:UIImage(named: "iccannedfruits")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCannedfish",itemname:NSLocalizedString("cannedfish", comment: ""),itemimage:UIImage(named: "iccannedfish")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCannedsoup",itemname:NSLocalizedString("cannedsoup", comment: ""),itemimage:UIImage(named: "iccannedsoup")!,itemcategory:catalogcategories[13], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogPastamacaroni",itemname:NSLocalizedString("pastamacaroni", comment: ""),itemimage:UIImage(named: "icpasta")!,itemcategory:catalogcategories[14], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSpaghetti",itemname:NSLocalizedString("spaghetti", comment: ""),itemimage:UIImage(named: "icspaghetti")!,itemcategory:catalogcategories[14], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNoodles",itemname:NSLocalizedString("noodles", comment: ""),itemimage:UIImage(named: "icnoodles")!,itemcategory:catalogcategories[14], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogVermicelli",itemname:NSLocalizedString("vermicelli", comment: ""),itemimage:UIImage(named: "icvermicelli")!,itemcategory:catalogcategories[14], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogGrains",itemname:NSLocalizedString("grains", comment: ""),itemimage:UIImage(named: "icgrains")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRice",itemname:NSLocalizedString("rice", comment: ""),itemimage:UIImage(named: "icrice")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBrownrice",itemname:NSLocalizedString("brownrice", comment: ""),itemimage:UIImage(named: "icbrownrice")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCouscous",itemname:NSLocalizedString("couscous", comment: ""),itemimage:UIImage(named: "iccouscous")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogRisottorice",itemname:NSLocalizedString("risottorice", comment: ""),itemimage:UIImage(named: "icrisotto")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWildrice",itemname:NSLocalizedString("wildrice", comment: ""),itemimage:UIImage(named: "icwildrice")!,itemcategory:catalogcategories[15], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogFrozengoods",itemname:NSLocalizedString("frozengoods", comment: ""),itemimage:UIImage(named: "icfrozenfood")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogIcecream",itemname:NSLocalizedString("icecream", comment: ""),itemimage:UIImage(named: "icicecream")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenfruits",itemname:NSLocalizedString("frozenfruits", comment: ""),itemimage:UIImage(named: "icfrozenfruits")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenvegetables",itemname:NSLocalizedString("frozenvegetables", comment: ""),itemimage:UIImage(named: "icfrozenvegetables")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPizza",itemname:NSLocalizedString("frozenpizza", comment: ""),itemimage:UIImage(named: "icfrozenpizza")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenmeals",itemname:NSLocalizedString("frozenmeals", comment: ""),itemimage:UIImage(named: "icfrozenmeals")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenfish",itemname:NSLocalizedString("frozenfish", comment: ""),itemimage:UIImage(named: "icfrozenfish")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenfries",itemname:NSLocalizedString("frozenfries", comment: ""),itemimage:UIImage(named: "icfrozenfries")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozennuggets",itemname:NSLocalizedString("frozennuggets", comment: ""),itemimage:UIImage(named: "icfrozennuggets")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFrozenpancakes",itemname:NSLocalizedString("frozenpancakes", comment: ""),itemimage:UIImage(named: "icfrozenpancakes")!,itemcategory:catalogcategories[16], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogBabyfood",itemname:NSLocalizedString("babyfood", comment: ""),itemimage:UIImage(named: "icbabyfood")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDiapers",itemname:NSLocalizedString("diapers", comment: ""),itemimage:UIImage(named: "icdiapers")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWipes",itemname:NSLocalizedString("wipes", comment: ""),itemimage:UIImage(named: "icbabywipes")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBabyshampoo",itemname:NSLocalizedString("babyshampoo", comment: ""),itemimage:UIImage(named: "icbabyshampoo")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBabysoap",itemname:NSLocalizedString("babysoap", comment: ""),itemimage:UIImage(named: "icbabysoap")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBabyoil",itemname:NSLocalizedString("babyoil", comment: ""),itemimage:UIImage(named: "icbabyoil")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBabypowder",itemname:NSLocalizedString("babypowder", comment: ""),itemimage:UIImage(named: "icbabypowder")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPacifiers",itemname:NSLocalizedString("pacifiers", comment: ""),itemimage:UIImage(named: "icpacifiers")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRashcream",itemname:NSLocalizedString("rashcream", comment: ""),itemimage:UIImage(named: "icrash")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSanitizer",itemname:NSLocalizedString("sanitizer", comment: ""),itemimage:UIImage(named: "icsanitizer")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToddler",itemname:NSLocalizedString("toddler", comment: ""),itemimage:UIImage(named: "ictoddler")!,itemcategory:catalogcategories[17], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogDogfood",itemname:NSLocalizedString("dogfood", comment: ""),itemimage:UIImage(named: "icdogfood")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCatfood",itemname:NSLocalizedString("catfood", comment: ""),itemimage:UIImage(named: "iccatfood")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBirdfood",itemname:NSLocalizedString("birdfood", comment: ""),itemimage:UIImage(named: "icbirdfood")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDogtreats",itemname:NSLocalizedString("dogtreats", comment: ""),itemimage:UIImage(named: "icdogtreats")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCattreats",itemname:NSLocalizedString("cattreats", comment: ""),itemimage:UIImage(named: "iccattreats")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFishfood",itemname:NSLocalizedString("fishfood", comment: ""),itemimage:UIImage(named: "icfishfood")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCatlitter",itemname:NSLocalizedString("catlitter", comment: ""),itemimage:UIImage(named: "iccatlitter")!,itemcategory:catalogcategories[18], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogBodylotion",itemname:NSLocalizedString("bodylotion", comment: ""),itemimage:UIImage(named: "icbodylotion")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogShampoo",itemname:NSLocalizedString("shampoo", comment: ""),itemimage:UIImage(named: "icshampoo")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHairconditioner",itemname:NSLocalizedString("hairconditioner", comment: ""),itemimage:UIImage(named: "ichairconditioner")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCondoms",itemname:NSLocalizedString("condoms", comment: ""),itemimage:UIImage(named: "iccondoms")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLenssolution",itemname:NSLocalizedString("lenssolution", comment: ""),itemimage:UIImage(named: "iclenssolution")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCottonpads",itemname:NSLocalizedString("cottonpads", comment: ""),itemimage:UIImage(named: "iccottonpads")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDentalfloss",itemname:NSLocalizedString("dentalfloss", comment: ""),itemimage:UIImage(named: "icdentalfloss")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCottonswabs",itemname:NSLocalizedString("cottonswabs", comment: ""),itemimage:UIImage(named: "iccottonswabs")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDeodorant",itemname:NSLocalizedString("deodorant", comment: ""),itemimage:UIImage(named: "icdeodorant")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFacecream",itemname:NSLocalizedString("facecream", comment: ""),itemimage:UIImage(named: "icfacecream")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFacialtissues",itemname:NSLocalizedString("facialtissues", comment: ""),itemimage:UIImage(named: "icfacialtissues")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToothpaste",itemname:NSLocalizedString("toothpaste", comment: ""),itemimage:UIImage(named: "ictoothpaste")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToothbrush",itemname:NSLocalizedString("toothbrush", comment: ""),itemimage:UIImage(named: "ictoothbrush")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHairgel",itemname:NSLocalizedString("hairgel", comment: ""),itemimage:UIImage(named: "ichairgel")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHairspray",itemname:NSLocalizedString("hairspray", comment: ""),itemimage:UIImage(named: "ichairspray")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogHandcream",itemname:NSLocalizedString("handcream", comment: ""),itemimage:UIImage(named: "ichandcream")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMouthwash",itemname:NSLocalizedString("mouthwash", comment: ""),itemimage:UIImage(named: "icmouthwash")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNailpolish",itemname:NSLocalizedString("nailpolish", comment: ""),itemimage:UIImage(named: "icnailpolish")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogNailpolishremover",itemname:NSLocalizedString("nailpolishremover", comment: ""),itemimage:UIImage(named: "icnailpolishremover")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRazor",itemname:NSLocalizedString("razor", comment: ""),itemimage:UIImage(named: "icrazor")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogRazorblades",itemname:NSLocalizedString("razorblades", comment: ""),itemimage:UIImage(named: "icrazorblades")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogShavingcream",itemname:NSLocalizedString("shavingcream", comment: ""),itemimage:UIImage(named: "icshavingcream")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogShowergel",itemname:NSLocalizedString("showergel", comment: ""),itemimage:UIImage(named: "icshowergel")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSoap",itemname:NSLocalizedString("soap", comment: ""),itemimage:UIImage(named: "icsoap")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSunscreen",itemname:NSLocalizedString("sunscreen", comment: ""),itemimage:UIImage(named: "icsunscreen")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTampons",itemname:NSLocalizedString("tampons", comment: ""),itemimage:UIImage(named: "ictampons")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTissues",itemname:NSLocalizedString("tissues", comment: ""),itemimage:UIImage(named: "ictissues")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWetwipes",itemname:NSLocalizedString("wetwipes", comment: ""),itemimage:UIImage(named: "icwetwipes")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAftershave",itemname:NSLocalizedString("aftershave", comment: ""),itemimage:UIImage(named: "icaftershave")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogMascara",itemname:NSLocalizedString("mascara", comment: ""),itemimage:UIImage(named: "icmascara")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogEyeshadow",itemname:NSLocalizedString("eyeshadow", comment: ""),itemimage:UIImage(named: "iceyeshadow")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLipstick",itemname:NSLocalizedString("lipstick", comment: ""),itemimage:UIImage(named: "iclipstick")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCottonballs",itemname:NSLocalizedString("cottonballs", comment: ""),itemimage:UIImage(named: "iccottonballs")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToothpicks",itemname:NSLocalizedString("toothpicks", comment: ""),itemimage:UIImage(named: "ictoothsticks")!,itemcategory:catalogcategories[19], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogMedications",itemname:NSLocalizedString("medications", comment: ""),itemimage:UIImage(named: "icmedications")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPlasters",itemname:NSLocalizedString("plasters", comment: ""),itemimage:UIImage(named: "icplasters")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPainreliever",itemname:NSLocalizedString("painreliever", comment: ""),itemimage:UIImage(named: "icpainrelievers")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogVitamins",itemname:NSLocalizedString("vitamins", comment: ""),itemimage:UIImage(named: "icvitamins")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAntiflewtreatments",itemname:NSLocalizedString("antiflewtreatments", comment: ""),itemimage:UIImage(named: "icantiflu")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPyretic",itemname:NSLocalizedString("pyretic", comment: ""),itemimage:UIImage(named: "icpyretic")!,itemcategory:catalogcategories[20], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogSponge",itemname:NSLocalizedString("sponge", comment: ""),itemimage:UIImage(named: "icsponge")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPapertowel",itemname:NSLocalizedString("papertowel", comment: ""),itemimage:UIImage(named: "icpapertowels")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToiletpaper",itemname:NSLocalizedString("toiletpaper", comment: ""),itemimage:UIImage(named: "ictoiletpaper")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDisinfectant",itemname:NSLocalizedString("disinfectant", comment: ""),itemimage:UIImage(named: "icdisinfectant")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLaundrypowder",itemname:NSLocalizedString("washingpowder", comment: ""),itemimage:UIImage(named: "iclaundrypowder")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLaundrydetergent",itemname:NSLocalizedString("laundrydetergent", comment: ""),itemimage:UIImage(named: "iclaundrydetergent")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDishsoap",itemname:NSLocalizedString("dishsoap", comment: ""),itemimage:UIImage(named: "icdishsoap")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWipes1",itemname:NSLocalizedString("wipes1", comment: ""),itemimage:UIImage(named: "icwipes1")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTrahsbugs",itemname:NSLocalizedString("trashbags", comment: ""),itemimage:UIImage(named: "ictrashbags")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBucket",itemname:NSLocalizedString("bucket", comment: ""),itemimage:UIImage(named: "icbucket")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogSqueegee",itemname:NSLocalizedString("squeegee", comment: ""),itemimage:UIImage(named: "icsqueegee")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLiquidsoap",itemname:NSLocalizedString("liquidsoap", comment: ""),itemimage:UIImage(named: "icliquidsoap")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogAluminiumfoil",itemname:NSLocalizedString("aluminiumfoil", comment: ""),itemimage:UIImage(named: "icaluminiumfoil")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBathroomcleaner",itemname:NSLocalizedString("bathroomcleaner", comment: ""),itemimage:UIImage(named: "icbathroomcleaner")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogToiletcleaner",itemname:NSLocalizedString("toiletcleaner", comment: ""),itemimage:UIImage(named: "ictoiletcleaner")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBatteries",itemname:NSLocalizedString("batteries", comment: ""),itemimage:UIImage(named: "icbatteries")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCandles",itemname:NSLocalizedString("candles", comment: ""),itemimage:UIImage(named: "iccandles")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogCharcoal",itemname:NSLocalizedString("charcoal", comment: ""),itemimage:UIImage(named: "iccharcoal")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDishwashersalt",itemname:NSLocalizedString("dishwashersalt", comment: ""),itemimage:UIImage(named: "icdishwashersalt")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDishwashertabs",itemname:NSLocalizedString("dishwashertabs", comment: ""),itemimage:UIImage(named: "icdishwashertabs")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogDishwashingliquid",itemname:NSLocalizedString("dishwashingliquid", comment: ""),itemimage:UIImage(named: "icdishliquid")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogFabricsoftener",itemname:NSLocalizedString("fabricsoftener", comment: ""),itemimage:UIImage(named: "icfabricsoftener")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogGlasscleaner",itemname:NSLocalizedString("glasscleaner", comment: ""),itemimage:UIImage(named: "icglasscleaner")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPlasticwrap",itemname:NSLocalizedString("plasticwrap", comment: ""),itemimage:UIImage(named: "icplasticwrap")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogWrappingpaper",itemname:NSLocalizedString("wrappingpaper", comment: ""),itemimage:UIImage(named: "icwrappingpaper")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogBrazier",itemname:NSLocalizedString("brazier", comment: ""),itemimage:UIImage(named: "icbrazier")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPlasticplates",itemname:NSLocalizedString("plasticplates", comment: ""),itemimage:UIImage(named: "icplasticplates")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogPlasticcups",itemname:NSLocalizedString("plasticcups", comment: ""),itemimage:UIImage(named: "icplasticcups")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogIgnition",itemname:NSLocalizedString("ignition", comment: ""),itemimage:UIImage(named: "icignition")!,itemcategory:catalogcategories[21], itemischecked:false, itemaddedid: ""),
    
    CatalogItem(itemId:"CatalogCigarettes",itemname:NSLocalizedString("cigarettes", comment: ""),itemimage:UIImage(named: "iccigarettes")!,itemcategory:catalogcategories[22], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogLighter",itemname:NSLocalizedString("lighter", comment: ""),itemimage:UIImage(named: "iclighter")!,itemcategory:catalogcategories[22], itemischecked:false, itemaddedid: ""),
    CatalogItem(itemId:"CatalogTobacco",itemname:NSLocalizedString("tobacco", comment: ""),itemimage:UIImage(named: "ictobacco")!,itemcategory:catalogcategories[22], itemischecked:false, itemaddedid: "")
    
]

/*
var catalogitems = [
    CatalogItem(itemId:"CatalogApples",itemname:NSLocalizedString("apples", comment: ""),itemimage:UIImage(named: "apple-fruit-icon.jpg")!,itemcategory:catalogcategories[2], itemischecked:false),
    CatalogItem(itemId:"CatalogBananas",itemname:NSLocalizedString("bananas", comment: ""),itemimage:UIImage(named: "Banana.png")!,itemcategory:catalogcategories[2], itemischecked:false),
    CatalogItem(itemId:"CatalogTomatoes",itemname:NSLocalizedString("tomatoes", comment: ""),itemimage:UIImage(named: "tomato.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    CatalogItem(itemId:"CatalogCucumbers",itemname:NSLocalizedString("cucumbers", comment: ""),itemimage:UIImage(named: "Cucumber.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    CatalogItem(itemId:"CatalogPotato",itemname:NSLocalizedString("potato", comment: ""),itemimage:UIImage(named: "activity.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    CatalogItem(itemId:"CatalogWater",itemname:NSLocalizedString("water", comment: ""),itemimage:UIImage(named: "agua_256.png")!,itemcategory:catalogcategories[3], itemischecked:false),
    CatalogItem(itemId:"CatalogCabbage",itemname:NSLocalizedString("cabbage", comment: ""),itemimage:UIImage(named: "check.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    CatalogItem(itemId:"CatalogWatermelon",itemname:NSLocalizedString("watermelon", comment: ""),itemimage:UIImage(named: "plus.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    CatalogItem(itemId:"CatalogWhatever",itemname:NSLocalizedString("whatever", comment: ""),itemimage:UIImage(named: "restau.png")!,itemcategory:catalogcategories[1], itemischecked:false),
    
]
*/

/*
var catalogitems = [
CatalogItem(itemId:"CatalogApples",itemname:"Apples",itemimage:UIImage(named: "apple-fruit-icon.jpg")!,itemcategory:catalogcategories[2].catId),
CatalogItem(itemId:"CatalogBananas",itemname:"Bananas",itemimage:UIImage(named: "Banana.png")!,itemcategory:catalogcategories[2].catId),
CatalogItem(itemId:"CatalogTomatoes",itemname:"Tomatoes",itemimage:UIImage(named: "tomato.png")!,itemcategory:catalogcategories[1].catId),
CatalogItem(itemId:"CatalogCucumbers",itemname:"Cucumbers",itemimage:UIImage(named: "Cucumber.png")!,itemcategory:catalogcategories[1].catId),
CatalogItem(itemId:"CatalogWater",itemname:"Water",itemimage:UIImage(named: "aqua_256.png")!,itemcategory:catalogcategories[3].catId)

]
*/
//var itemsDataDict = [Dictionary<String, AnyObject>]()

var itemsDataDict = [Dictionary<String, AnyObject>]()

var itemsorderarray = [String]()

var shoppingcheckedtocopy = [Bool]()

var itemsinbuffer = [Dictionary<String, AnyObject>]()

var itemsinbuffertopaste = [Dictionary<String, AnyObject>]()

var DefaultCurrency : String = "EUR"

var itemidsincurrentlist = [String]()

//var currencies : [[AnyObject]] = [["EUR","EU"],["RUB","RU"],["USD","US"]]

//var currencies = [[AnyObject]]()
var currencies = [[String]]() // Later make short list of usual currencies and then in settings let user add more from picker

protocol passListtoMenuDelegate
{
    func getshoplistparameters(isFrom:Bool,listid:String,isreceived:Bool)
}


var symbol = String()
var code = String()

class ShoppingListCreation: UIViewController, UITableViewDelegate, UITableViewDataSource, RefreshListDelegate, MPGTextFieldDelegateCatalog, SmallPopupDelegate, UIPopoverPresentationControllerDelegate, OptionsPopupDelegate, UITextFieldDelegate, takepicturedelegate, UIGestureRecognizerDelegate, UITextViewDelegate {//, sendBackParametersToShopDelegate {
    
    var delegateforlist : passListtoMenuDelegate?
    
    
    /// Text field stuff
    
    
  
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
    //myTextField.delegate = self
    ///
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
   // var symbol = String()
    //var code = String()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func changecodeandsymbol(newcode: String, newsymbol: String) {
        code = newcode
        symbol = newsymbol
        //and change here the sum title!
        summationPrices()
        
    }
  
    
    @IBOutlet var bottomtoolbar: UIToolbar!
    
    
  
    
    @IBOutlet var alllistsoutlet: UIBarButtonItem!
    
    
    @IBOutlet var gobackoutlet: UIBarButtonItem!
    
    ///for checking
    //var checkview = UIView()
    //var resbutton   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    /*
    func getshopparameters(listid:String, iscreated: Bool, isreceived: Bool) {
    
    currentList = listid
    justCreatedList = iscreated
    isReceivedList = isreceived
    
    }
    */
    
    
    func uncheckall() {
        
        

        
        for ( var i = 0; i < itemsDataDict.count; i++ ) {
      
                itemsDataDict[i]["ItemIsChecked"] = false

        }
        

        if showcats == true {
        
            for ( var i = 0; i < itemsDataDict.count; i++ ) {
                
                
                var thissectionsname : String = itemsDataDict[i]["ItemCategoryName"] as! String
                
                for ( var j = 0; j < sections[thissectionsname]!.count; j++ ) {
                    
                    sections[thissectionsname]![j]["ItemIsChecked"] = false
                    
                }
            }
            
        }
        
        
        let query = PFQuery(className:"shopItems")
        query.fromLocalDatastore()
        // querynew.getObjectInBackgroundWithId(itemtocheck) {
        query.whereKey("ItemsList", equalTo: currentList)//currentList)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
            

                
                if let listitems = objects as? [PFObject] {

                    
                    for object in listitems {
                    
                        object["isChecked"] = false
                        
                        object.pinInBackground()
                        
                    }
                    
                    
                    
                }
                
            
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
        checkeditemsqty = 0
        
        tableView.reloadData()
        
    }
    
    
    
    ////////// AUTOCOMPLETE PART
    
    var autodictionary = Dictionary<String,AnyObject>()
    
    
    @IBOutlet var autocomplete: Catalog_Autocomplete!
    
    func generateDataAuto() {
        
        for var i = 0; i < catalogitems.count; i++ {
            
            let itemname : String = catalogitems[i].itemname
            let itemimage = catalogitems[i].itemimage
            let customobject : CatalogItem = catalogitems[i]
            
            autodictionary = ["DisplayText":itemname,"DisplayImage":itemimage, "CustomObject":customobject]//catalogitems[i]]
            
            autocompletecatalogdata.append(autodictionary)
            
        }
        
        
        
    }
    
    var autocompletecatalogdata = [Dictionary<String, AnyObject>]()
    
    var catalogitemtochoose : CatalogItem?
    
    func dataForPopoverInTextField(textfield: Catalog_Autocomplete) -> [Dictionary<String, AnyObject>]
    {
        return autocompletecatalogdata
    }
    
    func textFieldShouldSelect(textField: Catalog_Autocomplete) -> Bool{
        return true
    }
    
    
    
    @IBAction func editingbegin(sender: AnyObject) {
        opencatalogoutlet.hidden = true
        quickaddoutlet.hidden = false
        newquantitybutton.hidden = false
        
        autocomplete.text = ""
        
        autocomplete.placeholder = NSLocalizedString("autocompleteplchldr", comment: "")
        
    }
    
    func textFieldDidEndEditing(textField: Catalog_Autocomplete, withSelection data: Dictionary<String,AnyObject>){
        print("Dictionary received = \(data)")
        catalogitemtochoose = data["CustomObject"] as? CatalogItem
        //I think here I assign to my new variable the chosen catalog item
        
        
        if endediting == false {
        
        poppresented = true
        
        self.newquantitybutton.setImage(self.redquantity, forState: .Normal)
        
        smallpopover.hidden = false
        
        self.quicksmallconstraint.constant = -5
        
        let yPos : CGFloat = 151
        //  self.smallpopover.frame.origin.y = self.view.frame.origin.y - 300
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            // self.smallpopover.frame.origin.y = yPos
            self.view.layoutIfNeeded()
            }, completion: { (value: Bool) -> Void in
                // self.quicksmallconstraint.constant = -5
        })
     
            
        } else {
            endediting = false
        }
      // opencatalogoutlet.hidden = true
       //quickaddoutlet.hidden = false
        
    }
    
    
    
    @IBOutlet var noitemview: UIView!
    
    
    @IBAction func bigplus(sender: AnyObject) {
        performSegueWithIdentifier("additemmodalsegue", sender: self)
    }
    
    
    @IBAction func addfirstitem(sender: AnyObject) {
        performSegueWithIdentifier("additemmodalsegue", sender: self)
        
    }
    
    
    
    
    ////////// AUTO PART END
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
   // var quickunit = String()
   // var quickqty = String()
    
    
    @IBOutlet var addedindicator: UIView!
    
    func tableViewScrollToBottom(animated: Bool) {
        
        let delay = 0.1 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(time, dispatch_get_main_queue(), {
            
            let numberOfSections = self.tableView.numberOfSections
            let numberOfRows = self.tableView.numberOfRowsInSection(numberOfSections-1)
            
            if numberOfRows > 0 {
                let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: (numberOfSections-1))
                self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: animated)
            }
            
        })
    }
    
    
    
    var quickunit : String = ""
    var quickperunit : String = ""
    var quickqty : String  = ""
    
    
    func getinfofrompop(unit: String, quantity: String) {
        
        quickunit = unit
        quickqty = quantity
        
        /*
        if (quickqty != "0.0") || (quickqty != "0,0") || (quickqty != "0") || (quickqty != "0.00") {
            
            quickquantity.text = "\(quickqty) \(quickunit)"
        } else {
             quickquantity.text = NSLocalizedString("amount", comment: "")
        }
        */
        
    }
    
   // @IBOutlet var quickitemadd: UITextField!
    
    @IBOutlet var quickaddoutlet: UIButton!
    
    var imagePath = String()
    
    
    /*
    func saveUIImage(image: UIImage) -> String? {
    
    let docsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
    let imageDirPath = (docsPath as NSString).stringByAppendingPathComponent("SwiftDataImages")
    if !NSFileManager.defaultManager().fileExistsAtPath(imageDirPath) {
    
    do{
    try NSFileManager.defaultManager().createDirectoryAtPath(imageDirPath, withIntermediateDirectories: false, attributes: [:])
    } catch {
    print("Error creating SwiftData image folder")
    return nil
    }
    }
    let imageID = NSUUID().UUIDString
    let imagePath = (imageDirPath as NSString).stringByAppendingPathComponent(imageID)
    let imageAsData = UIImagePNGRepresentation(image)
    if !imageAsData!.writeToFile(imagePath, atomically: true) {
    print("Error saving image")
    return nil
    }
    return imageID
    }
    */
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
               // return ""
                
                imagePath = ""
                return imagePath
            }
        }
        
        let pathToSaveImage = (dir as NSString).stringByAppendingPathComponent("item\(uuid).png")
        //("item\(Int(time)).png")
        
        imageData.writeToFile(pathToSaveImage, atomically: true)
        
        imagePath = "item\(uuid).png"
        
        return imagePath//"item\(Int(time)).png"
    }

    /* WORKS, BUT PROBLEM ON IPHONE 5C
    func loadImageFromLocalStore(imageName: String) -> UIImage {
        let fileManager = NSFileManager.defaultManager()
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        let path = (dir as NSString).stringByAppendingPathComponent(imageName)
        
        if(!path.isEmpty){
            let image = UIImage(contentsOfFile: path)
            //print(image);
            if(image != nil){
                //return image!;
                self.imageToLoad = image!
                return imageToLoad
            } else {
                self.imageToLoad = imagestochoose[0].itemimage
            }
        } else {
            self.imageToLoad = imagestochoose[0].itemimage//
        }
        
        return imageToLoad//imagestochoose[0].itemimage//UIImage(named: "activity.png")!
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

    
  
    
    
    
    func quickaddcatalogitem(chosencatalogitem: CatalogItem) {
        
        if poppresented == true {
            
            getinfofrompop(buttontitle, quantity: popqty.text!)
        }
        
        let shopItem = PFObject(className:"shopItems")
        
        let uuid = NSUUID().UUIDString
        let catalogitemuuid = "catalogitem\(uuid)"
        
        shopItem["itemUUID"] = catalogitemuuid
        shopItem["itemImage"] = NSNull()
        shopItem["ItemsList"] = currentList
        shopItem["belongsToUser"] = PFUser.currentUser()!.objectId!
        
        shopItem["itemNote"] = ""
        shopItem["itemQuantity"] = quickqty//"0"
        shopItem["itemPriceS"] = ""//0.0
        shopItem["TotalSumS"] = ""//0.0
        shopItem["chosenFromHistory"] = false
        shopItem["itemUnit"] = quickunit//""
        shopItem["isChecked"] = false
        shopItem["isCatalog"] = true
        shopItem["isFav"] = false
        shopItem["chosenFromFavs"] = false
        shopItem["perUnit"] = quickunit//""
        
        shopItem["defaultpicture"] = false
        shopItem["OriginalInDefaults"] = ""

        
        
        let date = NSDate()
        
        shopItem["CreationDate"] = date
        shopItem["UpdateDate"] = date
        
        shopItem["ServerUpdateDate"] = date.dateByAddingTimeInterval(-120)
        
        shopItem["isHistory"] = false //for filtering purposes when deleting the list and all its items
        shopItem["isDeleted"] = false
        
    
            
            shopItem["originalInCatalog"] = chosencatalogitem.itemId
            shopItem["itemName"] = chosencatalogitem.itemname
           // var imageData = UIImagePNGRepresentation(chosencatalogitem.itemimage)
          //  saveImageLocally(imageData)
            
            shopItem["imageLocalPath"] = ""//imagePath

        
        shopItem["Category"] = chosencatalogitem.itemcategory.catId
        
       
        
        
            let itemId = catalogitemuuid
            
            let itemname = chosencatalogitem.itemname
            let itemnote = ""
            let itemquantity = quickqty//""
            let itemprice = ""//0.0
            let itemischecked = false
            let itemimagepath = ""//self.imagespaths[indexPathCatalogProduct!.row]//"Banana.png"//self.imagePath
            let itemunit = quickunit//""
            let itemimage2 = chosencatalogitem.itemimage
            let itemcategory = chosencatalogitem.itemcategory.catId
            let itemiscatalog = true
            let originalincatalog = chosencatalogitem.itemId
            
            let itemperunit = quickunit//""
            
            let categoryname = chosencatalogitem.itemcategory.catname
            
            let itemtotalprice = ""//0.0
            
            let thisitemisfav = false
        
            let isdefaultpict = false
            let originalindefaults = ""
        
            self.dictionary = ["ItemId":itemId,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemtotalprice,"ItemImagePath":itemimagepath,"ItemUnit":itemunit,"ItemIsChecked":itemischecked,"ItemImage2":itemimage2,"ItemCategory":itemcategory,"ItemIsCatalog":itemiscatalog,"ItemOriginal":originalincatalog,"ItemCategoryName":categoryname,"ItemOneUnitPrice":itemprice,"ItemIsFav":thisitemisfav,"ItemPerUnit":itemperunit,"ItemCreation":date,"ItemUpdate":date,"ItemIsDefPict":isdefaultpict,"ItemOriginalInDefaults":originalindefaults]
     
        
        itemsDataDict.append(self.dictionary)
        
        shoppingcheckedtocopy.append(false)
        
        itemsorderarray.append(catalogitemuuid)

        
        
        self.sortcategories(itemsDataDict)
        
        summationPrices()
        countitems()
        countchecked()
        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        
        tableView.reloadData()
        
        //self.restore()
        
        // shopItem.pinInBackground()
        shopItem.pinInBackgroundWithBlock({ (success, error) -> Void in
            if success {
                //self.restore()
                print("saved item")
                
               

            } else {
                print("no id found")
            }
        })
        
        
        
        //shopItem.saveInBackgroundWithBlock {
       // shopItem.saveEventually()
        
        
        if poppresented == true {
            
          //  getinfofrompop(buttontitle, quantity: popqty.text!)
            
            poppresented = false
            
            newquantitybutton.setImage(blackquantity, forState: .Normal)

            
            self.quicksmallconstraint.constant = -456
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                
                }, completion: { (value: Bool) -> Void in
               
                    self.smallpopover.hidden = true
            })

            
            
        }
        
        //autocomplete.resignFirstResponder()
        poppresented = false
        
        opencatalogoutlet.hidden = false
        quickaddoutlet.hidden = true
        newquantitybutton.hidden = true
        
       // self.picker.selectRow(0, inComponent: 0, animated: false)

        self.quickunit = ""
        self.quickqty  = ""
        
        self.popqty.text = ""
        self.inunitsfield.text = ""
        
        buttontitle = ""
        
        
        
        self.view.endEditing(true)
        //autocomplete.re
        catalogitemtochoose = nil // make it nil after adding
       //  quickquantity.text = NSLocalizedString("amount", comment: "")
        autocomplete.text = NSLocalizedString("additemtext", comment: "")
        
        tableViewScrollToBottom(true)
        
        addedindicator.alpha = 1
        addedindicator.fadeOut()
        
        
        
    }
    
    
    
    
    func movechecked(var refr: Bool, cell: ItemShopListCell) -> Bool {
        
        if refr == false {
        
        cell.checkedheight.constant = 51
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            
            }, completion: { (value: Bool) -> Void in
                
                refr = true
                
        })
          return refr
        } else {
            cell.checkedheight.constant = 0
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                
                }, completion: { (value: Bool) -> Void in
                    
                    refr = false
                    
            })
            return refr
            
        }
        
    }

    
    var endediting : Bool = false
    
    @IBAction func doneinviewbutton(sender: AnyObject) {
        
        if (catalogitemtochoose != nil) {
            
            quickaddcatalogitem(catalogitemtochoose!)
            
        } else {
            
            if poppresented == true {
                
                getinfofrompop(buttontitle, quantity: popqty.text!)
            }
            
            
            var itemimage = imagestochoose[0].itemimage//UIImage(named: "restau.png")
            //let imageData = UIImagePNGRepresentation(image)
            //let imageFile = PFFile(name:"itemImage.png", data:imageData)
            
            
            //creation of an itemlist
            var shopItem = PFObject(className:"shopItems")
            var uuid = NSUUID().UUIDString
            var itemuuid = "shopitem\(uuid)"
            
            shopItem["itemUUID"] = itemuuid
            shopItem["itemName"] = autocomplete.text//quickitemadd.text
            shopItem["itemImage"] = NSNull()//imageFile
            shopItem["itemNote"] = ""
            shopItem["itemQuantity"] = quickqty//"0"
            shopItem["itemPriceS"] = ""//0.0
            shopItem["TotalSumS"] = ""//0.0
            
            shopItem["ItemsList"] = currentList
            shopItem["belongsToUser"] = PFUser.currentUser()!.objectId!
            shopItem["itemUnit"] = quickunit//""
            shopItem["perUnit"] = quickunit//""
            shopItem["chosenFromHistory"] = false
            shopItem["isChecked"] = false
            
            shopItem["defaultpicture"] = true
            shopItem["OriginalInDefaults"] = imagestochoose[0].imagename
            
            shopItem["Category"] = catalogcategories[0].catId
            shopItem["isCatalog"] = false
            shopItem["originalInCatalog"] = ""
            
            //self.saveImageLocally(imageData)
            shopItem["imageLocalPath"] = ""//self.imagePath
            
            shopItem["isFav"] = false
            
            shopItem["chosenFromFavs"] = false
            
            var date = NSDate()
            
            shopItem["CreationDate"] = date
            shopItem["UpdateDate"] = date
            
            shopItem["ServerUpdateDate"] = date.dateByAddingTimeInterval(-120)
            
            shopItem["isHistory"] = true //for filtering purposes when deleting the list and all its items
            shopItem["isDeleted"] = false
            //shopItem["Category"] =
            
            var itemid = itemuuid
            
            var itemname = autocomplete.text!//quickitemadd.text
            var itemnote = ""
            var itemquantity = quickqty//""
            var itemprice = ""//0.0
            var itemoneunitprice = ""//0.0
            //var itemimage = imageFile
            var itemischecked = false
            var itemimagepath = ""//self.imagePath
            var itemunit = quickunit//""
            var itemperunit = quickunit//""
            //self.loadImageFromLocalStore(itemimagepath)
            var itemimage2 = itemimage//self.imageToLoad
            
            var itemcategory = catalogcategories[0].catId
            var itemiscatalog = false
            var originalincatalog = ""
            
            var itemcategoryname = catalogcategories[0].catname
            
            var itemisfav = false
            
            var isdefaultpict = true
            var originalindefaults = imagestochoose[0].imagename
            
            self.dictionary = ["ItemId":itemid,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemprice,"ItemImagePath":itemimagepath,"ItemUnit":itemunit,"ItemIsChecked":itemischecked,"ItemImage2":itemimage2,"ItemCategory":itemcategory,"ItemIsCatalog":itemiscatalog,"ItemOriginal":originalincatalog,"ItemCategoryName":itemcategoryname,"ItemOneUnitPrice":itemoneunitprice,"ItemIsFav":itemisfav,"ItemPerUnit":itemperunit,"ItemCreation":date,"ItemUpdate":date,"ItemIsDefPict":isdefaultpict,"ItemOriginalInDefaults":originalindefaults]
            
            
            
            itemsDataDict.append(self.dictionary)
            
            shoppingcheckedtocopy.append(false)
            
            self.sortcategories(itemsDataDict)
            
            summationPrices()
            countitems()
            countchecked()
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
            
            tableView.reloadData()
            
            
            shopItem.pinInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    
                    print("saved item")
                    // print("IMPORTANT BITCH IS  \(itemuuid)")
                    
                    // self.itemid = shopItem.objectId!
                    // self.itemid = shopItem.objectId!
                    
                    
                    //}
                    
                    // print("Items are \(itemsDataDict)")
                    
                    
                    
                } else {
                    print("Item wasn't saved")
                }
            })
            
            
            //shopItem.saveInBackgroundWithBlock {
            /*
            shopItem.saveEventually() {
            //  shopItem.pinInBackground() {
            //eventually means that it is saved offline first
            (success: Bool, error: NSError?) -> Void in
            if (success) {
            print("ITEM WAS ALSO SAVED TO SERVER")
            } else {
            // There was a problem, check error.description
            print("Item wasn't saved to server")
            }
            
            
            }
            */
            
            if poppresented == true {
                
                // getinfofrompop(buttontitle, quantity: popqty.text!)
                
                poppresented = false
                
                newquantitybutton.setImage(blackquantity, forState: .Normal)
                
                
                self.quicksmallconstraint.constant = -456
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.view.layoutIfNeeded()
                    
                    }, completion: { (value: Bool) -> Void in
                        
                        self.smallpopover.hidden = true
                })
                
                
            }
            //  autocomplete.resignFirstResponder()\
            poppresented = false
            endediting = true
            quickaddoutlet.hidden = true
            opencatalogoutlet.hidden = false
            newquantitybutton.hidden = true
            
           // self.picker.selectRow(0, inComponent: 0, animated: false)
            
            self.quickunit = ""
            self.quickqty  = ""
            // self.quickquantity.text = NSLocalizedString("amount", comment: "")
            self.autocomplete.text = NSLocalizedString("additemtext", comment: "")
            
            self.popqty.text = ""
            // self.inunitsfield.text = ""
            
            buttontitle = ""
            
            
            autocomplete.resignFirstResponder()
            //self.view.endEditing(true)
            
        } // END OF USUAL ADD CASE
        
        
        
        tableViewScrollToBottom(true)
        
        addedindicator.alpha = 1
        addedindicator.fadeOut()
        
        
        
        
    }
    
    
    @IBAction func quickaddbutton(sender: AnyObject) {
        
        if (catalogitemtochoose != nil) {
            
            quickaddcatalogitem(catalogitemtochoose!)
            
        } else {
        
            if poppresented == true {
                
                getinfofrompop(buttontitle, quantity: popqty.text!)
            }

            
        var itemimage = imagestochoose[0].itemimage//UIImage(named: "restau.png")
        //let imageData = UIImagePNGRepresentation(image)
        //let imageFile = PFFile(name:"itemImage.png", data:imageData)
        

        //creation of an itemlist
        var shopItem = PFObject(className:"shopItems")
        var uuid = NSUUID().UUIDString
        var itemuuid = "shopitem\(uuid)"
        
        shopItem["itemUUID"] = itemuuid
        shopItem["itemName"] = autocomplete.text//quickitemadd.text
        shopItem["itemImage"] = NSNull()//imageFile
        shopItem["itemNote"] = ""
        shopItem["itemQuantity"] = quickqty//"0"
        shopItem["itemPriceS"] = ""//0.0
        shopItem["TotalSumS"] = ""//0.0
        
        shopItem["ItemsList"] = currentList
        shopItem["belongsToUser"] = PFUser.currentUser()!.objectId!
        shopItem["itemUnit"] = quickunit//""
        shopItem["perUnit"] = quickunit//""
        shopItem["chosenFromHistory"] = false
        shopItem["isChecked"] = false
        
            shopItem["defaultpicture"] = true
            shopItem["OriginalInDefaults"] = imagestochoose[0].imagename
        
        shopItem["Category"] = catalogcategories[0].catId
        shopItem["isCatalog"] = false
        shopItem["originalInCatalog"] = ""
        
        //self.saveImageLocally(imageData)
        shopItem["imageLocalPath"] = ""//self.imagePath
        
        shopItem["isFav"] = false
        
        shopItem["chosenFromFavs"] = false
        
        var date = NSDate()
        
        shopItem["CreationDate"] = date
        shopItem["UpdateDate"] = date
            
        shopItem["ServerUpdateDate"] = date.dateByAddingTimeInterval(-120)
        
        shopItem["isHistory"] = true //for filtering purposes when deleting the list and all its items
        shopItem["isDeleted"] = false
        //shopItem["Category"] =
        
        var itemid = itemuuid
        
        var itemname = autocomplete.text!//quickitemadd.text
        var itemnote = ""
        var itemquantity = quickqty//""
        var itemprice = ""//0.0
        var itemoneunitprice = ""//0.0
        //var itemimage = imageFile
        var itemischecked = false
        var itemimagepath = ""//self.imagePath
        var itemunit = quickunit//""
        var itemperunit = quickunit//""
        //self.loadImageFromLocalStore(itemimagepath)
        var itemimage2 = itemimage//self.imageToLoad
        
        var itemcategory = catalogcategories[0].catId
        var itemiscatalog = false
        var originalincatalog = ""
        
        var itemcategoryname = catalogcategories[0].catname
        
        var itemisfav = false
            
            var isdefaultpict = true
            var originalindefaults = imagestochoose[0].imagename
        
        self.dictionary = ["ItemId":itemid,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemprice,"ItemImagePath":itemimagepath,"ItemUnit":itemunit,"ItemIsChecked":itemischecked,"ItemImage2":itemimage2,"ItemCategory":itemcategory,"ItemIsCatalog":itemiscatalog,"ItemOriginal":originalincatalog,"ItemCategoryName":itemcategoryname,"ItemOneUnitPrice":itemoneunitprice,"ItemIsFav":itemisfav,"ItemPerUnit":itemperunit,"ItemCreation":date,"ItemUpdate":date,"ItemIsDefPict":isdefaultpict,"ItemOriginalInDefaults":originalindefaults]
        
        
        
        itemsDataDict.append(self.dictionary)
            
        shoppingcheckedtocopy.append(false)
        
        self.sortcategories(itemsDataDict)
        
        summationPrices()
            countitems()
            countchecked()
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        
        tableView.reloadData()
        
        
        shopItem.pinInBackgroundWithBlock({ (success, error) -> Void in
            if success {
                
                print("saved item")
               // print("IMPORTANT BITCH IS  \(itemuuid)")
                
                // self.itemid = shopItem.objectId!
                // self.itemid = shopItem.objectId!
               

                //}
                
               // print("Items are \(itemsDataDict)")
                
                
                
            } else {
                print("Item wasn't saved")
            }
        })
        
        
        //shopItem.saveInBackgroundWithBlock {
        /*
            shopItem.saveEventually() {
            //  shopItem.pinInBackground() {
            //eventually means that it is saved offline first
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("ITEM WAS ALSO SAVED TO SERVER")
            } else {
                // There was a problem, check error.description
                print("Item wasn't saved to server")
            }

        
            }
        */
            
            if poppresented == true {
                
               // getinfofrompop(buttontitle, quantity: popqty.text!)
                
                poppresented = false
                
                newquantitybutton.setImage(blackquantity, forState: .Normal)
                
                
                self.quicksmallconstraint.constant = -456
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.view.layoutIfNeeded()
                    
                    }, completion: { (value: Bool) -> Void in
                        
                        self.smallpopover.hidden = true
                })
                
               
            }
          //  autocomplete.resignFirstResponder()\
            poppresented = false
            endediting = true
            quickaddoutlet.hidden = true
            opencatalogoutlet.hidden = false
            newquantitybutton.hidden = true
            
           //  self.picker.selectRow(0, inComponent: 0, animated: false)
            
            self.quickunit = ""
            self.quickqty  = ""
            // self.quickquantity.text = NSLocalizedString("amount", comment: "")
            self.autocomplete.text = NSLocalizedString("additemtext", comment: "")
            
            self.popqty.text = ""
            // self.inunitsfield.text = ""
            
            buttontitle = ""
           
            
            autocomplete.resignFirstResponder()
            //self.view.endEditing(true)
            
        } // END OF USUAL ADD CASE
        
        
        
         tableViewScrollToBottom(true)
        
        addedindicator.alpha = 1
        addedindicator.fadeOut()
        
    }
    
    
    
    
    func refreshtable() {//table:UITableView) {
        // categorybutton.setTitle(categoryname, forState: .Normal)
        //categoryimageoutlet.image = categoryimage
        
        //tableView.reloadData() // not enough
        
        HistoryitemsDataDict.removeAll(keepCapacity: true)
        
        // here should run a for cycle that changes all catalog items "ischecked" to false
        
        for var i = 0;i<catalogitems.count;++i {
         
            catalogitems[i].itemischecked = false
            
        }
        
        //override func viewWillAppear(animated: Bool) {
        
        
        if itemsDataDict.count == 0 {
            
          //  noitemview.hidden = false
        } else {
         //   noitemview.hidden = true
        }
        
        ///CASE from menu
        
        
        
        if justCreatedList == true {
            
            //hope it works
            //newPFObject()f
            activeList = currentList
            //currentList = activeList
            if currentList != "" {
                //     ONLY THAT WAS HERE // dataretrieval()  //MAYBE I NEED IT
                // fillthedict()
                
              //  print("DICT IS \(itemsDataDict)")
                
                self.sortcategories(itemsDataDict)
                tableView.reloadData()
                summationPrices()
                countitems()
                countchecked()
                itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
            } else {
                
                
            }
            //here I define active list as current list, it is required in order to avoid an error. I do dataretrieval() because this is a function that is used to get data from just created list rather than getting the data from chosen in TableViewController VC.
        } else {
            //OLD APPROACH
            //dataretrievallist()
            
            if itemsDataDict.count == 0 {
                dataretrievallist()
                //dataretrievalinorder()
                //noitemview.hidden = false
            }
            
           // print("DICT IS \(itemsDataDict)")
            
            //NEW APPROACH
            self.sortcategories(itemsDataDict)
            tableView.reloadData()
            
            
            //tableView.reloadData()
            summationPrices()
            countitems()
            countchecked()
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
            
        }
        
        
        if itemsDataDict.count == 0 {
           // noitemview.hidden = false
        } else {
           // noitemview.hidden = true
        }
        
         tableViewScrollToBottom(true)
        
    }
    
    // MARK: HorizontalScroll
    
    
    @IBOutlet var horscrollview: UIView!
    
    @IBOutlet var horscrollviewper: UIView!
  
    //var horizontalScrollView: ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRectMake(0, 0, 320, 60))
    
  
    
    
    @IBOutlet var choosecurrency: UIButton!
    
    
    
    
    var senderVC : UIViewController?
    //need to find out from which vc was the segue performed
    
    
    var thislistcurrency = String()
    
    var currentList = String()
    
    var trycurrent: String?
    
    var itemtodelete: String?
    
    var justCreatedList = true
    
    var isReceivedList = Bool()
    
    var activeList: String? // currently I will use this
    
    //var newListActive: String?
    
    var refreshControl:UIRefreshControl!
    
    var itemtoedit = String()
    
    var itemtocheck = String()
    
    var checkedImage: UIImage = UIImage(named: "EditModeCheckIcon")!
//UIImage(named: "check.png")!
    
    var notcheckedImage: UIImage = UIImage(named: "EditModeUncheckIcon")!//UIImage(named: "notchecked.png")!
    
    var checkedImageToCopy: UIImage = UIImage(named: "EditModeCheckIcon")!//UIImage(named: "check.png")!
    
    var notcheckedImageToCopy: UIImage = UIImage(named: "EditModeUncheckIcon")!//UIImage(named: "notchecked.png")!
    
    var imageToLoad = UIImage()
    
    var itemsoverallqty = Int()
    
    var checkeditemsqty = Int()
    
    // var creationdate = NSDate()
    
    // var updatedate = NSDate()
    
    
    
    
    var checked = [Bool]()
    
    var showcats = Bool()
    
    var isSorted = Bool()
    
    @IBOutlet weak var PricesSum: UILabel!
    
    @IBOutlet var tableView: UITableView! //TO DO THIS IS ALWAYS NECESSARY WHEN USING TABLEVIEW in VC
    
    @IBOutlet var ShopListNameOutlet: UITextField!
    
    @IBOutlet var ShopListNoteOutlet: UITextField!
    
    @IBOutlet weak var itemsoverall: UILabel!
    
    
    @IBOutlet weak var itemschecked: UILabel!
    
    
    // var currencies : [[String]] = []
    
    //var itemsDataDict = [Dictionary<String, AnyObject>]()
    
    
    //self.tableView.editing = !self.tableView.editing
    
    func contains(values: [String], element: String) -> Bool {
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
    
    /*
    func containscat(values: [Dictionary<String, AnyObject>, element: String) -> Bool {
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
    */
    
    func containsdict(values: [Dictionary<String, AnyObject>], element: Dictionary<String, AnyObject>) -> Bool {
        // Loop over all values in the array.
        for value in values {
            // If a value equals the argument, return true.
            //if value["ItemId"] == element["ItemId"] {
            if NSDictionary(dictionary: value).isEqualToDictionary(element) {
                return true
                
            }
        }
        // The element was not found.
        return false
    }
    
    
    
    var shoppingListItemsIds = [String]()
    var shoppingListItemsNames = [String]()
    var shoppingListItemsNotes = [String]()
    var shoppingListItemsQuantity = [String]()
    var shoppingListItemsPrices = [String]()
    var shoppingListItemsImages = [AnyObject]()
    var shoppingListItemsUnits = [String]()
    var shoppingListItemsImagesPaths = [String]()
    var shoppingListItemsImages2 = [UIImage]()
    var shoppingListItemsIsChecked = [Bool]()
    var shoppingListItemsCategories = [String]()
    var shoppingListItemsCategoriesNames = [String]()
    var shoppingListItemsIsCatalog = [Bool]()
    var shoppingListItemsOriginal = [String]()
    var shoppingListOneUnitPrice = [String]()
    var shoppingListItemsIsFav = [Bool]()
    var shoppingListItemsPerUnit = [String]()
    var shoppingListItemsCreation = [NSDate]()
    var shoppingListItemsUpdate = [NSDate]()
    
    var shoppingListItemsIsDefPict = [Bool]()
    var shoppingListItemsDefaultOriginal = [String]()
    
    var shoppingpffile = [PFFile]()
    

    //var sortedSections = [String]()
    
    //var sections : [(index: Int, length :Int, title: String)] = Array()
    
    //  var sections = MutableDictionary<String, Array<Dictionary<String, AnyObject>>>()
    var sections = Dictionary<String, Array<Dictionary<String, AnyObject>>>()
    
    var sections2 = Dictionary<String, Array<Dictionary<String, AnyObject>>>()
    
    var sortedSections = [String]()
    
    //var dictionary: NSDictionary = NSDictionary()
    
    var differentcategories = [String]()
    
    var dictionary = Dictionary<String, AnyObject>()
    
    // var ItemsCount = Int()
    // var CheckedItemsCount = Int()
    
    
    
    func popshowcategories(show: Bool) {
        
        
        if show == true {
            
            showcats = true
            
            self.tableView.reloadData()
            
          //  print("The new array is \(sections)")
            
        } else {
            
            showcats = false
            // sections.removeAll(keepCapacity: true)
            self.tableView.reloadData()
            
            
        }
        
        
    }
    
    func changecolor(code: String) {
        
        colorcode = code
        
    }
    
    @IBAction func ShowCategories(sender: AnyObject) {

        
        if showcats == false {
            
            showcats = true
 
            self.tableView.reloadData()
            
          //  print("The new array is \(sections)")
            
        } else {
            
            showcats = false
            // sections.removeAll(keepCapacity: true)
            self.tableView.reloadData()
            
            
        }
  
    }
    
    func sortcategories(items: [Dictionary<String, AnyObject>]) {
        /*
        sections.removeAll(keepCapacity: false)
        sortedSections.removeAll(keepCapacity: false)
        headerimages.removeAll(keepCapacity: true)
        */
        
        sections.removeAll(keepCapacity: true)
        sortedSections.removeAll(keepCapacity: true)
        headerimages.removeAll(keepCapacity: true)
        
        //for ( var i = 0; i < itemsDataDict.count; i++ ) {
        
        // var commoncategory: String = itemsDataDict[i]["ItemCategoryName"] as! String
        for ( var i = 0; i < items.count; i++ ) {
            
            let commoncategory: String = items[i]["ItemCategoryName"] as! String
            
            if self.sections.indexForKey(commoncategory) == nil {
                
                //self.sections.indexForKey("ItemCategory") = itemsDataDict[i]["ItemCategory"]
                //self.sections.indexForKey(commoncategory) = itemsDataDict[i]
                self.sections[commoncategory] = [items[i]]
                // self.sections[commoncategory]?.append(items[i])
                
            }
            else {
                //self.sectionsindexForKey("ItemCategory")!.append(TableItem(title: name, creationDate: item.creationDate))
                self.sections[commoncategory]?.append(items[i])
                
                
            }
        }
        //print("YO YO SECTIONS ARE \(sections)")
        
       print("sects \(sortedSections)")
        
       // self.sortedSections =  self.sections.keys.array.sorted(>)
        
        self.sortedSections = self.sections.keys.elements.sort(>) //Swift 2
        
        print("sects1 \(sortedSections)")
        
        for ( var sect = 0; sect < sortedSections.count; sect++ ) {
            
            var key: String = self.sortedSections[sect]
            
            //((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemImage2")) as? UIImage
            
            var cat = (self.sections as NSDictionary).objectForKey(key) as! [Dictionary<String,AnyObject>]
            var catid : String = (cat[0] as NSDictionary).objectForKey("ItemCategory") as! String
            
            
            
            if (catid as NSString).containsString("custom") {
                
                
                var querycat = PFQuery(className:"shopListsCategory")
                querycat.fromLocalDatastore()
                querycat.whereKey("categoryUUID", equalTo: catid)
                var categories = querycat.findObjects()
                if (categories != nil) {
                    for category in categories! {
                        
                        
                        if category["defaultpicture"] as! Bool == false {
                                                       self.loadImageFromLocalStore(category["imagePath"] as! String)
                           // thiscatpicture = 
                            self.headerimages.append(self.imageToLoad)
                            
                        } else {
                            
                            var imagename = category["OriginalInDefaults"] as! String
                            
                            if (UIImage(named: "\(imagename)") != nil) {
                                //thiscatpicture = UIImage(named: "\(imagename)")!
                                 self.headerimages.append(UIImage(named: "\(imagename)")!)
                            } else {
                               // thiscatpicture = defaultcatimages[0].itemimage
                                self.headerimages.append(defaultcatimages[0].itemimage)
                            }
                            
                        }
                        
                    }
                } else {
                    print("No custom cats yet")
                }
                
                
            } else {
                // CASE IF IT IS DEFAULT CATEGORY
                
                
                
                // Find this object of product type which has property catId = itemcategoryUUID
                
                //  if let foundcategory = find(lazy(catalogcategories).map({ $0.catId }), catid) {
                
                if var foundcategory = catalogcategories.map({ $0.catId }).lazy.indexOf(catid) {
                    
                    var catalogpicture = catalogcategories[foundcategory].catimage
                    
                   // thiscatpicture = catalogpicture
                    
                    self.headerimages.append(catalogpicture)
                    
                }
                
                
            }
            
            
        }
        
        self.tableView.reloadData()
        
    }
    
    
    func createpicture() {
        // generateImage(tableView)
        if itemsDataDict.count != 0 {
        messageimage = tableView.screenshot!
        }
    }
    
    func savetogallery() {
        if itemsDataDict.count != 0 {
        messageimage = tableView.screenshot!
        }
    }
    
   
   
    /*
    func generateImage(tblview:UITableView) -> UIImage {
        /*
        UIGraphicsBeginImageContext(tblview.contentSize);
        tblview.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
        tblview.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let row = tblview.numberOfRowsInSection(0)
        let numberofRowthatShowinscreen = 4
        var scrollCount = row / numberofRowthatShowinscreen
        
        for var i=0;i < scrollCount ; i++ {
            tblview.scrollToRowAtIndexPath(NSIndexPath(forRow: (i+1)*numberofRowthatShowinscreen, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            tblview.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        }
        
        //let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        messageimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
*/
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(tableView.contentSize.width, tableView.contentSize.height+64+40), true, 0)
        
        for section in 0...tableView.numberOfSections-1 {
            for row in 0...tableView.numberOfRowsInSection(section)-1 {
                
               
                
                
                let indexPath = NSIndexPath.init(forRow: row, inSection: section)
                
                let cell = tableView.cellForRowAtIndexPath(indexPath)!
                let height = cell.frame.height
                
                print("row:\(indexPath.row), frame:\(cell.frame) height:\(height)")
                
                cell.contentView.drawViewHierarchyInRect(cell.frame, afterScreenUpdates: true)
                tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: row, inSection: section), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            }
        }
         messageimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return messageimage;
    }
    */
    
    
    
    func handleUPSwipe(sender: UISwipeGestureRecognizer) {
        
        getinfofrompop(buttontitle, quantity: popqty.text!)
        
        poppresented = false
        
    
        newquantitybutton.setImage(blackquantity, forState: .Normal)
        
        /*
        
        self.quicksmallconstraint.constant = -456

        UIView.animateWithDuration(0.4, animations: { () -> Void in

            self.view.layoutIfNeeded()
            
            }, completion: { (value: Bool) -> Void in
                // self.quicksmallconstraint.constant = -5
                self.smallpopover.hidden = true
        })
        */
        self.smallpopover.fadeOut()
        self.smallpopover.hidden = true
        

        
    }
    
    let dimmer : UIView = UIView()
    
    
    
    func handlebvTap(sender: UITapGestureRecognizer? = nil) {
        
        dimmer.removeFromSuperview()
        
        
         notetopconstraint.constant = -300
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (value: Bool) -> Void in
                
                        }
        view.endEditing(true)
        
        self.shownoteview.hidden = true

    }
    
    @IBAction func newshownoteaction(sender: AnyObject) {
        
        shownoteview.hidden = false
        
        dimmer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        dimmer.backgroundColor = UIColorFromRGBalpha(0x2a2f36, alp: 0.5)
        
        
        let blurredtap = UITapGestureRecognizer(target: self, action: Selector("handlebvTap:"))
        blurredtap.delegate = self
        dimmer.userInteractionEnabled = true
        dimmer.addGestureRecognizer(blurredtap)
        
        self.view.addSubview(dimmer)
        
        notetopconstraint.constant = 90
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            }, completion: { (value: Bool) -> Void in
                
        })
        
        self.view.bringSubviewToFront(shownoteview)
    }
    
    
    
    
   
    
    var myeditingmode = Bool()
    
    let toolbar = UIToolbar()
    
    var temporaryshowcats = Bool()
    
    
    @IBOutlet var optionsoutletbutton: UIButton!
    
    @IBAction func EditAllBarButton(sender: AnyObject) {
        
      //  tableView.editing = true // THIS IS FOR DELETING STUFF
        
        /// THIS OS FOR COPYING AND PASTING STUFF
       // tableView.allowsSelectionDuringEditing = true
       // tableView.allowsSelection = true
        //tableView.allowsSelectionDuringEditing = true
        
        temporaryshowcats = showcats
        
        showcats = false
        
        myeditingmode = true
        
        
        tableView.reloadData()
        
        self.view.viewWithTag(7)!.hidden = true
        
        self.optionsoutletbutton.hidden = true

        
        let copyItem: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("copy", comment: ""), style: UIBarButtonItemStyle.Plain, target: self, action: "copyitems:")
        copyItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Avenir-Book", size: 15)!, NSForegroundColorAttributeName: UIColorFromRGB(0xE0FFB2)], forState: UIControlState.Normal)
        
        let cancelItem: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("DoneButton", comment: ""), style: UIBarButtonItemStyle.Plain, target: self, action: "canceleditmode:")
        cancelItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Avenir-Book", size: 15)!, NSForegroundColorAttributeName: UIColorFromRGB(0xFAFAFA)], forState: UIControlState.Normal)
        
        let deleteItem: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("delete", comment: ""), style: UIBarButtonItemStyle.Plain, target: self, action: "deleteitemsmode:")
        
        deleteItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Avenir-Book", size: 15)!, NSForegroundColorAttributeName: UIColorFromRGB(0xF23D55)], forState: UIControlState.Normal)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let pasteItem: UIBarButtonItem = UIBarButtonItem(title: NSLocalizedString("paste", comment: ""), style: UIBarButtonItemStyle.Plain, target: self, action: "pasteitems:")
        pasteItem.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Avenir-Book", size: 15)!, NSForegroundColorAttributeName: UIColorFromRGB(0xFAFAFA)], forState: UIControlState.Normal)
        
       
       // var toolbarButtons = [UIBarButtonItem]()
        
       // if itemsinbuffertopaste != [] {
             let toolbarButtons = [pasteItem,deleteItem,copyItem,flexibleSpace,cancelItem]
       // } else {
            // toolbarButtons = [cancelItem,flexibleSpace,deleteItem,copyItem]
       // }
    
        
        toolbar.tag = 8
      //  toolbar.frame = CGRectMake(0, self.view.frame.size.height - 46, self.view.frame.size.width, 46)
        toolbar.frame = CGRectMake(0, 20, self.view.frame.size.width, 46)
        toolbar.sizeToFit()
        toolbar.translucent = false
        //toolbar.tintColor = UIColorFromRGB(0x2A2F36)
        toolbar.setItems(toolbarButtons, animated: true)
       
        
        //toolbar.backgroundColor = UIColorFromRGB(0x2A2F36)//UIColor.redColor()
        toolbar.barTintColor = UIColorFromRGB(0x31797D)//2A2F36)
        toolbar.alpha = 1
        //toolbar.
        self.view.addSubview(toolbar)
        self.view.bringSubviewToFront(toolbar)
        
        
    }
    
    
    //// func to copy checked items!
    
    var itemsidsinbuffer = [String]()
    
    var itemtocopy = Dictionary<String, AnyObject>()
    
    
    
    func canceleditmode(sender: UIButton!) {
        //tableView.editing = false
        
       // itemsinbuffertopaste.removeAll(keepCapacity: true) // Perhap I should leave this array intact
        
        for var i = 0; i < shoppingcheckedtocopy.count; i++ {
            shoppingcheckedtocopy[i] = false
        }
        
        itemsinbuffer.removeAll(keepCapacity: true)
        
        myeditingmode = false
        
        showcats = temporaryshowcats
        
        toolbar.removeFromSuperview()
        self.view.viewWithTag(7)!.hidden = false
        
        tableView.reloadData()
        
        self.optionsoutletbutton.hidden = false
        
    }
    
    func deleteitemsmode(sender: UIButton!) {
        
        
        
        for var index = 0; index < itemsinbuffer.count; index++ {
            
            let itemid : String = itemsinbuffer[index]["ItemId"] as! String
            
            for ( var i = 0; i < itemsDataDict.count; i++ ) {
                
                if itemsDataDict[i]["ItemId"] as? String == itemid {
                    
                    itemsDataDict.removeAtIndex(i)
                    
                    
                    self.sortcategories(itemsDataDict)
                    //sort categories again!
                    
                    
                }
            }
            
            let querydelete = PFQuery(className:"shopItems")
            querydelete.fromLocalDatastore()
            querydelete.whereKey("itemUUID", equalTo: itemid)
            querydelete.getFirstObjectInBackgroundWithBlock() {
                (itemList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let itemList = itemList {
                    
                    
                    itemList.unpinInBackground()
                    
                }
                
                
            }
            
        }
        
        for var i = 0; i < shoppingcheckedtocopy.count; i++ {
            shoppingcheckedtocopy[i] = false
        }

       
      myeditingmode = false
        showcats = temporaryshowcats
        
        toolbar.removeFromSuperview()
        self.view.viewWithTag(7)!.hidden = false
        
      tableView.reloadData()
        
         self.optionsoutletbutton.hidden = false
        
        summationPrices()
        
        countitems()
        countchecked()
        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        
        itemsinbuffertopaste.removeAll(keepCapacity: true)
        
        
        itemsinbuffer.removeAll(keepCapacity: true)
    }
    
    
    func checktocopy(sender: UIButton) {
        
        
       // var checkedImageToCopy: UIImage = UIImage(named: "check.png")!
        
       // var notcheckedImageToCopy: UIImage = UIImage(named: "notchecked.png")!
        
        if sender.imageForState(.Normal) == notcheckedImageToCopy {
            //means it is unchecked
        
        let button = sender as UIButton
        let view = button.superview!
            let innerview = view.superview!
       // let cell = view.superview as! ItemShopListCell
        let cell = innerview.superview as! ItemShopListCell
        let indexPath = tableView.indexPathForCell(cell)
        
        //itemtocopy = itemsDataDict[indexPath.row]["ItemId"] as! String
            
            
        itemtocopy = itemsDataDict[indexPath!.row] // this makes a copy of array element, so basically it is brand new element
        // I hope it won't change the original array!
            /*
            var position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
            if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
            {
                var section = indexPathIteminSection.section
                var rowsect = indexPathIteminSection.row
                
                //var tableSection : [Dictionary<String, AnyObject>] = []
                var tableSection = sections[sortedSections[section]]
                var tableItem = tableSection![rowsect]
             
                itemtocopy = tableItem
                }
            }
*/
       // var uuid = NSUUID().UUIDString
        shoppingcheckedtocopy[indexPath!.row] = true
            
       // itemtocopy["ItemId"] = uuid // DO THIS WHEN COPY BUTTON TAPPED!
            
        itemsinbuffer.append(itemtocopy)
            
           
            //print(itemsinbuffer)
            
        sender.setImage(checkedImageToCopy, forState: .Normal)
        
        } else if sender.imageForState(.Normal) == checkedImageToCopy {
            //means it is checked
            
            let button = sender as UIButton
            let view = button.superview!
            let innerview = view.superview!//
            //let cell = view.superview as! ItemShopListCell
            let cell = innerview.superview as! ItemShopListCell
            let indexPath = tableView.indexPathForCell(cell)
            
           // print(itemsinbuffer)
            
            shoppingcheckedtocopy[indexPath!.row] = false
            
            //itemsinbuffer.removeAtIndex(indexPath!.row)
            // TRY TO USE ID SOMEHOW!
            
            let itemtoremove = itemsDataDict[indexPath!.row]["ItemId"] as! String
            /*
            if var founditem = find(lazy(itemsinbuffer).map({ $0.ob }), currentList) {
                
            }
            */
            for ( var i = 0; i < itemsinbuffer.count; i++ ) {
                
                if itemsinbuffer[i]["ItemId"] as? String == itemtoremove {
                    
                    itemsinbuffer.removeAtIndex(i)
                    // tableView.reloadData() //this was really necessary
                    
                }
            }

            
            
            sender.setImage(notcheckedImageToCopy, forState: .Normal)
            
            //itemsDataDict[indexPath!.row]

        
        }
        
        //itemtocopy.append
        
    }
    
    func displayInfoAlert(title: String, message: String) {
        
        let customIcon = UIImage(named: "SuccessAlert")
        let alertview = JSSAlertView().show(self, title: title, text: message, buttonText: "OK", color: UIColorFromHex(0x31797D, alpha: 0.9), iconImage: customIcon)
        alertview.setTextTheme(.Light)
        // alertview.addAction(cancelCallback)
        alertview.addAction(closeCallback)
    }
    
    func displayFailAlert(title: String, message: String) {
        
        let customIcon = UIImage(named: "FailAlert")
        let alertview = JSSAlertView().show(self, title: title, text: message, buttonText: "OK", color: UIColorFromHex(0xF23D55, alpha: 0.9), iconImage: customIcon)
        alertview.setTextTheme(.Light)
        // alertview.addAction(cancelCallback)
        alertview.addAction(closeCallback)
    }
    
    let progressHUD = ProgressHUD(text: NSLocalizedString("pasting", comment: ""))
      let progressHUDsave = ProgressHUD(text: NSLocalizedString("saving", comment: ""))
    let progressHUDload = ProgressHUD(text: NSLocalizedString("loading", comment: ""))
    
    func pause() {
        
        
        self.view.addSubview(progressHUD)
        
        progressHUD.setup()
        progressHUD.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func pauseload() {
        
        
        self.view.addSubview(progressHUDload)
        
        progressHUDload.setup()
        progressHUDload.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func pausesave() {
        
        
        self.view.addSubview(progressHUDsave)
        
        progressHUDsave.setup()
        progressHUDsave.show()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }

    
    
    func restore() {
        
        progressHUD.hide()
        
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    func restoresave() {
        
        progressHUDsave.hide()
        
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    func restoreload() {
        
        progressHUDload.hide()
        
        
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }


    
    
    func closeCallback() {
        print("Closed")
    }
    
   // func copyitems(bufferitems: [Dictionary<String, AnyObject>]) {
    func copyitems(sender: UIButton!) {
        
        itemsinbuffertopaste.removeAll(keepCapacity: true)
        
        itemsinbuffertopaste.appendContentsOf(itemsinbuffer)
        
        itemsinbuffer.removeAll(keepCapacity: true)
        
        // for var index = 0; index < bufferitems.count; index++ {
            for var index = 0; index < itemsinbuffertopaste.count; index++ {
                
            let item : String = itemsinbuffertopaste[index]["ItemName"] as! String
            
          //  print("Item to copy is: \(item)")
                
            itemsinbuffertopaste[index]["ItemIsChecked"] = false //important!
                itemsinbuffertopaste[index]["ItemIsFav"] = false //probably also should do that
                
                // i think i should change the id here
                
                var uuid = NSUUID().UUIDString
                var itemid = "shopitem\(uuid)"
                
                itemsinbuffertopaste[index]["ItemId"] = itemid
            
        }
        
        tableView.reloadData()
        
        displayInfoAlert(NSLocalizedString("itemscopied", comment: ""), message: NSLocalizedString("openthelist", comment: ""))
        
    }
    
    
    
    func pasteitems(sender: UIButton) {
        
        
        if itemsinbuffertopaste.count != 0 {
        
        self.pause()
        
        itemsDataDict.appendContentsOf(itemsinbuffertopaste) //TOO EARLY, I am adding the same
            
            for var i = 0; i < shoppingcheckedtocopy.count; i++ {
                shoppingcheckedtocopy[i] = false
            }

        
        summationPrices()
            countitems()
            countchecked()
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        
        self.sortcategories(itemsDataDict)
            
           
            
            toolbar.removeFromSuperview()
            self.view.viewWithTag(7)!.hidden = false
            
        
        
        myeditingmode = false
        
        showcats = temporaryshowcats
        
        tableView.reloadData()
        
         self.optionsoutletbutton.hidden = false
        
        self.restore()
        
          //displayInfoAlert("Items pasted!", message: "")
   
            tableViewScrollToBottom(true)
            
            addedindicator.alpha = 1
            addedindicator.fadeOut()
      //  dispatch_async(dispatch_get_main_queue(), { //ALL SAVING GOES IN BG
        // for var index = 0; index < bufferitems.count; index++ {
        for var index = 0; index < itemsinbuffertopaste.count; index++ {
            
            shoppingcheckedtocopy.append(false)
            
           // var item : String = itemsinbuffer[index]["ItemId"] as! String
           
             //var uuid = NSUUID().UUIDString SHOULD HAVE DONE IT EARLIER
             //var itemid = "shopitem\(uuid)"
            
        //   itemsinbuffertopaste[index]["ItemId"] = itemid DIDI IT EARLIER
          // itemsinbuffertopaste[index]["ItemIsChecked"] = false // change to no checked!
            
            //image part
            //let imageData = UIImagePNGRepresentation(itemsinbuffertopaste[index]["ItemImage2"] as! UIImage)
            //let imageData = UIImagePNGRepresentation(chosenPicture)
           // let imageFile = PFFile(name:"itemImage.png", data:imageData)
           

           // nowcreate pf objects
            var shopItem = PFObject(className:"shopItems")

            shopItem["itemUUID"] = itemsinbuffertopaste[index]["ItemId"]//itemid
            shopItem["itemName"] = itemsinbuffertopaste[index]["ItemName"]
            shopItem["itemNote"] = itemsinbuffertopaste[index]["ItemNote"]
            
            //shopItem["itemQuantity"] = itemQuantityOutlet.text
            shopItem["itemQuantity"] = itemsinbuffertopaste[index]["ItemQuantity"]
            shopItem["itemPriceS"] = itemsinbuffertopaste[index]["ItemOneUnitPrice"]
            shopItem["TotalSumS"] = itemsinbuffertopaste[index]["ItemTotalPrice"]
            
            shopItem["ItemsList"] = self.currentList
            
            shopItem["belongsToUser"] = PFUser.currentUser()!.objectId!
            

                shopItem["itemUnit"] = itemsinbuffertopaste[index]["ItemUnit"]
  
                shopItem["perUnit"] = itemsinbuffertopaste[index]["ItemPerUnit"]
       
            
            shopItem["chosenFromHistory"] = true
            shopItem["itemImage"] = NSNull()
            shopItem["isChecked"] = false
            
            shopItem["Category"] = itemsinbuffertopaste[index]["ItemCategory"]
            
            shopItem["isCatalog"] = itemsinbuffertopaste[index]["ItemIsCatalog"]
            
            shopItem["originalInCatalog"] = itemsinbuffertopaste[index]["ItemOriginal"]
            
            shopItem["isFav"] = itemsinbuffertopaste[index]["ItemIsFav"]
            
            shopItem["chosenFromFavs"] = true
            
            var date = NSDate()
            
            shopItem["CreationDate"] = date
            shopItem["UpdateDate"] = date
            
            shopItem["ServerUpdateDate"] = date.dateByAddingTimeInterval(-120)
            
            shopItem["isHistory"] = false //for filtering purposes when deleting the list and all its items
            shopItem["isDeleted"] = false
            
           // self.saveImageLocally(imageData)
            
            
            shopItem["defaultpicture"] = itemsinbuffertopaste[index]["ItemIsDefPict"]
            shopItem["OriginalInDefaults"] = itemsinbuffertopaste[index]["ItemOriginalInDefaults"]
            
            
            if itemsinbuffertopaste[index]["ItemIsDefPict"] as! Bool == true {
                shopItem["itemImage"] = NSNull()
                

                
            } else {
                
               // let imageData = UIImagePNGRepresentation(itemsinbuffertopaste[index]["ItemImage2"] as! UIImage)
                //let imageData = UIImagePNGRepresentation(chosenPicture)
               // let imageFile = PFFile(name:"itemImage.png", data:imageData!)
                
                shopItem["itemImage"] = NSNull()//imageFile
 
            }
            
            
            shopItem["imageLocalPath"] = itemsinbuffertopaste[index]["ItemImagePath"]
//self.imagePath
            
            shopItem.pinInBackgroundWithBlock({ (success, error) -> Void in
                if success {
                    
                    print("saved item")

                } else {
                    print("no id found")
                }
                
                
    
                
            })
            //shopItem.saveEventually()
            // shopItem.saveInBackground()
           
        }
        
        
    ////})
        
        } else {
    
             displayFailAlert(NSLocalizedString("noitemsto", comment: ""), message: NSLocalizedString("pleasecopy", comment: ""))
        }
    }
    
    @IBAction func DeleteBarButton(sender: AnyObject) {
    }
    
    
    @IBAction func gobackBar(sender: AnyObject) {
        /*
        if senderVC == senderVC as? AllListsVC || senderVC == senderVC as? ChooseListToCreateView {
            
            //if senderVC == senderVC as? ChooseListToCreateView {
            
           //  SaveListLocal()
            
            performSegueWithIdentifier("gobacksegue", sender: self)
            
        } else if senderVC == senderVC as? MainMenuViewController {
            
            // SaveListLocal()
            
            
            
            delegateforlist?.getshoplistparameters(true, listid:currentList, isreceived: isReceivedList)
            
            // delegateforlist2?.getparameters(true,listid:currentList,isreceived:isReceivedList)
            
            globalisFromShopList = true
            globalshoplistid = currentList
            gloablshopisreceived = isReceivedList
            
           
            
           // additemstolistsarray()
            additemstolistsarrayandsave()
            
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        //perfr
*/
    }
    
    
    @IBAction func optionsBar(sender: AnyObject) {
        //gobacktomainmenusegue
        
        
    }
    
    @IBAction func addmanyBar(sender: AnyObject) {
        
        performSegueWithIdentifier("NewAddItemWithOptions", sender: self)
    }
    
    
    @IBAction func addBar(sender: AnyObject) {
        
        performSegueWithIdentifier("additemmodalsegue", sender: self)
    }
    
    
    
    /*
    @IBAction func endeditname(sender: AnyObject) {
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        query.whereKey("listUUID", equalTo: currentList)
        query.getFirstObjectInBackgroundWithBlock() {
            (list: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let list = list {
                
                list["ShopListName"] = self.self.listnameinview.text
                list.pinInBackground()
                // list.saveEventually()
            }
        }
        
        if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
            UserLists[foundlist].listname = self.self.listnameinview.text
            
            
        }
        
        if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
            UserShopLists[foundshoplist].listname = self.self.listnameinview.text
            
            
        }
        
        if let foundfavlist = UserFavLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
            UserFavLists[foundfavlist].listname = self.self.listnameinview.text
           
            
        }
        
    }
    */
    
    @IBAction func endeditnote(sender: AnyObject) {
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        query.whereKey("listUUID", equalTo: currentList)
        query.getFirstObjectInBackgroundWithBlock() {
            (todolist: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let todolist = todolist {
                
                todolist["ShopListNote"] = ""//self.ShopListNoteOutlet.text
                todolist.pinInBackground()
               // todolist.saveEventually()
            }
        }
    }
    
    
    func WantToSaveAlert() {
        let customIcon = UIImage(named: "activity.png")
        let alertview = JSSAlertView().show(self, title: "Save the list?", text: "List data still will be available during this session", buttonText: "Yes", cancelButtonText: "Cancel", iconImage: customIcon)
        alertview.addAction(closeCallbackSave)
        alertview.addCancelAction(cancelCallbackSave)
    }
    
    func closeCallbackSave() {
        
        
       
    }
    
    func cancelCallbackSave() {
        
       
    }
    
    
    func savelistinfo() {
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        
        query.whereKey("listUUID", equalTo: currentList)
        query.getFirstObjectInBackgroundWithBlock() {
            
            (shopList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
                self.restoresave()
            } else if let shopList = shopList {
                
                shopList["ShopListName"] = self.self.listnameinview.text
               // shopList["ShopListNote"] = self.ShopListNoteOutlet.text
                if self.isReceivedList == false {
                    shopList["isReceived"] = false
                } else {
                    shopList["isReceived"] = true
                }
                
                if self.isReceivedList == false {
                    shopList["isSaved"] = false
                } else {
                    shopList["isSaved"] = true
                }
                

                
                shopList["ItemsCount"] = self.itemsoverallqty
                shopList["CheckedItemsCount"] = self.checkeditemsqty
                
                 let updatedate = NSDate()
                
                shopList["updateDate"] = updatedate
                
                shopList["ListColorCode"] = self.colorcode
                
                //shopList["ItemsInTheShopList"] = self.shoppingListItemsIds
                
                
                shopList.pinInBackground()
                
                // shopList.saveEventually()
            }
        }

        
        
    }
    
  
    
    
    //the stuff below is about assigning an ItemsList value the value of item
    /*
    listId = shopList.objectId
    //here I create a query for all items and give them the just saved Id as a value in ItemsList column!
    var querybelong = PFQuery(className:"shopItems")
    //query.whereKey("objectId", equalTo:"T7MqKFyDbQ")
    querybelong.findObjectsInBackgroundWithBlock {
    (objects: [AnyObject]?, error: NSError?) -> Void in
    
    if error == nil {
    
    println("Successfully retrieved \(objects!.count) scores.")
    // Do something with the found objects
    
    
    if let listitems = objects as? [PFObject] {
    
    //shoppingListItemsIds.removeAll(keepCapacity: true)
    
    for object in listitems {
    
    object["ItemsList"] = listId //id of just saved list
    object.saveInBackground()
    
    self.tableView.reloadData() // without this thing, table would contain only 1 row
    }
    }
    */
    
    
    
    ///////// COLOR CODER PART
    var colorcode = String()
    
    var red:String = "F23D55"
    var dgreen:String = "31797D"
    var lgreen:String = "61C791"
    var yellow:String = "DAFFA4"
    var black:String = "2A2F36"
    var gold:String = "A2AF36"
    var grey:String = "838383"
    
    
    /////////////
    
    
    /*
    func SaveListLocalProcess() {
        
        let updatedate = NSDate()
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        query.whereKey("listUUID", equalTo: currentList)
        query.getFirstObjectInBackgroundWithBlock() {
            
            (shopList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let shopList = shopList {
                
                shopList["ShopListName"] = self.self.listnameinview.text
                shopList["ShopListNote"] = ""//self.ShopListNoteOutlet.text
                //shopList["isFavourite"] = false
                if self.isReceivedList == false {
                    shopList["isReceived"] = false
                } else {
                    shopList["isReceived"] = true
                }
                
                if self.isReceivedList == false {
                    shopList["isSaved"] = false
                } else {
                    shopList["isSaved"] = true
                }
                
                
                self.additemstolistsarray() //works!
                
                shopList["ItemsCount"] = self.itemsoverallqty
                shopList["CheckedItemsCount"] = self.checkeditemsqty
                
                
                shopList["updateDate"] = updatedate
                
                
                
                shopList.pinInBackground()
                //shopList.saveInBackground()
                // shopList.saveEventually() // I DONT DO IT IN THIS CASE
            }
        }
        
        
        ////// NOW SAVE IN ITEMSLIST ARRAY
        
       // if let foundlist = find(lazy(UserLists).map({ $0.listid }), currentList) {
        if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(currentList) {

            UserLists[foundlist].listname = self.listnameinview.text
            UserLists[foundlist].listnote = ""//ShopListNoteOutlet.text
            UserLists[foundlist].listcurrency = code //later add array instead of just string currency
            UserLists[foundlist].listcategories = showcats
            UserLists[foundlist].listitemscount = itemsoverallqty
            UserLists[foundlist].listcheckeditemscount = checkeditemsqty
            UserLists[foundlist].listcreationdate = updatedate
            
        }
        
       // if let foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), currentList) {
          if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(currentList) {
            
            UserShopLists[foundshoplist].listname = self.listnameinview.text
            UserShopLists[foundshoplist].listnote = ""//ShopListNoteOutlet.text
            UserShopLists[foundshoplist].listcurrency = code //later add array instead of just string currency
            UserShopLists[foundshoplist].listcategories = showcats
            UserShopLists[foundshoplist].listitemscount = itemsoverallqty
            UserShopLists[foundshoplist].listcheckeditemscount = checkeditemsqty
            UserShopLists[foundshoplist].listcreationdate = updatedate
            
        }
        
        
    }
    */
    
    
    func SaveListLocal() {
        
        WantToSaveAlert()
    }
    
    var idsinthislist = [String]()
    
    func additemstolistsarray() {
        
       // var idsinthislist = [String]()
        idsinthislist.removeAll(keepCapacity: true)
        
        for item in itemsDataDict {
            idsinthislist.append(item["ItemId"] as! String)
        }
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        // query.getObjectInBackgroundWithId(currentList) {
        query.whereKey("listUUID", equalTo: currentList)
        // queryfav.getObjectInBackgroundWithId(listtofav!) {
        query.getFirstObjectInBackgroundWithBlock() {
            
            (shopList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let shopList = shopList {
                // shopList["ItemsInTheShopList"] = self.shoppingListItemsIds
                shopList["ItemsInTheShopList"] = self.idsinthislist
                // self.additemstolistsarray()
                
                //shopList.setObject(self.shoppingListItemsIds, forKey: "ItemsInTheShopList")
                
                //shopList["ItemsInTheShopList"] = self.shoppingListItemsIds
                shopList.pinInBackground()
                //shopList.saveInBackground()
                //shopList.saveEventually()
            }
        }
        
        //ItemsCount = idsinthislist.count
        // return ItemsCount
    }
    
    
    @IBAction func openmenuaction(sender: AnyObject) {
        
      //  additemstolistsarrayandsave()
    }
    
    func additemstolistsarrayandsave() {
        
        // var idsinthislist = [String]()
        idsinthislist.removeAll(keepCapacity: true)
        
        for item in itemsDataDict {
            idsinthislist.append(item["ItemId"] as! String)
        }
        
        print(idsinthislist)
        
        let updatedate = NSDate()
        
        var currencyarray = [String]()
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        // query.getObjectInBackgroundWithId(currentList) {
        query.whereKey("listUUID", equalTo: currentList)
        // queryfav.getObjectInBackgroundWithId(listtofav!) {
        query.getFirstObjectInBackgroundWithBlock() {
            
            (shopList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let shopList = shopList {
                // shopList["ItemsInTheShopList"] = self.shoppingListItemsIds
                shopList["ItemsInTheShopList"] = self.idsinthislist
                // self.additemstolistsarray()
                
                
                
                shopList["ShopListName"] = self.listnameinview.text
                shopList["ShopListNote"] = self.listnoteinview.text
                if self.isReceivedList == false {
                    shopList["isReceived"] = false
                } else {
                    shopList["isReceived"] = true
                }
                
                if self.isReceivedList == false {
                    shopList["isSaved"] = false
                } else {
                    shopList["isSaved"] = true
                }
                
                
                
                shopList["ItemsCount"] = self.itemsoverallqty
                shopList["CheckedItemsCount"] = self.checkeditemsqty
                
                
                
                shopList["updateDate"] = updatedate
                
                shopList["ListColorCode"] = self.colorcode

                currencyarray.append(code)
                currencyarray.append(symbol)
                shopList["CurrencyArray"] = currencyarray
                
                
                
                //shopList.setObject(self.shoppingListItemsIds, forKey: "ItemsInTheShopList")
                
                //shopList["ItemsInTheShopList"] = self.shoppingListItemsIds
                shopList.pinInBackground()
                //shopList.saveInBackground()
               // shopList.saveEventually()
            }
        }
        
        //if let foundlist = find(lazy(UserLists).map({ $0.listid }), currentList) {
         if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(currentList) {
            UserLists[foundlist].listname = self.listnameinview.text
            UserLists[foundlist].listnote = self.listnoteinview.text
            UserLists[foundlist].listcurrency = [code,symbol]//code //later add array instead of just string currency
            UserLists[foundlist].listcategories = showcats
            UserLists[foundlist].listitemscount = itemsoverallqty
            UserLists[foundlist].listcheckeditemscount = checkeditemsqty
            // UserLists[foundlist].listcreationdate = updatedate
            UserLists[foundlist].listcolorcode = colorcode
            
        }
        
       // if let foundshoplist = find(lazy(UserShopLists).map({ $0.listid }), currentList) {
         if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(currentList) {
            
            
            UserShopLists[foundshoplist].listname = self.listnameinview.text
            UserShopLists[foundshoplist].listnote = self.listnoteinview.text
            UserShopLists[foundshoplist].listcurrency = [code,symbol]//code //later add array instead of just string currency
            UserShopLists[foundshoplist].listcategories = showcats
            UserShopLists[foundshoplist].listitemscount = itemsoverallqty
            UserShopLists[foundshoplist].listcheckeditemscount = checkeditemsqty
          //  UserShopLists[foundshoplist].listcreationdate = updatedate
            UserShopLists[foundshoplist].listcolorcode = colorcode
        }
        
     //   if let foundfavlist = find(lazy(UserFavLists).map({ $0.listid }), currentList) {
        if let foundfavlist = UserFavLists.map({ $0.listid }).lazy.indexOf(currentList) {
            
            UserFavLists[foundfavlist].listname = self.listnameinview.text
            UserFavLists[foundfavlist].listnote = self.listnoteinview.text
            UserFavLists[foundfavlist].listcurrency = [code,symbol]//code //later add array instead of just string currency
            UserFavLists[foundfavlist].listcategories = showcats
            UserFavLists[foundfavlist].listitemscount = itemsoverallqty
            UserFavLists[foundfavlist].listcheckeditemscount = checkeditemsqty
         //   UserFavLists[foundfavlist].listcreationdate = updatedate
            UserFavLists[foundfavlist].listcolorcode = colorcode
        }

        
        //ItemsCount = idsinthislist.count
        // return ItemsCount
    }
    
    func newPFObject() {
        
        let uuid = NSUUID().UUIDString
        let listuuid = "shoplist\(uuid)"
        var listId: String?
        let shopListNew = PFObject(className:"shopLists")
        
        let local = NSLocale.currentLocale()
        symbol = local.objectForKey(NSLocaleCurrencySymbol) as! String
     //   code = local.objectForKey(NSLocaleCurrencyCode) as! String
        
        if let currencyCode = NSLocale.currentLocale().objectForKey(NSLocaleCurrencyCode) as? String {
            code = currencyCode
            //Will display "USD", for example
        }
        
        
        shopListNew["listUUID"] = listuuid
        
        shopListNew["ShopListName"] = self.listnameinview.text
        shopListNew["ShopListNote"] = ""//ShopListNoteOutlet.text
        //for user stuff
        shopListNew["BelongsToUser"] = PFUser.currentUser()!.objectId!
        // shopListNew["BelongsToUsers"] = [PFUser.currentUser()!.objectId!]
        shopListNew["isReceived"] = false
        shopListNew["isFavourite"] = false
        shopListNew["ShareWithArray"] = []
        shopListNew["sentFromArray"] = ["",""]
        shopListNew["ItemsInTheShopList"] = []
        shopListNew["isSaved"] = false
        
        shopListNew["isDeleted"] = false
        shopListNew["confirmReception"] = false
        shopListNew["isShared"] = false
        
        let creationdate = NSDate()
        
        shopListNew["creationDate"] = creationdate
        shopListNew["updateDate"] = creationdate
        
        shopListNew["ServerUpdateDate"] = creationdate.dateByAddingTimeInterval(-120)
        
        shopListNew["ItemsCount"] = 0
        shopListNew["CheckedItemsCount"] = 0
        
        shopListNew["ListCurrency"] = code
        shopListNew["ShowCats"] = false
        
        shopListNew["CurrencyArray"] = [code,symbol]
        
        shopListNew["ListColorCode"] = colorcode
        
        self.currentList = listuuid
        print("Current list is \(self.currentList)")
        //shopList["ItemsInTheShopList"] = shoppingListItemsIds
        
        /// ALSO NEED TO PUT IT TO ARRAY OF LISTS
        let listid = listuuid
        let listname = self.listnameinview.text
        let listnote = ""//ShopListNoteOutlet.text
        let listcreationdate = creationdate
        let listisfav = false
        let listisreceived = false
        let listbelongsto = PFUser.currentUser()!.objectId!
        let listissentfrom = ["",""]
        let listissaved = false
        
        let listconfirm = false
        let listisdeleted = false
        let listisshared = false
        let listsharewitharray = []
        
        let listitemscount = 0
        let listcheckeditems = 0
        let listtype = "Shop"
        let listcurrency = code
        let listshowcats = false
        let listscolor = colorcode
        
        
        let userlist : UserList = UserList(
            listid:listid,
            listname:listname!,
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
            listsharedwith:listsharewitharray as! [[AnyObject]],
            listitemscount:listitemscount,
            listcheckeditemscount:listcheckeditems,
            listtype:listtype,
            listcurrency:listcurrency,
            listcategories:listshowcats,
            listcolorcode:listscolor
            
        )
        
       // print("Before \(UserLists.count)")
       // print("Before todo \(UserShopLists.count)")
        
        UserShopLists.append(userlist)
        UserLists.append(userlist)
        
       // print("Before \(UserLists.count)")
       // print("Before todo \(UserShopLists.count)")
        
        shopListNew.pinInBackground()
      //  shopListNew.saveEventually()
        //shopListNew.saveInBackgroundWithBlock {
        /*
        shopListNew.saveEventually() {
        (success: Bool, error: NSError?) -> Void in
        if (success) {
        // self.currentList = shopListNew.objectId!
        //self.trycurrent = shopListNew.objectId!
        //println("Current list is \(self.currentList)")
        } else {
        // There was a problem, check error.description
        }
        
        // println("Current list is \(self.currentList)")
        }
        */
        // self.currentList = trycurrent
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //here I will prepare the data for my list
        
        
        //additemstolistsarray()
        
        //listoptionsshow
        if segue.identifier == "listoptionsshow" {
        
        let popoverViewController = segue.destinationViewController as! ListOptionsPopover//UIViewController
        popoverViewController.modalPresentationStyle = UIModalPresentationStyle.CurrentContext //Popover
            
        //popoverViewController.preferredContentSize = CGSizeMake(self.view.frame*0.5, 200)
          //  popOverViewController.preferredContentSize = CGSize(width: 300, height: yourDataArray.count * Int(popOverViewController.tableView.rowHeight))
            
            /* FOR POPOVER
            popoverViewController.preferredContentSize = CGSize(width: 270, height: 420)
            
            
            popoverViewController.popoverPresentationController!.delegate = self

*/
            //popoverViewController.view.backgroundColor = UIColor.grayColor()
            //// popoverViewController.view.layer.borderWidth = 1
           // popoverViewController.view.layer.borderColor = UIColorFromRGB(0x2A2F36).CGColor
            
           // popoverViewController.popoverPresentationController!.delegate = self
            
        
           // popoverViewController.frame = self.view.bounds/2
            //.backgroundColor = UIColor.grayColor()
            //checkview.alpha = 0.8
            //cell.addSubview(checkview)
        
            popoverViewController.delegate = self //WITHOUT THIS IT WONT WORK
        //popoverViewController.cattext = self.categorybutton.titleForState(.Normal)
            popoverViewController.showcats = showcats
            popoverViewController.code = code
            popoverViewController.symbol = symbol
            
            popoverViewController.colorcode = colorcode
            
            popoverViewController.senderVC = "ShopList"
        
        }
    
        if segue.identifier == "AddItemToTheList" {
            //let destinationVC2 : AddItemViewController = segue.destinationViewController as! AddItemViewController
            
            let addnavVC = segue.destinationViewController as! UINavigationController
            
            let destinationVC2 = addnavVC.viewControllers.first as! AddItemViewController
            
            destinationVC2.getcurrentlist = currentList
            destinationVC2.receivedarrayofdicts = itemsDataDict
            
            destinationVC2.existingitem = false
            
           // additemstolistsarray()
            
            
        }
        
        
        if segue.identifier == "showsmallpopup" {
            let popoverViewController = segue.destinationViewController as! SmallPopover//UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
            popoverViewController.preferredContentSize = CGSize(width: 270, height: 320)
            popoverViewController.delegate = self //WITHOUT THIS IT WONT WORK
        
            
            
            
        }

        
        if segue.identifier == "additemmodalsegue" {
          
            
            
            
            let toViewController = segue.destinationViewController as! AddItemViewController//UIViewController
           
            
            
            toViewController.shopdelegate = self // NEED THIS FOR REFRESHING FUNCTION!
            //toViewController.view.alpha = 0.7
            // self.presentViewController(self, animated: true, completion: nil)
            
            
            
            toViewController.getcurrentlist = currentList
            toViewController.receivedarrayofdicts = itemsDataDict
            
            toViewController.existingitem = false
            
            toViewController.sendercontroller = "ShopListCreation"
            
           // additemstolistsarray()
            
            
        }
        
        if segue.identifier == "NewAddItemWithOptions" {
            
            let navVC = segue.destinationViewController as! UINavigationController
            
            let additemsVC = navVC.viewControllers.first as! NewOptionsController
            
            additemsVC.currentlist = currentList
            
            additemsVC.shoplistdelegate = self // DONT FORGET ABOUT THIS!!!
            
        }
        
        if segue.identifier == "EditItem" {
            let navVC1 = segue.destinationViewController as! UINavigationController
            
            let editVC = navVC1.viewControllers.first as! AddItemViewController
            editVC.existingitem = true
            editVC.currentitem = itemtoedit
            
            editVC.getcurrentlist = currentList
            
            
        } //gobacktomainmenusegue
        
        if segue.identifier == "gobacktomainmenusegue" {
            
           // SaveListLocal()
            
           // additemstolistsarray()
            
            let backVC = segue.destinationViewController as! MainMenuViewController
            backVC.isFromShopList = true
            backVC.shoplistid = currentList
            
            
            
            
        }
        
        if segue.identifier == "gobacksegue" {
            
            // SaveListLocal()
            
            
            //additemstolistsarray()
            additemstolistsarrayandsave()
            
            
        }

        
        if segue.identifier == "edititemmodalsegue" {
            
            
         
            
            
            
            let editVC = segue.destinationViewController as! AddItemViewController//UIViewController
            // editVC.view.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.85)//UIColorFromRGB(0x1695A3).colorWithAlphaComponent(0.85)
            //toViewController.view.addSubview(vibrancyView)
            //  editVC.view.addSubview(blurView)
            
            //self.navigationController!.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
            
            
            editVC.shopdelegate = self
            
            editVC.existingitem = true
            editVC.currentitem = itemtoedit
            
            editVC.getcurrentlist = currentList
            
            editVC.sendercontroller = "ShopListCreation"
            
        
            
            
        }
        
        
        if segue.identifier == "ShareFromListCreation" {
            
            let shareNav = segue.destinationViewController as! UINavigationController
            
            let shareVC = shareNav.viewControllers.first as! SharingViewController
            
            additemstolistsarrayandsave()
            
            shareVC.listToShare = currentList
            shareVC.listToShareType = "Shop"
            shareVC.delegate = self
            shareVC.senderVC = "ShopCreationVC"
            
            
            
        }
        
        
        
    }
    
    //var shoppingListItemsIds = [""] //seems like the reason for one redundant cell, for this "" id!
    
    
    //shoppingListItemsPrices.
    
    func summationPrices() {
        
        var itemsprices = [Double]()
        
        for item in itemsDataDict {
            var doublevalue = (item["ItemTotalPrice"] as! String).doubleConverter
            itemsprices.append(doublevalue)
                //append(item["ItemTotalPrice"] as! String)
        }
        var sum = itemsprices.reduce(0, combine: +)
        //var sum = shoppingListItemsPrices.reduce(0, combine: +)
        //var sum = itemsDataDict["ItemTotalPrice"].reduce
        //    var sum = +/(shoppingListItemsPrices)
        
        
        var formatter = NSNumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.usesSignificantDigits = false
        formatter.minimumSignificantDigits = 1
        formatter.maximumSignificantDigits = 9
       // formatter.numberStyle = .CurrencyStyle
        
        
        var textsum: String = formatter.stringFromNumber(sum)!
        
        
        //PricesSum.text = "\(NSLocalizedString("totalsum", comment: "")) \(symbol)\(textsum)"
       // PricesSum.text = "\(NSLocalizedString("totalsum", comment: "")) \(textsum)"
        var rubsymbol : String = "руб."
        
        if code == "RUB" {
            
               PricesSum.text = "\(NSLocalizedString("totalsum", comment: "")) \(textsum) \(rubsymbol)"
        } else {
               PricesSum.text = "\(NSLocalizedString("totalsum", comment: "")) \(symbol)\(textsum)"
        }
        
        
    }
    
    
    
    
    
    func dataretrievallist(){
        
        // for activeItems in shoppingListItemsIds
        // mark
       // for var i = 0;i<item.count;++i {
        
        pauseload()
        
        var query1 = PFQuery(className:"shopItems")
        //query.whereKey("objectId", equalTo:"T7MqKFyDbQ")
        query1.fromLocalDatastore()
        //query1.orderByDescending("CreationDate")
        query1.whereKey("ItemsList", equalTo: activeList!)
        
        print(activeList!)
        
        query1.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                
                self.shoppingListItemsIds.removeAll(keepCapacity: true)
                self.shoppingListItemsNames.removeAll(keepCapacity: true)
                self.shoppingListItemsNotes.removeAll(keepCapacity: true)
                self.shoppingListItemsQuantity.removeAll(keepCapacity: true)
                // self.shoppingListItemsImages.removeAll(keepCapacity: true)
                self.shoppingListItemsPrices.removeAll(keepCapacity: true)
                self.shoppingListItemsUnits.removeAll(keepCapacity: true)
                self.shoppingListItemsImagesPaths.removeAll(keepCapacity: true)
                self.shoppingListItemsImages2.removeAll(keepCapacity: true)
                self.shoppingListItemsIsChecked.removeAll(keepCapacity: true)
                self.shoppingListItemsCategories.removeAll(keepCapacity: true)
                self.shoppingListItemsCategoriesNames.removeAll(keepCapacity: true)
                self.shoppingListItemsIsCatalog.removeAll(keepCapacity: true)
                self.shoppingListOneUnitPrice.removeAll(keepCapacity: true)
                self.shoppingListItemsIsFav.removeAll(keepCapacity: true)
                self.shoppingListItemsPerUnit.removeAll(keepCapacity: true)
                self.checked.removeAll(keepCapacity: true) //getting this array not from parse
                self.shoppingListItemsCreation.removeAll(keepCapacity: true)
                self.shoppingListItemsUpdate.removeAll(keepCapacity: true)
                
                self.shoppingListItemsOriginal.removeAll(keepCapacity: true)
                
                self.shoppingListItemsIsDefPict.removeAll(keepCapacity: true)
                self.shoppingListItemsDefaultOriginal.removeAll(keepCapacity: true)
                
                self.shoppingpffile.removeAll(keepCapacity: true)
                
                shoppingcheckedtocopy.removeAll(keepCapacity: true)
                
                itemsDataDict.removeAll(keepCapacity: true)
                
                
                
                if let listitems = objects as? [PFObject] {
                    
                    //shoppingListItemsIds.removeAll(keepCapacity: true)
                    
                    for object in listitems {
                        // print(object.objectId)
                        //self.shoppingListItemsIds.append(object.objectId!)//["itemName"] as)
                        
                        self.shoppingListItemsIds.append(object["itemUUID"] as! String)
                        self.shoppingListItemsNames.append(object["itemName"] as! String)
                        self.shoppingListItemsNotes.append(object["itemNote"] as! String)
                        self.shoppingListItemsQuantity.append(object["itemQuantity"] as! String)
                        /*
                        if self.isReceivedList == true {
                        
                        self.shoppingListItemsImages.append(object["itemImage"] as! PFFile)
                        } else {
                        self.shoppingListItemsImages.append("no image on server")
                        }
                        */
                        self.shoppingListOneUnitPrice.append(object["itemPriceS"] as! String)
                        self.shoppingListItemsPrices.append(object["TotalSumS"] as! String)
                        self.shoppingListItemsUnits.append(object["itemUnit"] as! String)
                        self.shoppingListItemsPerUnit.append(object["perUnit"] as! String)
                        self.shoppingListItemsIsCatalog.append(object["isCatalog"] as! Bool)
                        
                        self.shoppingListItemsIsFav.append(object["isFav"] as! Bool)
                        
                        
                        self.shoppingListItemsIsDefPict.append(object["defaultpicture"] as! Bool)
                        self.shoppingListItemsDefaultOriginal.append(object["OriginalInDefaults"] as! String)
                        
                        if object["isCatalog"] as! Bool == false {
                            
                            // self.loadImageFromLocalStore(object["imageLocalPath"] as! String)
                            
                           // self.shoppingListItemsImages2.append(self.imageToLoad)
                            
                            if object["defaultpicture"] as! Bool == false {
                               
                                self.loadImageFromLocalStore(object["imageLocalPath"] as! String)
                                
                                self.shoppingListItemsImages2.append(self.imageToLoad)
                                
                                
                                                              /*
                                var imageFile = object["itemImage"] as? PFFile
                                if imageFile != nil {
                                var imageData = imageFile!.getData()
                                if (imageData != nil) {
                                var image = UIImage(data: imageData!)
                                self.shoppingListItemsImages2.append(image!)
                                    print(image)
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }
                                                            */

                            } else {
                                
                                    var imagename = object["OriginalInDefaults"] as! String
                                
                                if (UIImage(named: "\(imagename)") != nil) {
                                self.shoppingListItemsImages2.append(UIImage(named: "\(imagename)")!)
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }

                            }

                        } else {
                            //if catalog item
                            //self.shoppingListItemsImages2.append(
                          //  if let founditem = find(lazy(catalogitems).map({ $0.itemId }), (object["originalInCatalog"] as! String)) {
                            
                             if let founditem = catalogitems.map({ $0.itemId }).lazy.indexOf((object["originalInCatalog"] as! String)) {
                            let catalogitem = catalogitems[founditem]
                                
                                self.shoppingListItemsImages2.append(catalogitem.itemimage)
                             } else {
                                self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                            }
                        }
                        
                        self.shoppingListItemsImagesPaths.append(object["imageLocalPath"] as! String)
                        
                        self.checked.append(false)
                        
                        self.shoppingListItemsIsChecked.append(object["isChecked"] as! Bool)
                        
                        self.shoppingListItemsCategories.append(object["Category"] as! String)
                        
                        self.shoppingListItemsOriginal.append(object["originalInCatalog"] as! String)
                        
                        self.shoppingListItemsCreation.append(object["CreationDate"] as! NSDate)
                        
                        self.shoppingListItemsUpdate.append(object["UpdateDate"] as! NSDate)
                        
                       // print("Cats are \(self.shoppingListItemsCategories)")
                        
                        shoppingcheckedtocopy.append(false)
                        
                        self.summationPrices()
                        
                        self.tableView.reloadData() // without this thing, table would contain only 1 row
                        
                        
                        
                    }
                }
                
                self.getcategoriesnames(self.shoppingListItemsCategories)
                self.fillthedict()
                
                self.restoreload()
                
                if itemsDataDict.count > 0 {
                  //  self.noitemview.hidden = true
                } else {
                  //  self.noitemview.hidden = false
                }
                
            } else {
                // Log details of the failure
                self.restoreload()
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        // NOW NEW QUERY TO GET LIST NAME AND NOTE BY DEFAULT
        var queryListInfo = PFQuery(className:"shopLists")
        //query.whereKey("objectId", equalTo:"T7MqKFyDbQ")
        queryListInfo.fromLocalDatastore()
        //queryListInfo.whereKey("objectId", equalTo: activeList!)
        queryListInfo.whereKey("listUUID", equalTo: activeList!)
        queryListInfo.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                
                
                
                if let list = objects as? [PFObject] {
                    
                    //shoppingListItemsIds.removeAll(keepCapacity: true)
                    
                    for object in list {
                        
                        //self.self.listnameinview.text = object["ShopListName"] as! String
                        self.listnoteinview.text = object["ShopListNote"] as! String
                        self.listnameinview.text = object["ShopListName"] as! String
                        
                        self.navigationItem.title = object["ShopListName"] as! String
                        
                        //need to know if its received
                        self.isReceivedList = object["isReceived"] as! Bool
                        
                        var currencyarray = object["CurrencyArray"] as! [AnyObject]
                        
                        code = (stringInterpolationSegment: currencyarray[0] as! String)
                        symbol = (stringInterpolationSegment: currencyarray[1] as! String)
                        //pass those variables to popup later
                        
                        self.changecodeandsymbol(code, newsymbol: symbol)
                        
                        self.tableView.reloadData()
                        
                       // self.choosecurrency.setTitle(String(stringInterpolationSegment: currencyarray[1]), forState: UIControlState.Normal)
                        
                    }
                }
            } else {
                // Log details of the failure
                self.restoreload()
                print("Error: \(error!) \(error!.userInfo)")
            }
            
        }
        
        tableView.reloadData()
        summationPrices() // THIS GUY SAVES THE DAY
        
    }
    
    
    func dataretrievalinorder()
    {
        
        // for activeItems in shoppingListItemsIds
        // mark2
        // for var i = 0;i<item.count;++i {
        
        var itemsarray = [String]()
        
        var queryitemsarray = PFQuery(className:"shopLists")
        queryitemsarray.fromLocalDatastore()
        // querynew.getObjectInBackgroundWithId(itemtocheck) {
        queryitemsarray.whereKey("listUUID", equalTo: activeList!)
        queryitemsarray.limit = 1
        var lists = queryitemsarray.findObjects()
        if (lists != nil) {
            for list in lists! {
                
                if let thislist = list["ItemsInTheShopList"] as? [String] { //used to be username
                    
                    
                    
                    itemsarray.appendContentsOf(list["ItemsInTheShopList"] as! [String])
                    
                }
                
                
            }
        } else {
            print("Error")
        }
        
        self.shoppingListItemsIds.removeAll(keepCapacity: true)
        self.shoppingListItemsNames.removeAll(keepCapacity: true)
        self.shoppingListItemsNotes.removeAll(keepCapacity: true)
        self.shoppingListItemsQuantity.removeAll(keepCapacity: true)
        // self.shoppingListItemsImages.removeAll(keepCapacity: true)
        self.shoppingListItemsPrices.removeAll(keepCapacity: true)
        self.shoppingListItemsUnits.removeAll(keepCapacity: true)
        self.shoppingListItemsImagesPaths.removeAll(keepCapacity: true)
        self.shoppingListItemsImages2.removeAll(keepCapacity: true)
        self.shoppingListItemsIsChecked.removeAll(keepCapacity: true)
        self.shoppingListItemsCategories.removeAll(keepCapacity: true)
        self.shoppingListItemsCategoriesNames.removeAll(keepCapacity: true)
        self.shoppingListItemsIsCatalog.removeAll(keepCapacity: true)
        self.shoppingListOneUnitPrice.removeAll(keepCapacity: true)
        self.shoppingListItemsIsFav.removeAll(keepCapacity: true)
        self.shoppingListItemsPerUnit.removeAll(keepCapacity: true)
        self.checked.removeAll(keepCapacity: true) //getting this array not from parse
        self.shoppingListItemsCreation.removeAll(keepCapacity: true)
        self.shoppingListItemsUpdate.removeAll(keepCapacity: true)
        
        self.shoppingListItemsOriginal.removeAll(keepCapacity: true)
        
        self.shoppingListItemsIsDefPict.removeAll(keepCapacity: true)
        self.shoppingListItemsDefaultOriginal.removeAll(keepCapacity: true)
        
        self.shoppingpffile.removeAll(keepCapacity: true)
        
        shoppingcheckedtocopy.removeAll(keepCapacity: true)
        
        itemsDataDict.removeAll(keepCapacity: true)
        
        // maybe this will reduce time of loading a bit
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        
        for var i = 0;i<itemsarray.count;++i {
            
          

        
        var query1 = PFQuery(className:"shopItems")
        query1.fromLocalDatastore()
        //query1.orderByDescending("CreationDate")
            query1.limit = 1
        query1.whereKey("itemUUID", equalTo: itemsarray[i])
        
            
          var objects = query1.findObjects()
            if (objects != nil) {
                if let listitems = objects as? [PFObject] {
                for object in listitems {
                

                    /*
                    if let thislist = list["ItemsInTheShopList"] as? [String] { //used to be username
                        
                        println(list["ItemsInTheShopList"])
                        
                        itemsarray.extend(list["ItemsInTheShopList"] as! [String])
                        
                    }
                    */
                    self.shoppingListItemsIds.append(object["itemUUID"] as! String)
                    self.shoppingListItemsNames.append(object["itemName"] as! String)
                    self.shoppingListItemsNotes.append(object["itemNote"] as! String)
                    self.shoppingListItemsQuantity.append(object["itemQuantity"] as! String)
                    /*
                    if self.isReceivedList == true {
                    
                    self.shoppingListItemsImages.append(object["itemImage"] as! PFFile)
                    } else {
                    self.shoppingListItemsImages.append("no image on server")
                    }
                    */
                    self.shoppingListOneUnitPrice.append(object["itemPriceS"] as! String)
                    self.shoppingListItemsPrices.append(object["TotalSumS"] as! String)
                    self.shoppingListItemsUnits.append(object["itemUnit"] as! String)
                    self.shoppingListItemsPerUnit.append(object["perUnit"] as! String)
                    self.shoppingListItemsIsCatalog.append(object["isCatalog"] as! Bool)
                    
                    self.shoppingListItemsIsFav.append(object["isFav"] as! Bool)
                    
                    
                    self.shoppingListItemsIsDefPict.append(object["defaultpicture"] as! Bool)
                    self.shoppingListItemsDefaultOriginal.append(object["OriginalInDefaults"] as! String)
                    
                    if object["isCatalog"] as! Bool == false {
                        
                        //self.loadImageFromLocalStore(object["imageLocalPath"] as! String)
                        
                        // self.shoppingListItemsImages2.append(self.imageToLoad)
                        
                        if object["defaultpicture"] as! Bool == false {
                            
                            
                            var imageFile = object["itemImage"] as? PFFile
                            if imageFile != nil {
                                var imageData = imageFile!.getData()
                                if (imageData != nil) {
                                    var image = UIImage(data: imageData!)
                                    self.shoppingListItemsImages2.append(image!)
                                    //print(image)
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }
                            } else {
                                self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                            }
                            
                            
                        } else {
                            
                            var imagename = object["OriginalInDefaults"] as! String
                            
                            if (UIImage(named: "\(imagename)") != nil) {
                                self.shoppingListItemsImages2.append(UIImage(named: "\(imagename)")!)
                            } else {
                                self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                            }
                            
                        }
                        
                    } else {
                        //if catalog item
                        //self.shoppingListItemsImages2.append(
                      //  if let founditem = find(lazy(catalogitems).map({ $0.itemId }), (object["originalInCatalog"] as! String)) {
                        
                          if let founditem = catalogitems.map({ $0.itemId }).lazy.indexOf((object["originalInCatalog"] as! String)) {
                        let catalogitem = catalogitems[founditem]
                            
                            self.shoppingListItemsImages2.append(catalogitem.itemimage)
                        }
                    }
                    
                    self.shoppingListItemsImagesPaths.append(object["imageLocalPath"] as! String)
                    
                    self.checked.append(false)
                    
                    self.shoppingListItemsIsChecked.append(object["isChecked"] as! Bool)
                    
                    self.shoppingListItemsCategories.append(object["Category"] as! String)
                    
                    self.shoppingListItemsOriginal.append(object["originalInCatalog"] as! String)
                    
                    self.shoppingListItemsCreation.append(object["CreationDate"] as! NSDate)
                    
                    self.shoppingListItemsUpdate.append(object["UpdateDate"] as! NSDate)
                    
                    
                    
                    shoppingcheckedtocopy.append(false)
                    
                    self.summationPrices()
                    
                  //  self.tableView.reloadData()
                    
                }
            }
            } else {
                print("Error")
            }

        /*
        query1.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
            
                println("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects

                
                
                if let listitems = objects as? [PFObject] {
                    
                    //shoppingListItemsIds.removeAll(keepCapacity: true)
                    
                    for object in listitems {
                        println(object.objectId)
                        //self.shoppingListItemsIds.append(object.objectId!)//["itemName"] as)
                        
                        self.shoppingListItemsIds.append(object["itemUUID"] as! String)
                        self.shoppingListItemsNames.append(object["itemName"] as! String)
                        self.shoppingListItemsNotes.append(object["itemNote"] as! String)
                        self.shoppingListItemsQuantity.append(object["itemQuantity"] as! String)
                        /*
                        if self.isReceivedList == true {
                        
                        self.shoppingListItemsImages.append(object["itemImage"] as! PFFile)
                        } else {
                        self.shoppingListItemsImages.append("no image on server")
                        }
                        */
                        self.shoppingListOneUnitPrice.append(object["itemPrice"] as! Double)
                        self.shoppingListItemsPrices.append(object["TotalSum"] as! Double)
                        self.shoppingListItemsUnits.append(object["itemUnit"] as! String)
                        self.shoppingListItemsPerUnit.append(object["perUnit"] as! String)
                        self.shoppingListItemsIsCatalog.append(object["isCatalog"] as! Bool)
                        
                        self.shoppingListItemsIsFav.append(object["isFav"] as! Bool)
                        
                        
                        self.shoppingListItemsIsDefPict.append(object["defaultpicture"] as! Bool)
                        self.shoppingListItemsDefaultOriginal.append(object["OriginalInDefaults"] as! String)
                        
                        if object["isCatalog"] as! Bool == false {
                            
                            //self.loadImageFromLocalStore(object["imageLocalPath"] as! String)
                            
                            // self.shoppingListItemsImages2.append(self.imageToLoad)
                            
                            if object["defaultpicture"] as! Bool == false {
                                
                                
                                var imageFile = object["itemImage"] as? PFFile
                                if imageFile != nil {
                                    var imageData = imageFile!.getData()
                                    if (imageData != nil) {
                                        var image = UIImage(data: imageData!)
                                        self.shoppingListItemsImages2.append(image!)
                                        println(image)
                                    } else {
                                        self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                    }
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }
                                
                                
                            } else {
                                
                                var imagename = object["OriginalInDefaults"] as! String
                                
                                if (UIImage(named: "\(imagename)") != nil) {
                                    self.shoppingListItemsImages2.append(UIImage(named: "\(imagename)")!)
                                } else {
                                    self.shoppingListItemsImages2.append(imagestochoose[0].itemimage)
                                }
                                
                            }
                            
                        } else {
                            //if catalog item
                            //self.shoppingListItemsImages2.append(
                            if let founditem = find(lazy(catalogitems).map({ $0.itemId }), (object["originalInCatalog"] as! String)) {
                                let catalogitem = catalogitems[founditem]
                                
                                self.shoppingListItemsImages2.append(catalogitem.itemimage)
                            }
                        }
                        
                        self.shoppingListItemsImagesPaths.append(object["imageLocalPath"] as! String)
                        
                        self.checked.append(false)
                        
                        self.shoppingListItemsIsChecked.append(object["isChecked"] as! Bool)
                        
                        self.shoppingListItemsCategories.append(object["Category"] as! String)
                        
                        self.shoppingListItemsOriginal.append(object["originalInCatalog"] as! String)
                        
                        self.shoppingListItemsCreation.append(object["CreationDate"] as! NSDate)
                        
                        self.shoppingListItemsUpdate.append(object["UpdateDate"] as! NSDate)
                        
                        println("Cats are \(self.shoppingListItemsCategories)")
                        
                        shoppingcheckedtocopy.append(false)
                        
                        self.summationPrices()
                        
                        self.tableView.reloadData() // without this thing, table would contain only 1 row
                        
                        
                        
                    }
                }
                
              //  self.getcategoriesnames(self.shoppingListItemsCategories)
               // self.fillthedict()
                
                
                
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
        */
    } //end of for loop
        
        self.getcategoriesnames(self.shoppingListItemsCategories)
        self.fillthedict()
        
        
        dispatch_async(dispatch_get_main_queue(), {
        self.tableView.reloadData()
            })
        
    })
    
        // NOW NEW QUERY TO GET LIST NAME AND NOTE BY DEFAULT
        var queryListInfo = PFQuery(className:"shopLists")
        //query.whereKey("objectId", equalTo:"T7MqKFyDbQ")
        queryListInfo.fromLocalDatastore()
        //queryListInfo.whereKey("objectId", equalTo: activeList!)
        queryListInfo.whereKey("listUUID", equalTo: activeList!)
        queryListInfo.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                
                
                
                if let list = objects as? [PFObject] {
                    
                    //shoppingListItemsIds.removeAll(keepCapacity: true)
                    
                    for object in list {
                        
                        self.self.listnameinview.text = object["ShopListName"] as! String
                       // self.ShopListNoteOutlet.text = object["ShopListNote"] as! String
                        
                        //need to know if its received
                        self.isReceivedList = object["isReceived"] as! Bool
                        
                        var currencyarray = object["CurrencyArray"] as! [AnyObject]
                        
                        code = (stringInterpolationSegment: currencyarray[0] as! String)
                        symbol = (stringInterpolationSegment: currencyarray[1] as! String)
                        //pass those variables to popup later
                        
                        self.colorcode = object["ListColorCode"] as! String
                        
                        // self.choosecurrency.setTitle(String(stringInterpolationSegment: currencyarray[1]), forState: UIControlState.Normal)
                        
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
            
        }
        
        //tableView.reloadData()
        summationPrices() // THIS GUY SAVES THE DAY
        
    }
    
        
        
    
    
    /*
    func dataretrieval(){
    
    println(self.mystring)
    
    
    }
    */
    
    func fillthedict() {
        
        // need for order
        var itemsarray = [String]()
        
        let queryitemsarray = PFQuery(className:"shopLists")
        queryitemsarray.fromLocalDatastore()
        // querynew.getObjectInBackgroundWithId(itemtocheck) {
        queryitemsarray.whereKey("listUUID", equalTo: activeList!)
        queryitemsarray.limit = 1
        let lists = queryitemsarray.findObjects()
        if (lists != nil) {
            for list in lists! {
                
                if let thislist = list["ItemsInTheShopList"] as? [String] { //used to be username
                    
                    
                    
                    itemsarray.appendContentsOf(list["ItemsInTheShopList"] as! [String])
                    
                }
                
                
            }
        } else {
            print("Error")
        }
        ///

        
        
        for var i = 0;i<shoppingListItemsIds.count;++i {
       // for var i = 0;i<itemsarray.count;++i {
            let itemid = shoppingListItemsIds[i] as String
            let itemname = shoppingListItemsNames[i] as String
            let itemnote = shoppingListItemsNotes[i] as String
            let itemquantity = shoppingListItemsQuantity[i] as String
            let itemprice = shoppingListItemsPrices[i] as String//["username"] as! String
            //name += " " + lName
            // var itemimage: AnyObject = shoppingListItemsImages[i] as AnyObject
            
        
            
            
            let itemimage2 = shoppingListItemsImages2[i] as UIImage
            let itemimagepath = shoppingListItemsImagesPaths[i] as String
            let itemunit = shoppingListItemsUnits[i] as String
            let itemchecked = shoppingListItemsIsChecked[i] as Bool
            let itemcategory = shoppingListItemsCategories[i] as String
            let itemcategoryname = shoppingListItemsCategoriesNames[i] as String
            
            let originalincatalog = shoppingListItemsOriginal[i] as String
            let itemiscatalog = shoppingListItemsIsCatalog[i] as Bool
            
            let itemoneunitprice = shoppingListOneUnitPrice[i] as String
            
            let itemisfav = shoppingListItemsIsFav[i] as Bool
            let itemperunit = shoppingListItemsPerUnit[i] as String
            
            let itemcreation = shoppingListItemsCreation[i] as NSDate
            let itemupdate = shoppingListItemsUpdate[i] as NSDate
            
            let itemisdefaultpict =  shoppingListItemsIsDefPict[i] as Bool
            let itemoriginalindefaults =  shoppingListItemsDefaultOriginal[i] as String
            
            ///try to sort this based on the predefined order
            
            let index : Int = 1
            
            // self.dictionary = ["ItemId":itemId,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemprice,"ItemImagePath":itemimagepath,"ItemUnit":itemunit,"ItemIsChecked":itemischecked,"ItemImage2":itemimage2,"ItemCategory":itemcategory,"ItemIsCatalog":itemiscatalog,"ItemOriginal":originalincatalog,"ItemCategoryName":categoryname]
            
            dictionary = ["ItemId":itemid,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemprice,"ItemImage2":itemimage2,"ItemUnit":itemunit,"ItemIsChecked":itemchecked,"ItemImagePath":itemimagepath,"ItemCategory":itemcategory,"ItemIsCatalog":itemiscatalog,"ItemOriginal":originalincatalog,"ItemCategoryName":itemcategoryname,"ItemOneUnitPrice":itemoneunitprice,"ItemIsFav":itemisfav,"ItemPerUnit":itemperunit,"ItemCreation":itemcreation,"ItemUpdate":itemupdate,"ItemIsDefPict":itemisdefaultpict,"ItemOriginalInDefaults":itemoriginalindefaults,"Index":index]
            // dictionary = ["ItemId":itemid,"ItemName":itemname,"ItemNote":itemnote, "ItemQuantity":itemquantity,"ItemTotalPrice":itemprice,"ItemImage2":itemimage2,"ItemUnit":itemunit,"ItemChecked":itemchecked,"ItemImagePath":itemimagepath,"ItemCategory":itemcategory]
            
            if containsdict(itemsDataDict, element: dictionary) {
                print("Already contains this item")
            } else {
                
                itemsDataDict.append(dictionary)
            }
            
            // itemsDataDict.append(dictionary)
        }
        
        ///try to sort this based on the predefined order
        
        for var i = 0; i < itemsarray.count; i++ {
            for var j = 0; j < itemsDataDict.count; j++ {
            if (itemsDataDict[j]["ItemId"] as! String) == itemsarray[i] {
                itemsDataDict[j]["Index"] = i
                break
            } else {
                
                }
            }
        }
        
        itemsDataDict.sortInPlace {
            item1, item2 in
            let date1 = item1["Index"] as! Int
            let date2 = item2["Index"] as! Int
            return date1 < date2
        }
        
        
     
        
        //println("dict \(dictionary)")
      //  print("array of dicts \(itemsDataDict)")
      //  print("COUNT IS ___________\(itemsDataDict.count)")
        
        self.sortcategories(itemsDataDict)
        /*
        if itemsDataDict.count == 0 {
            noitemview.hidden = false
        } else {
            noitemview.hidden = true
        }
        */
        
        //// new stuff
        self.shoppingListItemsIds.removeAll(keepCapacity: true)
        self.shoppingListItemsNames.removeAll(keepCapacity: true)
        self.shoppingListItemsNotes.removeAll(keepCapacity: true)
        self.shoppingListItemsQuantity.removeAll(keepCapacity: true)
        // self.shoppingListItemsImages.removeAll(keepCapacity: true)
        self.shoppingListItemsPrices.removeAll(keepCapacity: true)
        self.shoppingListItemsUnits.removeAll(keepCapacity: true)
        self.shoppingListItemsImagesPaths.removeAll(keepCapacity: true)
        self.shoppingListItemsImages2.removeAll(keepCapacity: true)
        self.shoppingListItemsIsChecked.removeAll(keepCapacity: true)
        self.shoppingListItemsCategories.removeAll(keepCapacity: true)
        self.shoppingListItemsCategoriesNames.removeAll(keepCapacity: true)
        self.shoppingListItemsIsCatalog.removeAll(keepCapacity: true)
        self.shoppingListOneUnitPrice.removeAll(keepCapacity: true)
        self.shoppingListItemsIsFav.removeAll(keepCapacity: true)
        self.shoppingListItemsPerUnit.removeAll(keepCapacity: true)
        self.shoppingListItemsCreation.removeAll(keepCapacity: true)
        self.shoppingListItemsUpdate.removeAll(keepCapacity: true)
        self.shoppingListItemsOriginal.removeAll(keepCapacity: true)
        self.shoppingListItemsIsDefPict.removeAll(keepCapacity: true)
        self.shoppingListItemsDefaultOriginal.removeAll(keepCapacity: true)
        
        self.checked.removeAll(keepCapacity: true) //getting this array not from parse
        
        
        
        
        ////
        
        summationPrices()
        
        countitems()
        countchecked()
        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
    }
    
    
    
    func retrievalfromdictionary() {
        
    }
    
    
    func addMultipleFunc(){
        
        performSegueWithIdentifier("AddItemWithOptions", sender: self)
        
    }
    
    
    func addBarButtonTapped(){
        //performSegueWithIdentifier("AddItemToTheList", sender: self)
        // performSegueWithIdentifier("AddItemWithOptions", sender: self)
        performSegueWithIdentifier("additemmodalsegue", sender: self)
        
    }
    
    func listsBarButtonTapped() {
        performSegueWithIdentifier("ShowAllLists2", sender: self)
        // won't work until segue created in storyboard also
        //link: http://stackoverflow.com/questions/26456989/how-do-i-create-a-segue-that-can-be-called-from-a-button-that-is-created-program
    }
    
    @IBAction func NewItemButtonTapped(sender: AnyObject) {
        addBarButtonTapped()
    }
    
    
    
    @IBAction func AddMultipleItems(sender: AnyObject) {
        addMultipleFunc()
    }
    
    
    func countchecked() -> Int {
        
        var quantityofchecked = [Bool]()
        
        for item in itemsDataDict {
            if item["ItemIsChecked"] as! Bool == true {
                quantityofchecked.append(item["ItemIsChecked"] as! Bool)
            } else {
                print("Not checked")
            }
        }
        checkeditemsqty = quantityofchecked.count
        return checkeditemsqty
    }
    
    
    /*
    func countchecked(checkeditems : [Bool]) -> Int {
    
    var quantityofchecked = [Bool]()
    
    for item in checkeditems {
    if item["ItemIsChecked"] == true {
    quantityofchecked.append(item)
    } else {
    println("Not checked")
    }
    }
    checkeditemsqty = quantityofchecked.count
    return checkeditemsqty
    }
    */
    
    func countitems() -> Int {
        //itemsoverallqty = shoppingListItemsIds.count
        itemsoverallqty = itemsDataDict.count
        return itemsoverallqty
    }
    /*
    override func viewDidAppear(animated: Bool) {
    tableView.reloadData()
    summationPrices()
    }
    */
    
    
    @IBAction func unwindToCreationOfShopList(sender: UIStoryboardSegue){
        // bug? exit segue doesn't dismiss so we do it manually...
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet var toptoolbar: UIToolbar!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
    
    func containseventid(values: [String], element: String) -> Bool {
        
        for value in values {
            
            if value == element {
                return true
            }
        }
        // The element was not found.
        return false
    }
    
    
    func reloadTableAfterPush() {
        
        
       // let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
       // dispatch_async(dispatch_get_global_queue(priority, 0)) {
        
        
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        
      // checkreceivedlists
        var receivedcount : Int = 0
        
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
                    
                    //self.tableView.reloadData()
                    
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
                    
                    // self.tableView.reloadData()
                    
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
        
        
        
        // checkreceivedevents
        var queryevents = PFQuery(className:"UsersEvents")
        
        queryevents.whereKey("ReceiverId", equalTo: PFUser.currentUser()!.objectId!)
        queryevents.whereKey("isReceived", equalTo: false)
        queryevents.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                //userevents.removeAll(keepCapacity: true)
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                
                //receivedeventscount = objects!.count
                
                if let listitems = objects as? [PFObject] {
                    for object in listitems {
                        
                        var etype = object["EventType"] as! String
                        
                        if etype == "GoShop" {
                            
                            var enote = object["EventText"] as! String
                            var edate = object.createdAt //["createdAt"] as! NSDate
                            var euser = object["senderInfo"] as! [AnyObject]
                            var erecuser = object["receiverInfo"] as! [AnyObject]
                            var eid = object["eventUUID"] as! String
                            
                            if !self.containseventid(blacklistarray, element: euser[0] as! String) {
                                
                                if !self.containseventid(userevents.map({ $0.eventid! }), element: eid) {
                                    
                                    userevents.append(Event(eventtype: etype, eventnote: enote, eventdate: edate!, eventuser: euser, eventreceiver: erecuser, eventid: eid))
                                    
                                    
                                    
                                    object["isReceived"] = true
                                    
                                    receivedeventscount += 1
                                    
                                    
                                    object.pinInBackgroundWithBlock({ (success, error) -> Void in
                                        if success {
                                            //self.restore()
                                            print("saved item")
                                            object["isReceived"] = true
                                            object.saveEventually()
                                            
                                        } else {
                                            print("no id found")
                                        }
                                    })
                                    
                                } else {
                                    print("Such event is already loaded")
                                }
                            } else {
                                print("This sender id is blocked")
                            }
                            
                        } else if etype == "AddContact" {
                            
                            var enote = object["EventText"] as! String
                            var edate = object.createdAt//object["createdAt"] as! NSDate
                            var euser = object["senderInfo"] as! [AnyObject]
                            var erecuser = object["receiverInfo"] as! [AnyObject]
                            
                            var eid = object["eventUUID"] as! String
                            
                            var senderavatarfile = object["senderavatar"] as? PFFile
                            
                            var senderimage = UIImage()
                            
                            if senderavatarfile != nil {
                                var imageData = senderavatarfile!.getData()
                                if (imageData != nil) {
                                    var image = UIImage(data: imageData!)
                                    senderimage = image!
                                } else {
                                    senderimage = defaultcatimages[1].itemimage//UIImage(named: "checkeduser.png")!
                                }
                            } else {
                                senderimage = defaultcatimages[1].itemimage//UIImage(named: "checkeduser.png")!
                            }
                            
                            
                            if !self.containseventid(blacklistarray, element: euser[0] as! String) {
                                
                                if !self.containseventid(userevents.map({ $0.eventid! }), element: eid) {
                                    
                                    userevents.append(Event(eventtype: etype, eventnote: enote, eventdate: edate!, eventuser: euser, eventreceiver: erecuser, eventid: eid, eventreceiverimage: senderimage))
                                    
                                    object["isReceived"] = true
                                    
                                    receivedeventscount += 1
                                    
                                    
                                    object.pinInBackgroundWithBlock({ (success, error) -> Void in
                                        if success {
                                            //self.restore()
                                            print("saved item")
                                            object["isReceived"] = true
                                            object.saveEventually()
                                            
                                        } else {
                                            print("no id found")
                                        }
                                    })
                                    
                                    
                                    
                                } else {
                                    print("Such event is already loaded")
                                }
                                
                            } else {
                                print("This sender id is blocked!")
                            }
                            
                        }
                        
                    }
                    userevents.sortInPlace({ $0.eventdate.compare($1.eventdate) == NSComparisonResult.OrderedDescending })
                  
                    
                    
                }
                
                //self.addcustomstocatalogitems(customcatalogitems)
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }) // end of dispatch
    }
    
    
    @IBOutlet var newquickview: UIView!
    
    var poppresented : Bool = false
    
    
    override func viewDidLayoutSubviews() {
        
        //newquickview.frame.height.constant = 0
        super.viewDidLayoutSubviews()
    // smallpopover.frame = CGRectMake(newquickview.frame.origin.x, 154, newquickview.frame.width, 0)
        
       //smallpopover.center.y = self.view.frame.origin.y - 300
        //smallpopover.center.y - self.view.frame.height
        
     //   self.inamountview.frame = CGRectMake(self.smallpopover.frame.origin.x + 8, self.inamountview.frame.origin.y + 32, 149, 0)
        
      //  self.inunitsfield.frame = CGRectMake(219, self.inamountview.frame.origin.y + 32, 149, 0)
       // smallpopover.frame.origin.y = self.view.frame.origin.y
      //  self.smallpopover.center.y = 150
       // self.smallpopover.frame.origin.y = self.view.frame.origin.y - 300
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //self.smallpopover.frame.origin.y = self.view.frame.origin.y - 300
      //  self.smallpopover.frame.origin.y = self.view.frame.origin.y - 300
    }
    
    @IBOutlet var quicksmallconstraint: NSLayoutConstraint!
    
    @IBOutlet var newquantitybutton: UIButton!
    let blackquantity: UIImage = UIImage(named:"OpenQuantityB")!
    
    let redquantity: UIImage = UIImage(named:"CloseQuantityB")!
    
    @IBAction func slidesmallpopover(sender: AnyObject) {
        //
        if poppresented == false {
        
            
        poppresented = true
            
             self.newquantitybutton.setImage(self.redquantity, forState: .Normal)
        
            smallpopover.hidden = false
            
            //smallpopover.alpha = 1
            smallpopover.fadeIn()
            
            /*
            self.quicksmallconstraint.constant = -5
            
            let yPos : CGFloat = 151
          //  self.smallpopover.frame.origin.y = self.view.frame.origin.y - 300
        UIView.animateWithDuration(0.4, animations: { () -> Void in
           // self.smallpopover.frame.origin.y = yPos
            self.view.layoutIfNeeded()
            }, completion: { (value: Bool) -> Void in
               // self.quicksmallconstraint.constant = -5
        })
 */
            
            /*
            UIView.transitionWithView(self.smallpopover, duration: 0.4, options: [], animations: {
                self.smallpopover.frame.origin.y = 250
            }, completion: { finished in
            })
*/
        } else {
            
            poppresented = false
            
            newquantitybutton.setImage(blackquantity, forState: .Normal)
            /*
            self.quicksmallconstraint.constant = -456
            
           // let yPos : CGFloat = -300
          //  self.smallpopover.frame.origin.y = 151
            UIView.animateWithDuration(0.4, animations: { () -> Void in
              //  self.smallpopover.frame.origin.y = yPos
              //  self.quicksmallconstraint.constant = -451
                self.view.layoutIfNeeded()
                }, completion: { (value: Bool) -> Void in
                    // self.quicksmallconstraint.constant = -5
                    self.smallpopover.hidden = true
            })
            */
            smallpopover.fadeOut()
            self.smallpopover.hidden = true
            
            getinfofrompop(buttontitle, quantity: popqty.text!)

            
        }
    }
    
    
    
    @IBOutlet var smallpopover: UIView!
    
    @IBOutlet var inamountview: UIView! //44
    
    @IBOutlet var inunitsfield: UILabel!
    //44
    
//139
    
    @IBOutlet var capt1: UILabel! //21
    
    @IBOutlet var capt2: UILabel!
    
    
    @IBOutlet var capt3: UILabel!
    
    
    // MARK: small popover part
    
    
    @IBOutlet var lightbgview: UIView!
    
    var buttontitle = String()
    
    var doublenumber = Double()
    
    func closenumberpad(sender: UIButton) {
        popqty.resignFirstResponder()
    }
    
    var closepadimage = UIImage(named: "ClosePad")!
    
    @IBAction func decrement(sender: AnyObject) {
        
        var getvalue: Double {
            // get {return Qfield.text.toInt()!}
            // get {return (qtyfield.text! as NSString).doubleValue}
            get {return popqty.text!.doubleConverter}
        }
        
        doublenumber = getvalue
        
        doublenumber -= 1
        //qtyfield.text = String(format: "%.2f", (stringInterpolationSegment: doublenumber))
        
        var formatter = NSNumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.usesSignificantDigits = false
        formatter.minimumSignificantDigits = 1
        formatter.maximumSignificantDigits = 9
        
        popqty.text = formatter.stringFromNumber(doublenumber)
        
    }
    
    
    @IBAction func increment(sender: AnyObject) {
        
        var getvalue: Double {
            // get {return Qfield.text.toInt()!}
            //get {return (qtyfield.text! as NSString).doubleValue}
            get {return popqty.text!.doubleConverter}
        }
        
        doublenumber = getvalue
        
        doublenumber += 1
        
        var formatter = NSNumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.usesSignificantDigits = false
        formatter.minimumSignificantDigits = 1
        formatter.maximumSignificantDigits = 9
        
        popqty.text = formatter.stringFromNumber(doublenumber)//String(format: "%.2f", (stringInterpolationSegment: doublenumber))
    }
    
    
    @IBOutlet var popqty: UITextField!
    
    
    
    
    
    // Return the title of each row in your picker ... In my case that will be the profile name or the username string
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return units[row][0]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        buttontitle = units[row][1]
        //unitsbuttonoutlet.setTitle(buttontitle, forState: UIControlState.Normal)
        
        inunitsfield.text = units[row][1]
        
    }

    
    @IBAction func dismisssmallpopup(sender: AnyObject) {
        
        
        getinfofrompop(buttontitle, quantity: popqty.text!)
        
        poppresented = false
        
         newquantitybutton.setImage(blackquantity, forState: .Normal)
        
       // UIView.animateWithDuration(0.4) { () -> Void in
            
            // self.smallpopover.frame = CGRectMake(self.newquickview.frame.origin.x, 154, self.newquickview.frame.width, 0)
            
             self.quicksmallconstraint.constant = -456
            //let yPos : CGFloat = -300
           // self.smallpopover.frame.origin.y = 151
            UIView.animateWithDuration(0.4, animations: { () -> Void in
               // self.smallpopover.frame.origin.y = yPos
               // self.quicksmallconstraint.constant = -451
                self.view.layoutIfNeeded()
                
                }, completion: { (value: Bool) -> Void in
                    // self.quicksmallconstraint.constant = -5
                    self.smallpopover.hidden = true
            })
        
        
            
            //  self.inamountview.frame = CGRectMake(self.newquickview.frame.origin.x, 154, self.newquickview.frame.width, 0)
            
       // }
    }
    
    
    @IBOutlet var smalltopview: UIView!
    
    
    @IBOutlet var opencatalogoutlet: UIButton!
    
    
    @IBAction func opencatalog(sender: AnyObject) {
        
        performSegueWithIdentifier("NewAddItemWithOptions", sender: self)
    }
    
    
    @IBOutlet var shownoteview: UIView!
    
    
    @IBOutlet var listnameinview: CustomTextField!
    
    
    @IBOutlet var listnoteinview: UITextView!
    
    
    @IBOutlet var cancelviewoutlet: UIButton!
    
    
    @IBAction func cancelview(sender: AnyObject) {
        
        dimmer.removeFromSuperview()
        
        notetopconstraint.constant = -300
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            }, completion: { (value: Bool) -> Void in
                
        })
        
        self.view.endEditing(true)
        
        self.shownoteview.hidden = true

        
    }
    
    @IBOutlet var doneinviewoutlet: UIButton!
    
   
    @IBAction func doneinview(sender: AnyObject) {
        
        let query = PFQuery(className:"shopLists")
        query.fromLocalDatastore()
        query.whereKey("listUUID", equalTo: currentList)
        query.getFirstObjectInBackgroundWithBlock() {
            (list: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
                
                self.dimmer.removeFromSuperview()
                
                self.notetopconstraint.constant = -300
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.view.layoutIfNeeded()
                    }, completion: { (value: Bool) -> Void in
                        
                })
                self.shownoteview.hidden = true
               
            } else if let list = list {
                
                self.self.listnameinview.text = self.listnameinview.text
                
                list["ShopListName"] = self.listnameinview.text
                list["ShopListNote"] = self.listnoteinview.text
                list.pinInBackground()
                // list.saveEventually()
                
                
                if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
                    UserLists[foundlist].listname = self.listnameinview.text
                    UserLists[foundlist].listnote = self.listnoteinview.text
                    
                }
                
                if let foundshoplist = UserShopLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
                    UserShopLists[foundshoplist].listname = self.listnameinview.text
                    UserShopLists[foundshoplist].listnote = self.listnoteinview.text
                    
                }
                
                if let foundfavlist = UserFavLists.map({ $0.listid }).lazy.indexOf(self.currentList) {
                    UserFavLists[foundfavlist].listname = self.listnameinview.text
                    UserFavLists[foundfavlist].listnote = self.listnoteinview.text
                    
                }
                
                self.dimmer.removeFromSuperview()
                
                self.notetopconstraint.constant = -300
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    
                    self.view.layoutIfNeeded()
                    }, completion: { (value: Bool) -> Void in
                  
                
                })
                
                self.view.endEditing(true)
                
                self.shownoteview.hidden = true

                
            }
        }
       
        
       
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        shiftview(true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        shiftview(false)
    }
    
    
    
    @IBOutlet var notetopconstraint: NSLayoutConstraint!
    
    func shiftview(up: Bool) {
        
        if up == true {
            
            notetopconstraint.constant = 30
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                }, completion: { (value: Bool) -> Void in
                    
            })
            // self.view.frame.origin.y -= 200
            
        } else if up == false {
            
           notetopconstraint.constant = 130
            
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                }, completion: { (value: Bool) -> Void in
                    
            })
        }
    }

    
    func didSwipeCell(recognizer: UIGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Ended {
            let swipeLocation = recognizer.locationInView(self.tableView)
            if let swipedIndexPath = tableView.indexPathForRowAtPoint(swipeLocation) {
                if let swipedCell = self.tableView.cellForRowAtIndexPath(swipedIndexPath) {
    
                    ////// DO STUFF
                    

                    
                    if showcats == false {
                        

                        let cell = swipedCell as! ItemShopListCell
                        
                        let indexPathCheck = swipedIndexPath
                        
                        
                        // itemtocheck = shoppingListItemsIds[indexPathCheck!.row]
                        itemtocheck = itemsDataDict[indexPathCheck.row]["ItemId"] as! String
                        
                        
                        // shoppingListItemsIsChecked[indexPathCheck!.row] = true
                        
                        itemsDataDict[indexPathCheck.row]["ItemIsChecked"] = true
                        // AND HERE It is possible to directly change the value! WTF?!
                        
                        // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathCheck!.row]
                        let thissectionsname : String = itemsDataDict[indexPathCheck.row]["ItemCategoryName"] as! String
                        // print(thissectionsname)
                        
                        
                        // var thisarray : Array<Dictionary<String,AnyObject>> = sections[thissectionsname]!
                        //this array is just to help me understand what's what
                        //  println("Array of this section is \(thisarray)")
                        
                        //for ( var i = 0; i < thisarray.count; i++ ) {
                        for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                            
                            
                            //if thisarray[i]["ItemId"] as? String == itemtocheck {
                            if sections[thissectionsname]![i]["ItemId"] as? String == itemtocheck {
                                
                                
                                //print(sections[thissectionsname]![i]["ItemId"])
                                // print(sections[thissectionsname]![i]["ItemIsChecked"])
                                
                                sections[thissectionsname]![i]["ItemIsChecked"] = true
                                
                                // print(sections[thissectionsname]![i]["ItemId"])
                                // print(sections[thissectionsname]![i]["ItemIsChecked"])
                                
                            }
                        }
                        
                        
                        
                        // if itemsDataDict[indexPathCheck!.row]["ItemIsChecked"] as! Bool == false {
                        
                        cell.checkedButtonOutlet.setImage(checkedImage, forState: .Normal)
                        

                        
                        cell.checkedview.hidden = false
                        
                        //new stuf
                        //cell.contentView.alpha = 0.6
                        
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents()

                        
                        
                        let attributes = [NSStrikethroughStyleAttributeName : 1]
                        // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                        let title = NSAttributedString(string: itemsDataDict[indexPathCheck.row]["ItemName"] as! String, attributes: attributes)
                        cell.itemName.attributedText = title
                        
                        let querynew = PFQuery(className:"shopItems")
                        querynew.fromLocalDatastore()
                        // querynew.getObjectInBackgroundWithId(itemtocheck) {
                        querynew.whereKey("itemUUID", equalTo: itemtocheck)
                        querynew.getFirstObjectInBackgroundWithBlock() {
                            (itemList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let itemList = itemList {
                                itemList["isChecked"] = true
                                itemList.pinInBackground()
                                // itemList.saveInBackground()
                                // itemList.saveEventually()
                                
                            }
                            
                            
                        }
                        
                        
                        checkeditemsqty += 1
                        //itemschecked.text = String(checkeditemsqty)
                        countitems()
                        
                        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
                        
                
                        
                    } else {
                        
                        let cell = swipedCell as! ItemShopListCell
                        
                            let section = swipedIndexPath.section
                            let rowsect = swipedIndexPath.row
                            
                            //var tableSection : [Dictionary<String, AnyObject>] = []
                            var tableSection = sections[sortedSections[section]]
                            var tableItem = tableSection![rowsect]
                            
    
                            
                            var checkedbitch = Bool()
                            
                            //itemtocheck = shoppingListItemsIds[indexPathCheck!.row]
                            
                            itemtocheck = (tableItem as NSDictionary).objectForKey("ItemId") as! String
    
                            
                            print(tableItem["ItemIsChecked"])
                            
                            //tableItem.updateValue(true, forKey: "ItemChecked")
                            tableItem.updateValue(true, forKey: "ItemIsChecked")
                            tableSection![rowsect] = tableItem
                            sections[sortedSections[section]] = tableSection
                            
                            for ( var i = 0; i < itemsDataDict.count; i++ ) {
                                if itemsDataDict[i]["ItemId"] as? String == itemtocheck {
                                    //var newdict = Dictionary<String, AnyObject>()//NSDictionary()
                                    var index = i
                                    //newdict = itemsDataDict[i]
                                    // newdict.updateValue(true, forKey: "ItemChecked")
                                    
                                    // shoppingListItemsIsChecked[index] = true
                                    
                                    print(itemsDataDict[i])
                                    
                                    itemsDataDict[i]["ItemIsChecked"] = true
                                    
                                    print(itemsDataDict[i])
                                    
                                }
                            }
                            
                            
                            cell.checkedButtonOutlet.setImage(checkedImage, forState: .Normal)
                            
 
                            
                            cell.checkedview.hidden = false
                            
                            self.activityIndicator.stopAnimating()
                            UIApplication.sharedApplication().endIgnoringInteractionEvents()
                            
                            
                            let attributes = [NSStrikethroughStyleAttributeName : 1]
                            let title = NSAttributedString(string: (tableItem as NSDictionary).objectForKey("ItemName") as! String, attributes: attributes)
                            cell.itemName.attributedText = title
                            
                            let querynew = PFQuery(className:"shopItems")
                            querynew.fromLocalDatastore()
                            // querynew.getObjectInBackgroundWithId(itemtocheck) {
                            querynew.whereKey("itemUUID", equalTo: (tableItem as NSDictionary).objectForKey("ItemId") as! String)
                            querynew.getFirstObjectInBackgroundWithBlock() {
                                (itemList: PFObject?, error: NSError?) -> Void in
                                if error != nil {
                                    print(error)
                                } else if let itemList = itemList {
                                    itemList["isChecked"] = true
                                    itemList.pinInBackground()
                                    // itemList.saveInBackground()
                                    //  itemList.saveEventually()
                                    
                                }
                                
                                
                            }

                            checkeditemsqty += 1
                            countitems()
                            
                            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
                
                        
                    }
                    
                    
                    //////
                    
                    
                    
                }
            }
        }
    }
    
    
    @IBOutlet var openmenu: UIBarButtonItem!
    
    // MARK: save list info execution
    override func viewWillDisappear(animated: Bool) {
        
         additemstolistsarrayandsave()
    }
    
    
    func pickedunit(sender: UIButton) {
        
        quickunit = sender.titleForState(.Normal)!
        print(quickunit)
        
        
        // fuck, much easier just to change state to selected and then filter by state :)
        for button in horizontalScrollView.subviews {
            
            if let tappedbutton = button as? UIButton {
                if tappedbutton.tag == sender.tag {
                    sender.backgroundColor = UIColorFromRGB(0x31797D)
                    sender.tintColor = UIColorFromRGB(0xFAFAFA)
                    sender.titleLabel!.textColor = UIColorFromRGB(0xFAFAFA)
                    sender.layer.borderWidth = 1
                    sender.layer.borderColor = UIColorFromRGB(0x31797D).CGColor
                } else {
                    tappedbutton.backgroundColor = UIColor.clearColor()
                    tappedbutton.tintColor = UIColorFromRGB(0x31797D)
                    tappedbutton.titleLabel!.textColor = UIColorFromRGB(0x31797D)
                    tappedbutton.layer.borderWidth = 1
                    tappedbutton.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
                }
            }
        }
        
        
    }
    
    func pickedperunit(sender: UIButton) {
        
        quickperunit = sender.titleForState(.Normal)!
        print(quickperunit)
        
        
        for button in horizontalScrollViewper.subviews {
            
            if let tappedbutton = button as? UIButton {
                if tappedbutton.tag == sender.tag {
                sender.backgroundColor = UIColorFromRGB(0x31797D)
                sender.tintColor = UIColorFromRGB(0xFAFAFA)
                sender.titleLabel!.textColor = UIColorFromRGB(0xFAFAFA)
                sender.layer.borderWidth = 1
                sender.layer.borderColor = UIColorFromRGB(0x31797D).CGColor
                } else {
                tappedbutton.backgroundColor = UIColor.clearColor()
                tappedbutton.tintColor = UIColorFromRGB(0x31797D)
                tappedbutton.titleLabel!.textColor = UIColorFromRGB(0x31797D)
                tappedbutton.layer.borderWidth = 1
                tappedbutton.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
                }
            }
        }

    }
    
    
   var horizontalScrollView = ASHorizontalScrollView()
    var horizontalScrollViewper = ASHorizontalScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //UINavigationBar.appearance().backgroundColor = UIColor.clearColor()
        
        // SCROLLS
        horizontalScrollView = ASHorizontalScrollView(frame:CGRectMake(0, 0, horscrollview.frame.width, 42))
        horizontalScrollViewper = ASHorizontalScrollView(frame:CGRectMake(0, 0, horscrollviewper.frame.width, 42))
        horizontalScrollView.uniformItemSize = CGSizeMake(52, 42)
        horizontalScrollViewper.uniformItemSize = CGSizeMake(52, 42)
        horizontalScrollView.leftMarginPx = 0
        horizontalScrollViewper.leftMarginPx = 0
        horizontalScrollView.miniMarginPxBetweenItems = 7
        horizontalScrollView.miniAppearPxOfLastItem = 10
        horizontalScrollViewper.miniMarginPxBetweenItems = 7
        horizontalScrollViewper.miniAppearPxOfLastItem = 10
        horizontalScrollView.setItemsMarginOnce()
        horizontalScrollViewper.setItemsMarginOnce()
        
        
        
        for i in (0..<units.count) {

            var button = UIButton(frame: CGRectZero)
            button.backgroundColor = UIColor.clearColor()
            button.setTitle(units[i][1], forState: .Normal)
            button.titleLabel!.font = UIFont(name: "AvenirNext-Regular", size: 16)
            button.tintColor = UIColorFromRGB(0x31797D)
            button.setTitleColor(UIColorFromRGB(0x31797D), forState: UIControlState.Normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
            button.layer.cornerRadius = 8
            
            button.addTarget(self, action: "pickedunit:", forControlEvents: UIControlEvents.TouchDown)
            button.tag = 0 + i
            
            var buttonper = UIButton(frame:CGRectMake(0, 0, 52, 42))
            buttonper.backgroundColor = UIColor.clearColor()
            buttonper.titleLabel!.font = UIFont(name: "AvenirNext-UltraLight", size: 16)
            buttonper.tintColor = UIColorFromRGB(0x31797D)
            buttonper.setTitleColor(UIColorFromRGB(0x31797D), forState: UIControlState.Normal)
            buttonper.titleLabel!.textColor = UIColorFromRGB(0x31797D)
            buttonper.layer.borderWidth = 1
            buttonper.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
            buttonper.layer.cornerRadius = 8
            buttonper.setTitle(units[i][1], forState: .Normal)
            buttonper.addTarget(self, action: "pickedperunit:", forControlEvents: UIControlEvents.TouchDown)
            buttonper.tag = 10 + i
            
            horizontalScrollView.addItem(button)
            horizontalScrollViewper.addItem(buttonper)
        }
        
       self.horscrollview.addSubview(horizontalScrollView)
        self.horscrollviewper.addSubview(horizontalScrollViewper)
        
        // not sure
        itemsDataDict.removeAll(keepCapacity: true)
        
        openmenu.target = self.revealViewController()
        //openmenu.action = Selector("openmenuaction:")
       
        openmenu.action = Selector("revealToggle:")
        

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        
         var popoverup = UISwipeGestureRecognizer(target: self, action: Selector("handleUPSwipe:"))
         popoverup.direction = .Up
            smallpopover.addGestureRecognizer(popoverup)
        
        var swipecell = UISwipeGestureRecognizer(target: self, action: "didSwipeCell:")
        swipecell.direction = .Right
        self.tableView.addGestureRecognizer(swipecell)
        
        
        let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
        
        
        autocomplete.text = NSLocalizedString("additemtext", comment: "")
       // autocomplete.textAlignment = .Center
        
        cancelviewoutlet.layer.borderWidth = 1
        cancelviewoutlet.layer.borderColor = UIColorFromRGB(0xF23D55).CGColor
        cancelviewoutlet.layer.cornerRadius = 4
        
        doneinviewoutlet.layer.cornerRadius = 4
        
        listnameinview.layer.borderWidth = 1
        listnameinview.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
        listnameinview.layer.cornerRadius = 4
        
        listnoteinview.layer.borderWidth = 1
        listnoteinview.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
        listnoteinview.layer.cornerRadius = 4
        
        listnameinview.leftTextMargin = 10
        
        shownoteview.layer.cornerRadius = 4
        
        shownoteview.hidden = true
        
        quickaddoutlet.hidden = true
        opencatalogoutlet.hidden = false
        newquantitybutton.hidden = true
        
        listnameinview.delegate = self
        listnoteinview.delegate = self
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableAfterPush", name: "reloadTableShop", object: nil)
        
        let toolFrame = CGRectMake(0, 0, self.view.frame.size.width, 46);
        let toolView: UIView = UIView(frame: toolFrame);
        
        let closepadframe: CGRect = CGRectMake(self.view.frame.size.width - 66, 1, 56, 42); //size & position of the button as placed on the toolView
        
        //Create the cancel button & set its title
        let closepad: UIButton = UIButton(frame: closepadframe);
        // closepad.setTitle("Close", forState: UIControlState.Normal);
        //closepad.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal);
        closepad.setImage(closepadimage, forState: UIControlState.Normal)
        toolView.addSubview(closepad); //add it to the toolView
        
        //Add the target - target, function to call, the event witch will trigger the function call
        closepad.addTarget(self, action: "closenumberpad:", forControlEvents: UIControlEvents.TouchDown);
        
        popqty.inputAccessoryView = toolView
        
        
        
        popqty.text = ""
        
        popqty.delegate = self
        
      
        
        //addedindicator.hidden = true
        addedindicator.alpha = 0
        addedindicator.layer.cornerRadius = 8
        addedindicator.backgroundColor = UIColorFromRGBalpha(0x2a2f36, alp: 1) //2a2f36
        
        autocomplete.delegate = self

        

        
       // self.view.backgroundColor = UIColorFromRGB(0xF1F1F1)//(0x2a2f36)F1F1F1
        
        
        //tableView.backgroundColor = UIColorFromRGB(0xF1F1F1) //f1
        
        smallpopover.backgroundColor = UIColorFromRGB(0xFFFFFF)//UIColorFromRGB(0xF7F7F7)

        
        inamountview.layer.cornerRadius = 8
        
        inamountview.layer.borderWidth = 1
        inamountview.layer.borderColor = UIColorFromRGB(0xE0E0E0).CGColor
        
        
        
       autocomplete.leftTextMargin = 5
        
  
        
        myeditingmode = false
        
        //for autocomplete part
        self.generateDataAuto()
        autocomplete.mDelegate = self
        
       // let allcurrencies = NSLocale.ISOCurrencyCodes()
        
        /* DO IT IN APP LOAD
        for currency in allcurrencies { //Currency = "USD" etc
            let localeComponents = [NSLocaleCurrencyCode: currency]
            let localeIdentifier = NSLocale.localeIdentifierFromComponents(localeComponents)
            let locale = NSLocale(localeIdentifier: localeIdentifier)
            let currencySymbol = locale.objectForKey(NSLocaleCurrencySymbol) as! String
            
            currencies.append([currency as! String,currencySymbol])
            
        }
        */
        
        /*
        for uniquecategory in shoppingListItemsCategories {
        // differentcategories = set
        //if contains(
        if contains(differentcategories, element: uniquecategory) {
        println("Category already loaded")
        } else {
        differentcategories.append(uniquecategory)
        }
        }
        */
        
        
        
        //showcats = true
       // showcats = false
        
        
        
        if justCreatedList == true {
            
          //  noitemview.hidden = false
            
            showcats = false
            
            colorcode = dgreen
            
            let todaydate = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let namedate = dateFormatter.stringFromDate(todaydate)
            

            
            self.listnameinview.text = "\(NSLocalizedString("listshop", comment: ""))"
            
            self.navigationItem.title = "\(NSLocalizedString("listshop", comment: ""))"
            
            
            self.listnoteinview.text = ""
            
            let local = NSLocale.currentLocale()
            symbol = local.objectForKey(NSLocaleCurrencySymbol) as! String
           // code = local.objectForKey(NSLocaleCurrencyCode) as! String
            if let currencyCode = NSLocale.currentLocale().objectForKey(NSLocaleCurrencyCode) as? String {
                code = currencyCode
                 //Will display "USD", for example
            }
            
           // choosecurrency.setTitle(String(stringInterpolationSegment: symbol), forState: .Normal)
            
            
            newPFObject()
            
            
               // noitemview.hidden = false
           
            
            
            
        } else {
            
            //  if senderVC == senderVC as? MainMenuViewController {
            
            // currentList = globalshoplistid
            // currentList = activeList!
            // tableView.reloadData()
            
            //  } else {
            
            currentList = activeList!
            dataretrievallist()
            //dataretrievalinorder()
            //summationPrices()
            
          //  print("DICT IS \(itemsDataDict)")
            
           
            
            
           // if let foundlist = find(lazy(UserLists).map({ $0.listid }), activeList!) {
            
              if let foundlist = UserLists.map({ $0.listid }).lazy.indexOf(activeList!) {
                if (UserLists[foundlist].listcategories != nil) {
                    showcats = UserLists[foundlist].listcategories!
                    
                } else {
                    showcats = false
                }
                // part about code here
                if (UserLists[foundlist].listcolorcode != nil) {
                    colorcode = UserLists[foundlist].listcolorcode!
                    
                } else {
                    colorcode = dgreen
                }
            }
            
            
            
            tableView.reloadData()
            
            
            
            //fillthedict()
            // }
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        var shoppingListItemBelongsTo = activeList
        
        // Do any additional setup after loading the view.
        /*
        var rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self, action: "addTapped:")
        
        //var rightListsButtonItem: UIBarButtonItem = UIBarButtonItem(image: ListsIcon, style: UIBarButtonItemStyle.Plain, target: self, action: "ListsTapped:")
        var rightListsButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Lists", style: UIBarButtonItemStyle.Plain, target: self, action: "ListsTapped:")
        
        var rightSettingsButtonItem: UIBarButtonItem = UIBarButtonItem(title: "Settings", style: UIBarButtonItemStyle.Plain, target: self, action: "SettingsTapped:")
        
        var rightAddMultipleButtonItem: UIBarButtonItem = UIBarButtonItem(title: "Add+", style: UIBarButtonItemStyle.Plain, target: self, action: "addMultipleTapped:")
        
        var leftGoBackButtonItem: UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goback:")
        
        self.navigationItem.setLeftBarButtonItem(leftGoBackButtonItem, animated: true)
        
        self.navigationItem.setRightBarButtonItems([rightAddMultipleButtonItem, rightAddBarButtonItem, rightListsButtonItem, rightSettingsButtonItem], animated: true)
        */
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("sortArray"), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl) //require this because tableviww is within the VC
        
        
        //for rearranging
        
        
        let longpress = UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognized:")
        
        tableView.addGestureRecognizer(longpress)
        
        
        // self.refreshControl = refreshControl
        
        //var query = PFUser.query()
        //query?.findObjectsInBackgroundWithBlock({)
        
        /*
        if (mystring != nil) {
        dataretrieval()
        } else {
        println(self.shoppingListItemsIds)
        }
        
        */
        /*
        if (mystring != nil) {
        dataretrievallist()
        } else {
        dataretrieval()
        }
        */
        //dataretrieval()
        
        
        summationPrices()
        
        countitems()
        countchecked()
        //itemsoverall.text = "\(String(itemsoverallqty))/\(String(checkeditemsqty))"
        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
    }
    
    
    //lets do it only if uncategorized so far
    
    
    
    ///// REARRANGING CELLS START /////
    func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        
        if showcats == false {
        
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        
        let state = longPress.state
        
        let locationInView = longPress.locationInView(tableView)
        
        let indexPath = tableView.indexPathForRowAtPoint(locationInView)
        
        
        struct My {
            static var cellSnapshot : UIView? = nil
        }
        struct Path {
            static var initialIndexPath : NSIndexPath? = nil
        }
        
        
        switch state {
        case UIGestureRecognizerState.Began:
            if indexPath != nil {
                Path.initialIndexPath = indexPath
                let cell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
                My.cellSnapshot = snapshopOfCell(cell)
                var center = cell.center
                
                My.cellSnapshot!.center = center
                
                My.cellSnapshot!.alpha = 0.0
                
                tableView.addSubview(My.cellSnapshot!)
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    center.y = locationInView.y
                    
                    My.cellSnapshot!.center = center
                    
                    My.cellSnapshot!.transform = CGAffineTransformMakeScale(1.05, 1.05)
                    
                    My.cellSnapshot!.alpha = 0.98
                    
                    cell.alpha = 0.0
                    
                    }, completion: { (finished) -> Void in
                        
                        if finished {
                            
                            cell.hidden = true
                            
                        }
                        
                })
                
            }
            
        case UIGestureRecognizerState.Changed:
            var center = My.cellSnapshot!.center
            center.y = locationInView.y
            My.cellSnapshot!.center = center
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                swap(&itemsDataDict[indexPath!.row], &itemsDataDict[Path.initialIndexPath!.row])
                
                swap(&shoppingcheckedtocopy[indexPath!.row], &shoppingcheckedtocopy[Path.initialIndexPath!.row])
                
                tableView.moveRowAtIndexPath(Path.initialIndexPath!, toIndexPath: indexPath!)
                Path.initialIndexPath = indexPath
            }
            
        default:
            let cell = tableView.cellForRowAtIndexPath(Path.initialIndexPath!) as UITableViewCell!
            cell.hidden = false
            cell.alpha = 0.0
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                My.cellSnapshot!.center = cell.center
                My.cellSnapshot!.transform = CGAffineTransformIdentity
                My.cellSnapshot!.alpha = 0.0
                cell.alpha = 1.0
                }, completion: { (finished) -> Void in
                    if finished {
                        Path.initialIndexPath = nil
                        My.cellSnapshot!.removeFromSuperview()
                        My.cellSnapshot = nil
                    }
            })
            
            
            
        }
        
        } else {
            print("Showcats mode on")
        }
    
    }
    
    func snapshopOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }
    ///// REARRANGING CELLS END /////
    //end of if showcats == true statement
    
    
    
    func sortArray() {
        /*
        let sortedarray = shoppingListItemsIds.reverse()
        
       // for (index, element) in enumerate(sortedarray) {
         for (index, element) in sortedarray.enumerate() {
            shoppingListItemsIds[index] = element
        }
        */
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    func ListsTapped(sender:UIButton) {
        print("All lists pressed")
        
        listsBarButtonTapped()
    }
    
    func SettingsTapped(sender:UIButton) {
        print("Settings pressed")
        dismissViewControllerAnimated(true, completion: nil)
    }
    // 5
    func addTapped (sender:UIButton) {
        print("add pressed")
        // Do any additional setup after loading the view.
        
        addBarButtonTapped()
        
    }
    
    func addMultipleTapped (sender:UIButton) {
        print("multiple add pressed")
        // Do any additional setup after loading the view.
        
        addMultipleFunc()
        
    }
    /*
    func goback(sender: UIButton) {
    
    if senderVC == senderVC as? AllListsVC {
    
    performSegueWithIdentifier("gobacksegue", sender: self)
    } else if senderVC == senderVC as? MainMenuViewController {
    //gobacktomainmenusegue
    //performSegueWithIdentifier("gobacktomainmenusegue", sender: self)
    
    //  delegateforlist?.getshoplist(true, listid:currentList)
    
    dismissViewControllerAnimated(true, completion: nil)
    //navigationController!.popViewControllerAnimated(true)
    }
    //perfr
    }
    */
    /*
    func tabBarTableauClicked(){
    performSegueWithIdentifier("tableau", sender: self)
    }
    */
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        if showcats == true {
            
            let set = NSSet(array: shoppingListItemsCategoriesNames)
           // print(set.count)
            /*
            for uniquecategory in shoppingListItemsCategoriesNames {
            // differentcategories = set
            //if contains(
            if contains(differentcategories, element: uniquecategory) {
            println("Category already loaded")
            } else {
            differentcategories.append(uniquecategory)
            }
            }*/
            // return set.count
            //return differentcategories.count
            return sections.count
            
        } else {
            
            return 1
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //if itemsDataDict.count != 0 {
        
        if showcats == true {
            //   return sections[section].length
            return sections[sortedSections[section]]!.count
        } else {
            
            // return shoppingListItemsIds.count
            return itemsDataDict.count
            // }
        }
        //} else {
        ////    return 0
       // }
    }
    
    func edititem(sender: UIButton!) {
        
        
        if showcats == false {
            
            let button = sender as UIButton
            let view = button.superview!
            let innerview = view.superview!
            //let cell = view.superview as! ItemShopListCell
            let cell = innerview.superview as! ItemShopListCell
            let indexPathItem = tableView.indexPathForCell(cell)
            
            //itemtoedit = shoppingListItemsIds[indexPathItem!.row]
            itemtoedit = itemsDataDict[indexPathItem!.row]["ItemId"] as! String
            
            //performSegueWithIdentifier("EditItem", sender: self)
            performSegueWithIdentifier("edititemmodalsegue", sender: self)
        } else {
            let button = sender as UIButton
            let view = button.superview!
            let innerview = view.superview!
            //let cell = view.superview as! ItemShopListCell
            let cell = innerview.superview as! ItemShopListCell
            
            let position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
            if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
            {
                let section = indexPathIteminSection.section
                let rowsect = indexPathIteminSection.row
                
                
                let tableSection = sections[sortedSections[section]]
                let tableItem = tableSection![rowsect]
                
               // print("SECTION IS \(tableSection)")
               // print("TABLE ITEM IS \(tableItem)")
                
                //cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String
                
                itemtoedit = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
                // performSegueWithIdentifier("EditItem", sender: self)
                performSegueWithIdentifier("edititemmodalsegue", sender: self)
            }
            
            
            //let indexPathItem = tableView.indexPathForRowAtPoint()
            
            
            //    itemtoedit = shoppingListItemsIds[indexPathItem!.row]
            
            //  performSegueWithIdentifier("EditItem", sender: self)
            // cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: rowsect, inSection: section))?
            
        }
        
    }
    
    
    func restoreitem(sender: UIButton!) {
        
        
         self.activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        if showcats == false {
        
        let button = sender as UIButton
        let view = button.superview!
        let nextview = view.superview!
        //let cell = view.superview as! ItemShopListCell
        let cell = nextview.superview as! ItemShopListCell
        let indexPathCheck = tableView.indexPathForCell(cell)

        
        
        itemtocheck = itemsDataDict[indexPathCheck!.row]["ItemId"] as! String
        
        let checkbutton = cell.viewWithTag(70) as! UIButton //checkbuttontag
            
            itemsDataDict[indexPathCheck!.row]["ItemIsChecked"] = false
            
            //NOW the same must be done to sorted items dict, so again for loop but for sorted array
            // In order this to work when go from nocategories to showcategories, so that changes will be saved
            // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathCheck!.row]
            let thissectionsname : String = itemsDataDict[indexPathCheck!.row]["ItemCategoryName"] as! String
            
            // var thisarray : Array<Dictionary<String,AnyObject>> = sections[thissectionsname]!
            
            // for ( var i = 0; i < thisarray.count; i++ ) {
            for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                
                
                // if thisarray[i]["ItemId"] as? String == itemtocheck {
                if sections[thissectionsname]![i]["ItemId"] as? String == itemtocheck {
                    
                    
                  //  print(sections[thissectionsname]![i]["ItemIsChecked"])
                    
                    sections[thissectionsname]![i]["ItemIsChecked"] = false
                    
                   // print(sections[thissectionsname]![i]["ItemIsChecked"])
                    
                }
            }
        
        
        checkbutton.setImage(notcheckedImage, forState: .Normal) // PERFECT, WORKS!
        
        
        
       // button.hidden = true
        movechecked(true, cell: cell)
            
            view.hidden = true
            
            let attributes = [NSStrikethroughStyleAttributeName : 0]
            // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
            let title = NSAttributedString(string: itemsDataDict[indexPathCheck!.row]["ItemName"] as! String, attributes: attributes)
            
            cell.itemName.attributedText = title
            
            
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
        let querynew = PFQuery(className:"shopItems")
        querynew.fromLocalDatastore()
        // querynew.getObjectInBackgroundWithId(itemtocheck) {
        querynew.whereKey("itemUUID", equalTo: itemtocheck)
        querynew.getFirstObjectInBackgroundWithBlock() {
            (itemList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let itemList = itemList {
                itemList["isChecked"] = false
                itemList.pinInBackground()
                // itemList.saveInBackground()
              //  itemList.saveEventually()
                
            }
            
            
        }
        
        // shoppingListItemsIsChecked[indexPathCheck!.row] = false
        
      
        
        checkeditemsqty -= 1
            countitems()
        
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
           // itemsoverall.text = "\(String(itemsoverallqty))/\(String(checkeditemsqty))"
       // itemschecked.text = String(checkeditemsqty)
        
        //button.removeFromSuperview()
        //view.removeFromSuperview()
        
    } else {
            //showcats = true
            let button = sender as UIButton
            let view = button.superview!
            let nextview = view.superview!
            let cell = nextview.superview as! ItemShopListCell
           // let cell = view.superview as! ItemShopListCell
            
            let position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
            if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
            {
                let section = indexPathIteminSection.section
                let rowsect = indexPathIteminSection.row
                
                //var tableSection : [Dictionary<String, AnyObject>] = []
                var tableSection = sections[sortedSections[section]]
                var tableItem = tableSection![rowsect]
                
              //  print("SORTED SECTIONS \(sortedSections)")
                
              //  print("SECTION IS \(tableSection)")
              //  print("TABLEITEM IS \(tableItem)")
                
                //with let it is completely immutable, with var - its fine!
                //let tableCheck = sortedchecks[rowsect]
                //let tableCheckItem = tableCheck
                //cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String
                
                var checkedbitch = Bool()
                
                //itemtocheck = shoppingListItemsIds[indexPathCheck!.row]
                
                itemtocheck = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
               // button.setImage(notcheckedImage, forState: .Normal)
                
                let checkbutton = cell.viewWithTag(70) as! UIButton //checkbuttontag
                
                
                print(tableItem["ItemIsChecked"])
                
                tableItem.updateValue(false, forKey: "ItemIsChecked")
                //tableItem["ItemChecked"] = false
                
                
                
                tableSection![rowsect] = tableItem
                
                sections[sortedSections[section]] = tableSection
                
                //   sections[sortedSections[section]] //.updateValue
                // tableSection.
                
                //var tableSection = sections[sortedSections[section]]
                //var tableItem = tableSection![rowsect]
                
                //for item in shoppingLis
                
                for ( var i = 0; i < itemsDataDict.count; i++ ) {
                    if itemsDataDict[i]["ItemId"] as? String == itemtocheck {
                        //var newdict = Dictionary<String, AnyObject>()//NSDictionary()
                        var index = i
                        //newdict = itemsDataDict[i]
                        // newdict.updateValue(true, forKey: "ItemChecked")
                        
                        //shoppingListItemsIsChecked[index] = false
                        
                       // print(itemsDataDict[i])
                        
                        itemsDataDict[i]["ItemIsChecked"] = false
                        
                      //  print(itemsDataDict[i])
                    }
                }

                
                checkbutton.setImage(notcheckedImage, forState: .Normal) // PERFECT, WORKS!
                
                
                
               // button.hidden = true
                view.hidden = true
                
                
                
                let attributes = [NSStrikethroughStyleAttributeName : 0]
                let title = NSAttributedString(string: (tableItem as NSDictionary).objectForKey("ItemName") as! String, attributes: attributes)
                cell.itemName.attributedText = title
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                
                let querynew = PFQuery(className:"shopItems")
                querynew.fromLocalDatastore()
                // querynew.getObjectInBackgroundWithId(itemtocheck) {
                querynew.whereKey("itemUUID", equalTo: (tableItem as NSDictionary).objectForKey("ItemId") as! String)
                querynew.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let itemList = itemList {
                        itemList["isChecked"] = false
                        itemList.pinInBackground()
                        // itemList.saveInBackground()
                        // itemList.saveEventually()
                        
                    }
                    
                    
                }
                
                // shoppingListItemsIsChecked[indexPathCheck!.row] = false
                // var newdictionary = tableItem
                //newdictionary.updateValue(false, forKey: "ItemChecked")
                //(tableItem as NSMutableDictionary).updateValue(true, forKey: "ItemChecked")
                
              
                
                
                //print(tableItem["ItemIsChecked"])
                
                //print("SECTION IS \(tableSection)")
               // print("TABLEITEM IS \(tableItem)")
                
                
                checkeditemsqty -= 1
                //itemschecked.text = String(checkeditemsqty)
                countitems()
                
                itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
            }
            
        }
        
    }
    
    
    
    
    func checkitem(sender: UIButton!) {
        
        self.activityIndicator.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        if showcats == false {
            
            
            let button = sender as UIButton
            let view = button.superview!
            let innerview = view.superview!
            //let cell = view.superview as! ItemShopListCell
            let cell = innerview.superview as! ItemShopListCell
            let indexPathCheck = tableView.indexPathForCell(cell)
            
            
            // itemtocheck = shoppingListItemsIds[indexPathCheck!.row]
            itemtocheck = itemsDataDict[indexPathCheck!.row]["ItemId"] as! String
            

            // shoppingListItemsIsChecked[indexPathCheck!.row] = true
            
            itemsDataDict[indexPathCheck!.row]["ItemIsChecked"] = true
            // AND HERE It is possible to directly change the value! WTF?!
            
            // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathCheck!.row]
            let thissectionsname : String = itemsDataDict[indexPathCheck!.row]["ItemCategoryName"] as! String
           // print(thissectionsname)
            
            
            // var thisarray : Array<Dictionary<String,AnyObject>> = sections[thissectionsname]!
            //this array is just to help me understand what's what
            //  println("Array of this section is \(thisarray)")
            
            //for ( var i = 0; i < thisarray.count; i++ ) {
            for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                
                
                //if thisarray[i]["ItemId"] as? String == itemtocheck {
                if sections[thissectionsname]![i]["ItemId"] as? String == itemtocheck {
                    
                    
                    //print(sections[thissectionsname]![i]["ItemId"])
                   // print(sections[thissectionsname]![i]["ItemIsChecked"])
                    
                    sections[thissectionsname]![i]["ItemIsChecked"] = true
                    
                   // print(sections[thissectionsname]![i]["ItemId"])
                   // print(sections[thissectionsname]![i]["ItemIsChecked"])
                    
                }
            }

            
            
           // if itemsDataDict[indexPathCheck!.row]["ItemIsChecked"] as! Bool == false {
            
                button.setImage(checkedImage, forState: .Normal)
                
               // cell.bringSubviewToFront(cell.checkedview)
            
               // cell.checkedview.bringSubviewToFront(cell.restorebutton)
                
                cell.checkedview.hidden = false
            
                movechecked(false, cell: cell)
            
            //new stuf
            //cell.contentView.alpha = 0.6
            
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                ///add new view, blur it and add restore button
                /*
                var checkview = UIView(frame: cell.bounds)
                checkview.frame = cell.bounds
                checkview.backgroundColor = UIColor.grayColor()
                checkview.alpha = 0.8
                cell.addSubview(checkview)
                
                var resbutton   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                var positionx = checkview.frame.size.width * 0.7 - 30
                var positiony = (checkview.frame.size.height * 0.5) - 20
                resbutton.frame = CGRectMake(positionx,positiony, 100, 40)
                //CGRect(x: 0, y: yPos, width: buttonWidth-0.5, height: self.buttonHeight)
                
                resbutton.backgroundColor = UIColor.whiteColor()
                resbutton.layer.borderColor = UIColor.blueColor().CGColor
                resbutton.layer.cornerRadius = 10
                resbutton.setTitle("Restore", forState: UIControlState.Normal)
                resbutton.addTarget(self, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)
                // button.addTarget //(cell, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)
                checkview.addSubview(resbutton)
                */
                
                /////
                
                
                let attributes = [NSStrikethroughStyleAttributeName : 1]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                let title = NSAttributedString(string: itemsDataDict[indexPathCheck!.row]["ItemName"] as! String, attributes: attributes)
                cell.itemName.attributedText = title
                
                let querynew = PFQuery(className:"shopItems")
                querynew.fromLocalDatastore()
                // querynew.getObjectInBackgroundWithId(itemtocheck) {
                querynew.whereKey("itemUUID", equalTo: itemtocheck)
                querynew.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let itemList = itemList {
                        itemList["isChecked"] = true
                        itemList.pinInBackground()
                        // itemList.saveInBackground()
                        // itemList.saveEventually()
                        
                    }
                    
                    
                }
                
            
                checkeditemsqty += 1
                //itemschecked.text = String(checkeditemsqty)
            countitems()
            
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
                
          //  } else {
                
                /* THIS BLOCK GOES TO RESTORE FUNC NOW
                button.setImage(notcheckedImage, forState: .Normal)
                
                
                let attributes = [NSStrikethroughStyleAttributeName : 0]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                var title = NSAttributedString(string: itemsDataDict[indexPathCheck!.row]["ItemName"] as! String, attributes: attributes)
                
                cell.itemName.attributedText = title
                
                
                var querynew = PFQuery(className:"shopItems")
                querynew.fromLocalDatastore()
                // querynew.getObjectInBackgroundWithId(itemtocheck) {
                querynew.whereKey("itemUUID", equalTo: itemtocheck)
                querynew.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        println(error)
                    } else if let itemList = itemList {
                        itemList["isChecked"] = false
                        itemList.pinInBackground()
                        // itemList.saveInBackground()
                        itemList.saveEventually()
                        
                    }
                    
                    
                }
                
                // shoppingListItemsIsChecked[indexPathCheck!.row] = false
                
                itemsDataDict[indexPathCheck!.row]["ItemIsChecked"] = false
                
                //NOW the same must be done to sorted items dict, so again for loop but for sorted array
                // In order this to work when go from nocategories to showcategories, so that changes will be saved
                // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathCheck!.row]
                var thissectionsname : String = itemsDataDict[indexPathCheck!.row]["ItemCategoryName"] as! String
                
                // var thisarray : Array<Dictionary<String,AnyObject>> = sections[thissectionsname]!
                
                // for ( var i = 0; i < thisarray.count; i++ ) {
                for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                    
                    
                    // if thisarray[i]["ItemId"] as? String == itemtocheck {
                    if sections[thissectionsname]![i]["ItemId"] as? String == itemtocheck {
                        
                        
                        println(sections[thissectionsname]![i]["ItemIsChecked"])
                        
                        sections[thissectionsname]![i]["ItemIsChecked"] = false
                        
                        println(sections[thissectionsname]![i]["ItemIsChecked"])
                        
                    }
                }
                
                checkeditemsqty -= 1
                itemschecked.text = String(checkeditemsqty)
                
                */
           // }
            
        } else {
            
            
            let button = sender as UIButton
            let view = button.superview!
            let innerview = view.superview!
            let cell = innerview.superview as! ItemShopListCell
            //let cell = view.superview as! ItemShopListCell
            
            let position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
            if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
            {
                let section = indexPathIteminSection.section
                let rowsect = indexPathIteminSection.row
                
                //var tableSection : [Dictionary<String, AnyObject>] = []
                var tableSection = sections[sortedSections[section]]
                var tableItem = tableSection![rowsect]
                
              //  print("SORTED SECTIONS \(sortedSections)")
                
               // print("SECTION IS \(tableSection)")
              //  print("TABLEITEM IS \(tableItem)")
                
                //with let it is completely immutable, with var - its fine!
                //let tableCheck = sortedchecks[rowsect]
                //let tableCheckItem = tableCheck
                //cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String
                
                var checkedbitch = Bool()
                
                //itemtocheck = shoppingListItemsIds[indexPathCheck!.row]
                
                itemtocheck = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
                // if checked[indexPathCheck!.row] == false {
               // if (tableItem as NSDictionary).objectForKey("ItemIsChecked") as! Bool == false {
                    // if sortedchecks[rowsect] == false {
                    //button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Selected)
                    
                    // checkedbitch = false
                
                print(tableItem["ItemIsChecked"])
                
                //tableItem.updateValue(true, forKey: "ItemChecked")
                tableItem.updateValue(true, forKey: "ItemIsChecked")
                tableSection![rowsect] = tableItem
                sections[sortedSections[section]] = tableSection
                
                for ( var i = 0; i < itemsDataDict.count; i++ ) {
                    if itemsDataDict[i]["ItemId"] as? String == itemtocheck {
                        //var newdict = Dictionary<String, AnyObject>()//NSDictionary()
                        var index = i
                        //newdict = itemsDataDict[i]
                        // newdict.updateValue(true, forKey: "ItemChecked")
                        
                        // shoppingListItemsIsChecked[index] = true
                        
                        print(itemsDataDict[i])
                        
                        itemsDataDict[i]["ItemIsChecked"] = true
                        
                        print(itemsDataDict[i])
                        
                    }
                }

                
                    button.setImage(checkedImage, forState: .Normal)
                
                   // cell.bringSubviewToFront(cell.checkedview)
                
                    //cell.checkedview.bringSubviewToFront(cell.restorebutton)
                
                    cell.checkedview.hidden = false
                
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                
                    let attributes = [NSStrikethroughStyleAttributeName : 1]
                    let title = NSAttributedString(string: (tableItem as NSDictionary).objectForKey("ItemName") as! String, attributes: attributes)
                    cell.itemName.attributedText = title
                    
                    let querynew = PFQuery(className:"shopItems")
                    querynew.fromLocalDatastore()
                    // querynew.getObjectInBackgroundWithId(itemtocheck) {
                    querynew.whereKey("itemUUID", equalTo: (tableItem as NSDictionary).objectForKey("ItemId") as! String)
                    querynew.getFirstObjectInBackgroundWithBlock() {
                        (itemList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let itemList = itemList {
                            itemList["isChecked"] = true
                            itemList.pinInBackground()
                            // itemList.saveInBackground()
                          //  itemList.saveEventually()
                            
                        }
                        
                        
                    }
                    
                    
                
 
                    print(tableItem["ItemIsChecked"])
                    
                  //  print("SECTION IS \(tableSection)")
                  //  print("TABLEITEM IS \(tableItem)")
                    
                    checkeditemsqty += 1
                countitems()
                
                itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
                   // itemschecked.text = String(checkeditemsqty)

                    
                    
               // } else {
                    
                    /* THIS BLOCK GOES TO RESTORE FUNC NOW
                    button.setImage(notcheckedImage, forState: .Normal)
                    
                    
                    let attributes = [NSStrikethroughStyleAttributeName : 0]
                    var title = NSAttributedString(string: (tableItem as NSDictionary).objectForKey("ItemName") as! String, attributes: attributes)
                    cell.itemName.attributedText = title
                    
                    
                    var querynew = PFQuery(className:"shopItems")
                    querynew.fromLocalDatastore()
                    // querynew.getObjectInBackgroundWithId(itemtocheck) {
                    querynew.whereKey("itemUUID", equalTo: (tableItem as NSDictionary).objectForKey("ItemId") as! String)
                    querynew.getFirstObjectInBackgroundWithBlock() {
                        (itemList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            println(error)
                        } else if let itemList = itemList {
                            itemList["isChecked"] = false
                            itemList.pinInBackground()
                            // itemList.saveInBackground()
                            itemList.saveEventually()
                            
                        }
                        
                        
                    }
                    
                    // shoppingListItemsIsChecked[indexPathCheck!.row] = false
                    // var newdictionary = tableItem
                    //newdictionary.updateValue(false, forKey: "ItemChecked")
                    //(tableItem as NSMutableDictionary).updateValue(true, forKey: "ItemChecked")
                    
                    println(tableItem["ItemIsChecked"])
                    
                    tableItem.updateValue(false, forKey: "ItemIsChecked")
                    //tableItem["ItemChecked"] = false
                    
                    
                    
                    tableSection![rowsect] = tableItem
                    
                    sections[sortedSections[section]] = tableSection
                    
                    //   sections[sortedSections[section]] //.updateValue
                    // tableSection.
                    
                    //var tableSection = sections[sortedSections[section]]
                    //var tableItem = tableSection![rowsect]
                    
                    //for item in shoppingLis
                    
                    for ( var i = 0; i < itemsDataDict.count; i++ ) {
                        if itemsDataDict[i]["ItemId"] as? String == itemtocheck {
                            //var newdict = Dictionary<String, AnyObject>()//NSDictionary()
                            var index = i
                            //newdict = itemsDataDict[i]
                            // newdict.updateValue(true, forKey: "ItemChecked")
                            
                            //shoppingListItemsIsChecked[index] = false
                            
                            println(itemsDataDict[i])
                            
                            itemsDataDict[i]["ItemIsChecked"] = false
                            
                            println(itemsDataDict[i])
                        }
                    }
                    
                    /*
                    for ( var i = 0; i < itemsDataDict.count; i++ ) {
                    if itemsDataDict[i]["ItemId"] as? String == itemtocheck {
                    var newdict = Dictionary<String, AnyObject>()//NSDictionary()
                    var index = i
                    newdict = itemsDataDict[i]
                    itemsDataDict.removeAtIndex(index)
                    newdict.updateValue(false, forKey: "ItemChecked")
                    itemsDataDict.insert(newdict, atIndex: index)
                    }
                    }
                    */
                    
                    
                    println(tableItem["ItemIsChecked"])
                    
                    println("SECTION IS \(tableSection)")
                    println("TABLEITEM IS \(tableItem)")
                    
                    
                    checkeditemsqty -= 1
                    itemschecked.text = String(checkeditemsqty)
                    */
              //  }
            }
        }
        
        
    }
    /*
    var object : PFObject?
    
    func getParseObject(catid : String) -> PFObject {
    //var object : PFObject?
    var query5 = PFQuery(className: "shopListsCategory")
    query5.fromLocalDatastore()
    query5.whereKey("categoryUUID", equalTo: catid)
    query5.getFirstObjectInBackgroundWithBlock() {
    (category: PFObject?, error: NSError?) -> Void in
    if error != nil {
    println(error)
    println("Bitch doesn't work!")
    } else if let category = category {
    self.object = category
    self.shoppingListItemsCategoriesNames.append(category["catname"] as! String)
    println("The name is\(self.shoppingListItemsCategoriesNames)")
    
    }
    
    }
    
    return object!
    }
    */
    
    
    func getcategoriesnames(categoryIds: [String]) -> [String] {
        
        for categoryid in categoryIds {
            
            if (categoryid as NSString).containsString("custom") {
                //CASE IF CATEGORY IS CUSTOM
               // print(categoryIds)
                
                //PIZDEC, BUT MUST WORK
                
                let querycat = PFQuery(className:"shopListsCategory")
                querycat.fromLocalDatastore()
                querycat.whereKey("categoryUUID", equalTo: categoryid)
                let categories = querycat.findObjects()
                if (categories != nil) {
                    for category in categories! {
                        if let thiscatname = category["catname"] as? String {
                            print("NAME IS \(thiscatname)")
                            self.shoppingListItemsCategoriesNames.append(thiscatname)
                        }
                    }
                } else {
                    print("No custom cats yet")
                }
                //self.shoppingListItemsCategoriesNames.append(category1["catname"] as! String)
                
                /*{
                
                if error != nil {
                println(error)
                } else if let category = category {
                
                self.shoppingListItemsCategoriesNames.append(category["catname"] as! String)
                println("The name is\(self.shoppingListItemsCategoriesNames)")
                }
                
                }
                */
                
                //querycat.getFirstObject                }())/*
                /*
                querycat.getFirstObjectInBackgroundWithBlock() {
                (category: PFObject?, error: NSError?) -> Void in
                if error != nil {
                println(error)
                } else if let category = category {
                
                self.shoppingListItemsCategoriesNames.append(category["catname"] as! String)
                println("The name is\(self.shoppingListItemsCategoriesNames)")
                }
                
                }
                */
                
            } else {
                // CASE IF IT IS DEFAULT CATEGORY
                
                
                
                // Find this object of product type which has property catId = itemcategoryUUID
                
                //if let foundcategory = find(lazy(catalogcategories).map({ $0.catId }), categoryid) {
                
                if let foundcategory = catalogcategories.map({ $0.catId }).lazy.indexOf(categoryid) {
                let catalogname = catalogcategories[foundcategory].catname
                    
                  
                    
                    self.shoppingListItemsCategoriesNames.append(catalogname)
                    
                    
                }
                
                
            }
            
            
            
            /*
            var querycat = PFQuery(className:"shopListsCategory")
            querycat.fromLocalDatastore()
            querycat.whereKey("categoryUUID", equalTo: category)//
            querycat.getFirstObjectInBackgroundWithBlock() {
            (category: PFObject?, error: NSError?) -> Void in
            if error != nil {
            println(error)
            } else if let category = category {
            // self.itemcategory = category as? Category
            //self.loadCatImageFromLocalStore(category["imagePath"] as! String)
            var categoryname = String()
            categoryname = category["catname"] as! String
            // var retrievedcat = Category(catId: category["categoryUUID"] as! String, catname: category["catname"] as! String, catimage: catimageloaded, isCustom: category["isCustom"] as! Bool)
            self.shoppingListItemsCategoriesNames.append(categoryname)
            }
            
            }*/
        } // end of for loop
        
        return shoppingListItemsCategoriesNames
    }
    
    
   

    
    func swipedeleteitem(deleterow: NSIndexPath) {
        
        
        
        
        itemtodelete = itemsDataDict[deleterow.row]["ItemId"] as? String
        
        dictionary.removeValueForKey("ItemId")
        dictionary.removeValueForKey("ItemName")
        dictionary.removeValueForKey("ItemNote")
        // dictionary.removeValueForKey("ItemImage")
        dictionary.removeValueForKey("ItemImage2")
        dictionary.removeValueForKey("ItemImagePath")
        dictionary.removeValueForKey("ItemQuantity")
        dictionary.removeValueForKey("ItemTotalPrice")
        dictionary.removeValueForKey("ItemUnit")
        dictionary.removeValueForKey("ItemIsChecked")
        dictionary.removeValueForKey("ItemCategory")
        dictionary.removeValueForKey("itemCategoryName")
        dictionary.removeValueForKey("ItemOneUnitPrice")
        dictionary.removeValueForKey("ItemIsFav")
        dictionary.removeValueForKey("ItemPerUnit")
        dictionary.removeValueForKey("ItemCreation")
        dictionary.removeValueForKey("ItemUpdate")
        
        ///DELETE FROM SECTIONS
        
        
        // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathDelete!.row]
        let thissectionsname : String = itemsDataDict[deleterow.row]["ItemCategoryName"] as! String
        for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
            
            if sections[thissectionsname]![i]["ItemId"] as? String == itemtodelete {
                
                sections[thissectionsname]!.removeAtIndex(i)
                // tableView.reloadData() //this was really necessary
                
            }
        }
        
        
        itemsDataDict.removeAtIndex(deleterow.row)
        
        
        // tableView.reloadData()
        
        
        
        /*
        dispatch_async(dispatch_get_main_queue(), {
            let querynew = PFQuery(className:"shopItems")
            //querynew.fromLocalDatastore()
            //querynew.getObjectInBackgroundWithId(self.itemtodelete!) {
            querynew.whereKey("itemUUID", equalTo: self.itemtodelete!)
            querynew.getFirstObjectInBackgroundWithBlock() {
                (itemList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let itemList = itemList {
                    
                    
                    //self.tableView.deleteRowsAtIndexPaths([self.listtodelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
                    
                    
                    
                   // itemList.deleteInBackground()
                    
                }
                //self.dataretrievallist() no need to do that, otherwise delete and immediately restored since data hasnt been passed to the server by this time
                
            }
        })
        */
        
        let querynew1 = PFQuery(className:"shopItems")
        querynew1.fromLocalDatastore()
        //  querynew1.getObjectInBackgroundWithId(itemtodelete!) {
        querynew1.whereKey("itemUUID", equalTo: itemtodelete!)
        querynew1.getFirstObjectInBackgroundWithBlock() {
            (itemList: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let itemList = itemList {
                
                itemList.unpinInBackground()
                
                
            }
            //self.dataretrievallist() no need to do that, otherwise delete and immediately restored since data hasnt been passed to the server by this time
            
        }
        
        
        // remove the deleted item from the `UITableView`
        self.tableView.deleteRowsAtIndexPaths([deleterow], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        tableView.reloadData()
        
        //self.tableView.deleteRowsAtIndexPaths([indexPathDelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
        //tableView.reloadData()
        summationPrices()
        
     
       
        countitems()
        countchecked()
        itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        
        //IF SHOWCATS == TRUE
        
        
        
        
    }
    
    func tableView(tableView: UITableView,
        willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.separatorInset = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    
    //func deleteitem(sender: UIButton!) {
    func deleteitem(deleterow: NSIndexPath) {
        
        //WORKS!!!
        //First, I am getting the cell in which the tapped button is contained
        if showcats == false {
            
          //  let button = sender as UIButton
          ////  let view = button.superview!
          ////  let cell = view.superview as! ItemShopListCell
           // let indexPathDelete = tableView.indexPathForCell(cell)
            
            //immediate deletion from the table - works perfectly!
         //   println(indexPathDelete!.row)
            
            // itemtodelete = shoppingListItemsIds[indexPathDelete!.row]
          //  itemtodelete = itemsDataDict[indexPathDelete!.row]["ItemId"] as? String
            
             itemtodelete = itemsDataDict[deleterow.row]["ItemId"] as? String
            
            dictionary.removeValueForKey("ItemId")
            dictionary.removeValueForKey("ItemName")
            dictionary.removeValueForKey("ItemNote")
            // dictionary.removeValueForKey("ItemImage")
            dictionary.removeValueForKey("ItemImage2")
            dictionary.removeValueForKey("ItemImagePath")
            dictionary.removeValueForKey("ItemQuantity")
            dictionary.removeValueForKey("ItemTotalPrice")
            dictionary.removeValueForKey("ItemUnit")
            dictionary.removeValueForKey("ItemIsChecked")
            dictionary.removeValueForKey("ItemCategory")
            dictionary.removeValueForKey("itemCategoryName")
            dictionary.removeValueForKey("ItemOneUnitPrice")
            dictionary.removeValueForKey("ItemIsFav")
            dictionary.removeValueForKey("ItemPerUnit")
            dictionary.removeValueForKey("ItemCreation")
            dictionary.removeValueForKey("ItemUpdate")
            
            ///DELETE FROM SECTIONS
            
            
            // var thissectionsname : String = shoppingListItemsCategoriesNames[indexPathDelete!.row]
            let thissectionsname : String = itemsDataDict[deleterow.row]["ItemCategoryName"] as! String
            for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                
                if sections[thissectionsname]![i]["ItemId"] as? String == itemtodelete {
                    
                    sections[thissectionsname]!.removeAtIndex(i)
                    // tableView.reloadData() //this was really necessary
                    
                }
            }
            
            
            itemsDataDict.removeAtIndex(deleterow.row)
            
            
            // tableView.reloadData()
            
            
            
            /*
           // dispatch_async(dispatch_get_main_queue(), {
                let querynew = PFQuery(className:"shopItems")
                //querynew.fromLocalDatastore()
                //querynew.getObjectInBackgroundWithId(self.itemtodelete!) {
                querynew.whereKey("itemUUID", equalTo: self.itemtodelete!)
                querynew.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let itemList = itemList {
                        
                        
                        //self.tableView.deleteRowsAtIndexPaths([self.listtodelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
                        
                        itemList.deleteInBackground()
                        
                    }
                    //self.dataretrievallist() no need to do that, otherwise delete and immediately restored since data hasnt been passed to the server by this time
                    
                }
           // })
            */
            
            let querynew1 = PFQuery(className:"shopItems")
            querynew1.fromLocalDatastore()
            //  querynew1.getObjectInBackgroundWithId(itemtodelete!) {
            querynew1.whereKey("itemUUID", equalTo: itemtodelete!)
            querynew1.getFirstObjectInBackgroundWithBlock() {
                (itemList: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let itemList = itemList {
                    
                    itemList.unpinInBackground()
                    
                    
                }
                //self.dataretrievallist() no need to do that, otherwise delete and immediately restored since data hasnt been passed to the server by this time
                
            }
            
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([deleterow], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            tableView.reloadData()
            
            //self.tableView.deleteRowsAtIndexPaths([indexPathDelete!], withRowAnimation: UITableViewRowAnimation.Automatic)
            //tableView.reloadData()
            summationPrices()
            
            countitems()
            countchecked()
            itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(itemsoverallqty))/\(String(checkeditemsqty))"
        } else {
            // case when showcats == true
            /*
            let button = sender as UIButton
            let view = button.superview!
            let cell = view.superview as! ItemShopListCell
            
            var position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
            if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
            {
                var section = indexPathIteminSection.section
                var rowsect = indexPathIteminSection.row
                
                
                var tableSection = sections[sortedSections[section]]
                var tableItem = tableSection![rowsect]
                
                // itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
                /////////// CODE OF DELETETION
                //println(indexPathDelete!.row)
                itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as? String
                // Remains the same
                dictionary.removeValueForKey("ItemId")
                dictionary.removeValueForKey("ItemName")
                dictionary.removeValueForKey("ItemNote")
                // dictionary.removeValueForKey("ItemImage")
                dictionary.removeValueForKey("ItemImage2")
                dictionary.removeValueForKey("ItemImagePath")
                dictionary.removeValueForKey("ItemQuantity")
                dictionary.removeValueForKey("ItemTotalPrice")
                dictionary.removeValueForKey("ItemUnit")
                dictionary.removeValueForKey("ItemIsChecked")
                dictionary.removeValueForKey("ItemCategory")
                dictionary.removeValueForKey("itemCategoryName")
                dictionary.removeValueForKey("ItemOneUnitPrice")
                dictionary.removeValueForKey("ItemIsFav")
                dictionary.removeValueForKey("ItemPerUnit")
                dictionary.removeValueForKey("ItemCreation")
                dictionary.removeValueForKey("ItemUpdate")
                
                
                var thissectionsname : String = sortedSections[section]
                
                for ( var i = 0; i < sections[thissectionsname]!.count; i++ ) {
                    
                    
                    // if thisarray[i]["ItemId"] as? String == itemtocheck {
                    if sections[thissectionsname]![i]["ItemId"] as? String == itemtodelete {
                        
                        sections[thissectionsname]!.removeAtIndex(i)
                        
                        break;
                        
                    }
                }
                
                var idtodelete : String = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                var indextodelete = Int()
                
                
                for ( var i = 0; i < itemsDataDict.count; i++ ) {
                    
                    //if let newid : String = itemsDataDict[i]["ItemId"] as? String {
                    if itemsDataDict[i]["ItemId"] as? String == itemtodelete {
                        //idtodelete = newid
                        indextodelete = i
                        
                        itemsDataDict.removeAtIndex(i)
                        
                    }
                }
                println(indextodelete)
                
                dispatch_async(dispatch_get_main_queue(), {
                    var querynew = PFQuery(className:"shopItems")
                    querynew.whereKey("itemUUID", equalTo: idtodelete)
                    querynew.getFirstObjectInBackgroundWithBlock() {
                        (itemList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            println(error)
                        } else if let itemList = itemList {
                            
                            itemList.deleteInBackground()
                            
                        }
                    }
                })
                
                var querynew1 = PFQuery(className:"shopItems")
                querynew1.fromLocalDatastore()
                //  querynew1.getObjectInBackgroundWithId(itemtodelete!) {
                querynew1.whereKey("itemUUID", equalTo: idtodelete)
                querynew1.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        println(error)
                    } else if let itemList = itemList {
                        itemList.unpinInBackground()
                        
                    }
                    
                }
                
                
                self.tableView.deleteRowsAtIndexPaths([indexPathIteminSection], withRowAnimation: UITableViewRowAnimation.Automatic)
                
                // NOW IT WORKS!
                if sections[thissectionsname]! == [] {
                    //if sections[thissectionsname]!.count == 0 {
                    sections.removeValueForKey(thissectionsname)
                    sortedSections.removeAtIndex(section)//[section]
                    
                    
                    
                    //sections[sortedSections[section]]?.removeAll(keepCapacity: true)
                    tableView.reloadData()
                }
                
                
                tableView.reloadData()
                
                summationPrices()
                
                countitems()
                itemsoverall.text = String(itemsoverallqty)
                countchecked()
                itemschecked.text = String(checkeditemsqty)
                
                
                /////////// END CODE
            }
            
            */
        }//END OF IF
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if showcats == true {
            return 30.0
        } else {
            return 0
        }

    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        return 51
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if showcats == true {
            // return shoppingListItemsCategoriesNames[section]
            // return sortedSections[section]
            //return sections[section].title
            return nil//sortedSections[section]
        } else {
            return nil
        }
    }
    
    var thiscatpicture = UIImage()
    
    
    var headerimages = [UIImage]()
    
    func getcategorypicture(section: Int) -> UIImage {
    
        var key: String = sortedSections[section]
        
        //((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemImage2")) as? UIImage
        
       var cat = (sections as NSDictionary).objectForKey(key) as! [Dictionary<String,AnyObject>]
        var catid : String = (cat[0] as NSDictionary).objectForKey("ItemCategory") as! String
        
       
        
        if (catid as NSString).containsString("custom") {
  
            
            var querycat = PFQuery(className:"shopListsCategory")
            querycat.fromLocalDatastore()
            querycat.whereKey("categoryUUID", equalTo: catid)
            var categories = querycat.findObjects()
            if (categories != nil) {
                for category in categories! {
                   
                       
                        if category["defaultpicture"] as! Bool == false {
                 /*
                            if var imageFile = category["catimage"] as? PFFile {
                           // if imageFile != nil {
                                var imageData = imageFile.getData()
                                
                              //  print(imageData)
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
                            
                            
                            self.loadImageFromLocalStore(category["imagePath"] as! String)
                            thiscatpicture = self.imageToLoad
                            
                        } else {
                            
                            var imagename = category["OriginalInDefaults"] as! String
                            
                            if (UIImage(named: "\(imagename)") != nil) {
                                thiscatpicture = UIImage(named: "\(imagename)")!
                            } else {
                                thiscatpicture = defaultcatimages[0].itemimage
                            }
                            
                        }
                    
                }
            } else {
                print("No custom cats yet")
            }
    
            
        } else {
            // CASE IF IT IS DEFAULT CATEGORY
            
            
            
            // Find this object of product type which has property catId = itemcategoryUUID
            
          //  if let foundcategory = find(lazy(catalogcategories).map({ $0.catId }), catid) {
            
            if var foundcategory = catalogcategories.map({ $0.catId }).lazy.indexOf(catid) {

            var catalogpicture = catalogcategories[foundcategory].catimage
                
                thiscatpicture = catalogpicture
                
                
                
            }
            
            
        }
        
        
        return thiscatpicture
       // var catid2: ca
        
    }
  
    
    
    
    /*
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        
        
        var header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColorFromRGB(0xf1f1f1)//UIColorFromRGB(0x2a2f36)//(0xE0FFB2)//UIColor(red: 238/255, green: 168/255, blue: 15/255, alpha: 0.8)
        header.textLabel!.textColor = UIColorFromRGB(0x31797D)//UIColor.whiteColor()
        header.textLabel!.font = UIFont(name: "Avenir-Book", size: 18)!
       // header.textLabel!.text?.uppercaseString
        header.alpha = 1
        
        var topline = UIView(frame: CGRectMake(0, 0, header.contentView.frame.size.width, 1))
        topline.backgroundColor = UIColorFromRGB(0xfafafa)//31797D)
        
      //  header.contentView.addSubview(topline)
        
        var bottomline = UIView(frame: CGRectMake(0, 30, header.contentView.frame.size.width, 1))
        bottomline.backgroundColor = UIColorFromRGB(0xfafafa)//31797D)
        
        //header.contentView.addSubview(bottomline)
        
        var positionx = header.contentView.frame.size.width - 36
        var positiony = header.contentView.frame.size.height / 10
        var imageViewGame = UIImageView(frame: CGRectMake(positionx, positiony, 24, 24));
       // var image = UIImage(named: "Apple");
        
       // getcategorypicture(section)
        
       // imageViewGame.removeFromSuperview()
        
        
        
        imageViewGame.image = headerimages[section]//thiscatpicture//image;
        
        
        
        header.contentView.addSubview(imageViewGame)
        
    }
    */
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("TableSectionHeader")
        let header = cell as! TableSectionHeader
        
        header.title.text = sortedSections[section]
        
        header.pict.image = headerimages[section]
        
        return cell

        
    }
   
    
    /*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       let header = tableView.dequeueReusableCellWithIdentifier("categoryheader")
        return header
    }
    */
    /*
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        
        //  if showcats == true {
        // return sections.map { $0.title }
        // } else {
        return nil
        //  }
        
    }
    */
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        if showcats == true {
            return index
        } else {
            return 0
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let ItemCellIdentifier = "NewListItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemCellIdentifier, forIndexPath: indexPath) as! ItemShopListCell
        
        
        
        if itemsDataDict.count == 0 {

            //noitemview.hidden = false
        } else {
           // noitemview.hidden = true
        }
        /*
        if indexPath.row % 2 == 0 {
            
            cell.backgroundColor = UIColorFromRGB(0xFAFAFA)
        } else {
            cell.backgroundColor = UIColorFromRGB(0xF4F3F3)
        }
*/
        
            if myeditingmode == false {
                
                cell.userInteractionEnabled = true
                cell.selectionStyle = UITableViewCellSelectionStyle.Default
        
        if showcats == false {
            
            
            cell.itemImage.image = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemImage2")) as? UIImage
            // }
            //acctss dict
            //....text = dict.objectForKey("key") as String or whatever it is
            
            cell.itemName.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemName")) as? String
            
            cell.itemNote.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemNote")) as? String
            
            if ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemNote")) as? String == "" {
                cell.nametopconstraint.constant = 14
            } else {
                cell.nametopconstraint.constant = 9
            }
            
           
            let qty : String = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemQuantity")) as! String
            
            let unit : String = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemUnit")) as! String
            
            cell.itemQuantity.text = "\(qty) \(unit)"
            
            /*
            cell.itemQuantity.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemQuantity")) as? String
            
            cell.itemUnit.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemUnit")) as? String
            */
            let doubleprice = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemTotalPrice")) as! String
            if doubleprice != "" && doubleprice != "0" {
            cell.itemPrice.text = "\(doubleprice) \(symbol)"//((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemTotalPrice")) as? Double//as? String
            } else {
                cell.itemPrice.text = ""
            }
            
            if cell.itemPrice.text == "" {
                cell.amounttopconstraint.constant = 18
            } else {
                cell.amounttopconstraint.constant = 10
            }
            
            
          
            cell.copybuttonoutlet.hidden = true
            cell.copybuttonoutlet.setImage(notcheckedImageToCopy, forState: .Normal)
           // cell.editItemOutlet.hidden = false
            cell.checkedButtonOutlet.hidden = false
            cell.itemPrice.hidden = false
            cell.itemQuantity.hidden = false
            
            if (((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemIsChecked")) as? Bool) == true {
                
               
                
                cell.checkedButtonOutlet.setImage(checkedImage, forState: .Normal)
                
                
                let attributes = [NSStrikethroughStyleAttributeName : 1]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                let title = NSAttributedString(string: ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemName")) as! String, attributes: attributes)
                cell.itemName.attributedText = title
                
                //cell.checkedview.frame = cell.bounds
                
              // cell.heightconstraint.constant = cell.frame.size.height
              //  cell.widthconstraint.constant = cell.frame.size.width
                
               // cell.bringSubviewToFront(cell.checkedview)
                
               // cell.checkedview.bringSubviewToFront(cell.restorebutton)
                
                cell.checkedview.hidden = false

                cell.restorebutton.addTarget(self, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None


                
            } else {
                cell.checkedButtonOutlet.setImage(notcheckedImage, forState: .Normal)
                
                let attributes = [NSStrikethroughStyleAttributeName : 0]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                let title = NSAttributedString(string: ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemName")) as! String, attributes: attributes)
                cell.itemName.attributedText = title

                
                
                //cell.checkedview.frame = cell.bounds
                
                cell.checkedview.hidden = true
                
                   cell.restorebutton.addTarget(self, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)
                
                
            }
            
            /*
            cell.itemName.text = shoppingListItemsNames[indexPath.row]
            cell.itemNote.text = shoppingListItemsNotes[indexPath.row]
            cell.itemQuantity.text = shoppingListItemsQuantity[indexPath.row]
            cell.itemPrice.text = "\(shoppingListItemsPrices[indexPath.row])" //must convert double to STRING
            */
            //cell.itemName.text = self.testarray[indexPath.row]
            
            //self.tableView.reloadData()
            
            // Configure the cell...
            
            //code for deletion of an item
            //cell.deleteItemOutlet.tag = indexPath.row
           // cell.deleteItemOutlet.addTarget(self, action: "deleteitem:", forControlEvents: .TouchUpInside)
            
            //cell.deleteItemOutlet.tag = indexPath.row
           // cell.editItemOutlet.addTarget(self, action: "edititem:", forControlEvents: .TouchUpInside)
            
           // cell.deleteItemOutlet.tag = indexPath.row
            cell.checkedButtonOutlet.addTarget(self, action: "checkitem:", forControlEvents: .TouchUpInside)
            
            
        }//end of showcats if
        else {
            //if showcats == true
            
            //cell.textLabel?.text = array[sections[indexPath.section].index + indexPath.row]
            
            //     cell.itemName.text = ((itemsDataDict[sections[indexPath.section].index + indexPath.row] as NSDictionary).objectForKey("ItemName")) as? String
            
            //   cell.itemNote.text = ((itemsDataDict[sections[indexPath.section].index + indexPath.row] as NSDictionary).objectForKey("ItemNote")) as? String
            
            
            let tableSection = sections[sortedSections[indexPath.section]]
            let tableItem = tableSection![indexPath.row]
            
            cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String//["ItemName"]
            cell.itemNote.text = (tableItem as NSDictionary).objectForKey("ItemNote") as? String
            if (tableItem as NSDictionary).objectForKey("ItemNote") as? String == ""
            {
                cell.nametopconstraint.constant = 14
            } else {
                cell.nametopconstraint.constant = 9
            }
            
            
            
            cell.itemImage.image = (tableItem as NSDictionary).objectForKey("ItemImage2") as? UIImage
            
            let qty : String = (tableItem as NSDictionary).objectForKey("ItemQuantity") as! String

            
            let unit : String = (tableItem as NSDictionary).objectForKey("ItemUnit") as! String
            
            cell.itemQuantity.text = "\(qty) \(unit)"
            
            /*
            cell.itemQuantity.text = (tableItem as NSDictionary).objectForKey("ItemQuantity") as? String
            
            cell.itemUnit.text = (tableItem as NSDictionary).objectForKey("ItemUnit") as? String
            */
            let doubleprice = (tableItem as NSDictionary).objectForKey("ItemTotalPrice") as! String
            
            if doubleprice != ""  && doubleprice != "0" {
                cell.itemPrice.text = "\(doubleprice) \(symbol)"//((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemTotalPrice")) as? Double//as? String
            } else {
                cell.itemPrice.text = ""
            }

            if cell.itemPrice.text == "" {
                cell.amounttopconstraint.constant = 18
            } else {
                cell.amounttopconstraint.constant = 10
                
            }
            
           
            
           // cell.itemPrice.text = "\(doubleprice) \(symbol)"
            
            
            cell.copybuttonoutlet.hidden = true
            cell.copybuttonoutlet.setImage(notcheckedImageToCopy, forState: .Normal)
            //cell.editItemOutlet.hidden = false
            cell.checkedButtonOutlet.hidden = false
            
            
            cell.itemPrice.hidden = false
            cell.itemQuantity.hidden = false
            
            if ((tableItem as NSDictionary).objectForKey("ItemIsChecked") as? Bool) == true {
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                cell.checkedButtonOutlet.setImage(checkedImage, forState: .Normal)
                
                let attributes = [NSStrikethroughStyleAttributeName : 1]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                let title = NSAttributedString(string: ((tableItem as NSDictionary).objectForKey("ItemName") as! String), attributes: attributes)
                cell.itemName.attributedText = title
                
                
                //cell.checkedview.frame = cell.bounds
                
                // cell.heightconstraint.constant = cell.frame.size.height
                //  cell.widthconstraint.constant = cell.frame.size.width
                
               // cell.bringSubviewToFront(cell.checkedview)
                
               // cell.checkedview.bringSubviewToFront(cell.restorebutton)
                
                cell.checkedview.hidden = false
                
                cell.restorebutton.addTarget(self, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)

                
                
            } else {
                cell.checkedButtonOutlet.setImage(notcheckedImage, forState: .Normal)
                
                let attributes = [NSStrikethroughStyleAttributeName : 0]
                // var title = NSAttributedString(string: shoppingListItemsNames[indexPathCheck!.row], attributes: attributes)
                let title = NSAttributedString(string: ((tableItem as NSDictionary).objectForKey("ItemName") as! String), attributes: attributes)
                cell.itemName.attributedText = title
                
                
                  cell.checkedview.hidden = true
                
                 cell.restorebutton.addTarget(self, action: "restoreitem:", forControlEvents: UIControlEvents.TouchUpInside)
                
            }
            
            //  cell.deleteItemOutlet.tag = sectionIndex
           // cell.deleteItemOutlet.addTarget(self, action: "deleteitem:", forControlEvents: .TouchUpInside)
            
            //cell.deleteItemOutlet.tag = tableSection![indexPath.row]
            //cell.editItemOutlet.addTarget(self, action: "edititem:", forControlEvents: .TouchUpInside)
            
            //cell.deleteItemOutlet.tag = tableSection![indexPath.row]
            cell.checkedButtonOutlet.addTarget(self, action: "checkitem:", forControlEvents: .TouchUpInside)
            
            
        }
        ///// END IF ITEMS != 0 CASE
        //  } else {
        // items = 0 case
        
        
        // }
        
        return cell
        
    } else {
    //when editing mode
                
                
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
                if showcats == false {
                    
                   
                    
                    cell.itemImage.image = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemImage2")) as? UIImage
                    // }
                    //acctss dict
                    //....text = dict.objectForKey("key") as String or whatever it is
                    
                    cell.itemName.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemName")) as? String
                    
                    cell.itemNote.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemNote")) as? String
                    
                    let qty : String = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemQuantity")) as! String
                    
                    let unit : String = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemUnit")) as! String
                    
                    cell.itemQuantity.text = "\(qty) \(unit)"
                    
                    /*
                    cell.itemQuantity.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemQuantity")) as? String
                    
                    cell.itemUnit.text = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemUnit")) as? String
                    */
                   // let doubleprice = ((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemTotalPrice")) as! Double
                    
                   // cell.itemPrice.text = "\(doubleprice)"//((itemsDataDict[indexPath.row] as NSDictionary).objectForKey("ItemTotalPrice")) as? Double//as? String
                    
                    //cell.editItemOutlet.hidden = true
                    cell.checkedButtonOutlet.hidden = true
                    cell.itemPrice.hidden = true
                    cell.itemQuantity.hidden = true
                    cell.checkedview.hidden = true
                    //fucking
                    
                    
                   
                    cell.copybuttonoutlet.hidden = false
                    
                    if shoppingcheckedtocopy[indexPath.row] == false {
                     cell.copybuttonoutlet.setImage(notcheckedImageToCopy, forState: .Normal)
                    } else {
                        cell.copybuttonoutlet.setImage(checkedImageToCopy, forState: .Normal)
                    }
                   // cell.copybuttonoutlet.setImage(notcheckedImageToCopy, forState: .Normal) // not sure if needed
                    cell.copybuttonoutlet.addTarget(self, action: "checktocopy:", forControlEvents: .TouchUpInside)
                    
                }//end of showcats if
                else {
                    //if showcats == true
                    
                    //cell.textLabel?.text = array[sections[indexPath.section].index + indexPath.row]
                    
                    //     cell.itemName.text = ((itemsDataDict[sections[indexPath.section].index + indexPath.row] as NSDictionary).objectForKey("ItemName")) as? String
                    
                    //   cell.itemNote.text = ((itemsDataDict[sections[indexPath.section].index + indexPath.row] as NSDictionary).objectForKey("ItemNote")) as? String
                    
                    
                    let tableSection = sections[sortedSections[indexPath.section]]
                    let tableItem = tableSection![indexPath.row]
                    
                    cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String//["ItemName"]
                    cell.itemNote.text = (tableItem as NSDictionary).objectForKey("ItemNote") as? String
                    
                    cell.itemImage.image = (tableItem as NSDictionary).objectForKey("ItemImage2") as? UIImage
                    
                    let qty : String = (tableItem as NSDictionary).objectForKey("ItemQuantity") as! String
                    
                    let unit : String = (tableItem as NSDictionary).objectForKey("ItemUnit") as! String
                    
                    cell.itemQuantity.text = "\(qty) \(unit)"
                    
                    /*
                    cell.itemQuantity.text = (tableItem as NSDictionary).objectForKey("ItemQuantity") as? String
                    
                    cell.itemUnit.text = (tableItem as NSDictionary).objectForKey("ItemUnit") as? String
                    */
                   // let doubleprice = (tableItem as NSDictionary).objectForKey("ItemTotalPrice") as! Double
                    
                    //cell.itemPrice.text = "\(doubleprice)"
                    
                    //cell.editItemOutlet.hidden = true
                    cell.checkedButtonOutlet.hidden = true
                    cell.itemPrice.hidden = true
                    cell.itemQuantity.hidden = true
                    cell.checkedview.hidden = true
                    
                   
                    cell.copybuttonoutlet.hidden = false
                    cell.copybuttonoutlet.setImage(notcheckedImageToCopy, forState: .Normal)
                    cell.copybuttonoutlet.addTarget(self, action: "checktocopy:", forControlEvents: .TouchUpInside)
                    
                }
                ///// END IF ITEMS != 0 CASE
                //  } else {
                // items = 0 case
                
                
                // }
                
                return cell

                
                
        }
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if myeditingmode == false {
        
        if showcats == false {
            
            if itemsDataDict[indexPath.row]["ItemIsChecked"] as! Bool == false {

            itemtoedit = itemsDataDict[indexPath.row]["ItemId"] as! String
            
            performSegueWithIdentifier("edititemmodalsegue", sender: self)
            
            } else {
               
            }

            
        } else {

            
      
            
                let section = indexPath.section
                let rowsect = indexPath.row
                
                
                let tableSection = sections[sortedSections[section]]
                let tableItem = tableSection![rowsect]
                
              //  print("SECTION IS \(tableSection)")
               // print("TABLE ITEM IS \(tableItem)")
                
                //cell.itemName.text = (tableItem as NSDictionary).objectForKey("ItemName") as? String
            
                if (tableItem as NSDictionary).objectForKey("ItemIsChecked") as! Bool == false {
            
                itemtoedit = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
                // performSegueWithIdentifier("EditItem", sender: self)
                performSegueWithIdentifier("edititemmodalsegue", sender: self)
            
                } else {
                    
            }
            

            
        }

        } else {
            print("editing mode enabled")
        }
        let row = indexPath.row
        //println(self.shoppingListItemsIds[row])
    }
    
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
            
            
            switch editingStyle {

                
            case .Delete:
                // remove the deleted item from the model
                if self.showcats == false {
                  //  self.swipedeleteitem(indexPath)
                    
                    self.deleteitem(indexPath)
                    //better to use usual
                    
                } else {
                    //showcats == true case
                    
                    // let button = sender as UIButton
                    // let view = button.superview!
                    // let cell = view.superview as! ItemShopListCell
                    
                    // var position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
                    // if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
                    //{
                    let section = indexPath.section//indexPathIteminSection.section
                    let rowsect = indexPath.row//indexPathIteminSection.row
                    
                    
                    var tableSection = self.sections[self.sortedSections[section]]
                    let tableItem = tableSection![rowsect]
                    
                    // itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                    
                    /////////// CODE OF DELETETION
                    //println(indexPathDelete!.row)
                    self.itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as? String
                    // Remains the same
                    self.dictionary.removeValueForKey("ItemId")
                    self.dictionary.removeValueForKey("ItemName")
                    self.dictionary.removeValueForKey("ItemNote")
                    // dictionary.removeValueForKey("ItemImage")
                    self.dictionary.removeValueForKey("ItemImage2")
                    self.dictionary.removeValueForKey("ItemImagePath")
                    self.dictionary.removeValueForKey("ItemQuantity")
                    self.dictionary.removeValueForKey("ItemTotalPrice")
                    self.dictionary.removeValueForKey("ItemUnit")
                    self.dictionary.removeValueForKey("ItemIsChecked")
                    self.dictionary.removeValueForKey("ItemCategory")
                    self.dictionary.removeValueForKey("itemCategoryName")
                    self.dictionary.removeValueForKey("ItemOneUnitPrice")
                    self.dictionary.removeValueForKey("ItemIsFav")
                    self.dictionary.removeValueForKey("ItemPerUnit")
                    
                    self.dictionary.removeValueForKey("ItemCreation")
                    self.dictionary.removeValueForKey("ItemUpdate")
                    
                    
                    let thissectionsname : String = self.sortedSections[section]
                    
                    for ( var i = 0; i < self.sections[thissectionsname]!.count; i++ ) {
                        
                        
                        // if thisarray[i]["ItemId"] as? String == itemtocheck {
                        if self.sections[thissectionsname]![i]["ItemId"] as? String == self.itemtodelete {
                            
                            self.sections[thissectionsname]!.removeAtIndex(i)
                            
                            break;
                            
                        }
                    }
                    
                    let idtodelete : String = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                    var indextodelete = Int()
                    
                    
                    for ( var i = 0; i < itemsDataDict.count; i++ ) {
                        
                        //if let newid : String = itemsDataDict[i]["ItemId"] as? String {
                        if itemsDataDict[i]["ItemId"] as? String == self.itemtodelete {
                            //idtodelete = newid
                            indextodelete = i
                            
                            itemsDataDict.removeAtIndex(i)
                            
                        }
                    }
                    
                    /*
                    dispatch_async(dispatch_get_main_queue(), {
                        let querynew = PFQuery(className:"shopItems")
                        querynew.whereKey("itemUUID", equalTo: idtodelete)
                        querynew.getFirstObjectInBackgroundWithBlock() {
                            (itemList: PFObject?, error: NSError?) -> Void in
                            if error != nil {
                                print(error)
                            } else if let itemList = itemList {
                                
                                itemList.deleteInBackground()
                                
                            }
                        }
                    })
                    */
                    
                    let querynew1 = PFQuery(className:"shopItems")
                    querynew1.fromLocalDatastore()
                    //  querynew1.getObjectInBackgroundWithId(itemtodelete!) {
                    querynew1.whereKey("itemUUID", equalTo: idtodelete)
                    querynew1.getFirstObjectInBackgroundWithBlock() {
                        (itemList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let itemList = itemList {
                            itemList.unpinInBackground()
                            
                        }
                        
                    }
                    
                    
                    self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                    
                    // NOW IT WORKS!
                    if self.sections[thissectionsname]! == [] {
                        //if sections[thissectionsname]!.count == 0 {
                        self.sections.removeValueForKey(thissectionsname)
                        self.sortedSections.removeAtIndex(section)//[section]
                        
                        
                        
                        //sections[sortedSections[section]]?.removeAll(keepCapacity: true)
                        tableView.reloadData()
                    }
                    
                    
                    tableView.reloadData()
                    
                    self.summationPrices()
                    
                    self.countitems()
                    self.countchecked()
                    self.itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(self.itemsoverallqty))/\(String(self.checkeditemsqty))"
                    
                    //self.itemschecked.text = String(self.checkeditemsqty)
                    
                    
                    /////////// END CODE
                    //}
                    
                    
                    
                }
                
                // self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            default:
                return
            }
            
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        
        // Maybe
       /* if tableView.editing == true {
        let ItemCellIdentifier = "NewListItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemCellIdentifier, forIndexPath: indexPath) as! ItemShopListCell
        
        cell.editItemOutlet.hidden = true
        cell.checkedButtonOutlet.hidden = true
        cell.copybuttonoutlet.hidden = false
        }
        */ //DOESN'T WORK LIKE THIS
        
        return true
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
            alpha: CGFloat(alp)//(1.0)
        )
    }
    
    /*
    func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        
        let ItemCellIdentifier = "NewListItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemCellIdentifier, forIndexPath: indexPath) as! ItemShopListCell
        
        cell.editItemOutlet.hidden = true
        cell.checkedButtonOutlet.hidden = true
        cell.copybuttonoutlet.hidden = false
    }
*/
  
    
    
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .Normal, title: NSLocalizedString("delete", comment: "")) { (action , indexPath ) -> Void in
            
            
            // var thissection = indexPath.section
            
            self.editing = false
            if self.showcats == false {
                //self.swipedeleteitem(indexPath)
                //tryusual stuff 
                self.deleteitem(indexPath)
            } else {
                //showcats == true case
                
                // let button = sender as UIButton
                // let view = button.superview!
                // let cell = view.superview as! ItemShopListCell
                
                // var position: CGPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
                // if let indexPathIteminSection = self.tableView.indexPathForRowAtPoint(position)
                //{
                let section = indexPath.section//indexPathIteminSection.section
                let rowsect = indexPath.row//indexPathIteminSection.row
                
                
                var tableSection = self.sections[self.sortedSections[section]]
                let tableItem = tableSection![rowsect]
                
                // itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                
                /////////// CODE OF DELETETION
                //println(indexPathDelete!.row)
                self.itemtodelete = (tableItem as NSDictionary).objectForKey("ItemId") as? String
                // Remains the same
                self.dictionary.removeValueForKey("ItemId")
                self.dictionary.removeValueForKey("ItemName")
                self.dictionary.removeValueForKey("ItemNote")
                // dictionary.removeValueForKey("ItemImage")
                self.dictionary.removeValueForKey("ItemImage2")
                self.dictionary.removeValueForKey("ItemImagePath")
                self.dictionary.removeValueForKey("ItemQuantity")
                self.dictionary.removeValueForKey("ItemTotalPrice")
                self.dictionary.removeValueForKey("ItemUnit")
                self.dictionary.removeValueForKey("ItemIsChecked")
                self.dictionary.removeValueForKey("ItemCategory")
                self.dictionary.removeValueForKey("itemCategoryName")
                self.dictionary.removeValueForKey("ItemOneUnitPrice")
                self.dictionary.removeValueForKey("ItemIsFav")
                self.dictionary.removeValueForKey("ItemPerUnit")
                
                self.dictionary.removeValueForKey("ItemCreation")
                self.dictionary.removeValueForKey("ItemUpdate")
                
                
                let thissectionsname : String = self.sortedSections[section]
                
                for ( var i = 0; i < self.sections[thissectionsname]!.count; i++ ) {
                    
                    
                    // if thisarray[i]["ItemId"] as? String == itemtocheck {
                    if self.sections[thissectionsname]![i]["ItemId"] as? String == self.itemtodelete {
                        
                        self.sections[thissectionsname]!.removeAtIndex(i)
                        
                        break;
                        
                    }
                }
                
                let idtodelete : String = (tableItem as NSDictionary).objectForKey("ItemId") as! String
                var indextodelete = Int()
                
                
                for ( var i = 0; i < itemsDataDict.count; i++ ) {
                    
                    //if let newid : String = itemsDataDict[i]["ItemId"] as? String {
                    if itemsDataDict[i]["ItemId"] as? String == self.itemtodelete {
                        //idtodelete = newid
                        indextodelete = i
                        
                        itemsDataDict.removeAtIndex(i)
                        
                    }
                }
                print(indextodelete)
                /*
                dispatch_async(dispatch_get_main_queue(), {
                    let querynew = PFQuery(className:"shopItems")
                    querynew.whereKey("itemUUID", equalTo: idtodelete)
                    querynew.getFirstObjectInBackgroundWithBlock() {
                        (itemList: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let itemList = itemList {
                            
                            itemList.deleteInBackground()
                            
                        }
                    }
                })
                */
                let querynew1 = PFQuery(className:"shopItems")
                querynew1.fromLocalDatastore()
                //  querynew1.getObjectInBackgroundWithId(itemtodelete!) {
                querynew1.whereKey("itemUUID", equalTo: idtodelete)
                querynew1.getFirstObjectInBackgroundWithBlock() {
                    (itemList: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let itemList = itemList {
                        itemList.unpinInBackground()
                        
                    }
                    
                }
                
                
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                
                // NOW IT WORKS!
                if self.sections[thissectionsname]! == [] {
                    //if sections[thissectionsname]!.count == 0 {
                    self.sections.removeValueForKey(thissectionsname)
                    self.sortedSections.removeAtIndex(section)//[section]
                    
                    
                    
                    //sections[sortedSections[section]]?.removeAll(keepCapacity: true)
                    tableView.reloadData()
                }
                
                
                tableView.reloadData()
                
                self.summationPrices()
                
                self.countitems()
                self.countchecked()
                self.itemsoverall.text = "\(NSLocalizedString("items", comment: "")) \(String(self.itemsoverallqty))/\(String(self.checkeditemsqty))"
                
                
                /////////// END CODE
                //}
                
                
                
            }
        }
        
        deleteAction.backgroundColor = UIColorFromRGB(0xF23D55)
        // deleteAction.backgroundColor = UIColor(patternImage: UIImage(named: "ButtonTrash.png")!)
        
        //let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share") { (action , indexPath) -> Void in
        /*
        let shareAction = UITableViewRowAction(style: .Normal, title: "Share") { (action , indexPath) -> Void in
        self.editing = false
        print("Share button pressed")
        }
        */
        //DOESNT WORK with colors rgb
        //deleteAction.backgroundColor = UIColor(red: 22, green: 149, blue: 163, alpha: 100)
        //shareAction.backgroundColor = UIColor(red: 34, green: 83, blue: 120, alpha: 100)
        
        // deleteAction.backgroundColor = UIColor.magentaColor()
        
        
        // deleteAction.backgroundColor = UIColorFromRGB(0x1695A3)
        //  deleteAction.backgroundColor = UIColor( red: CGFloat(22/255.0), green: CGFloat(149/255.0), blue: CGFloat(163/255.0), alpha: CGFloat(1.0) ) Possible Optin
        //shareAction.backgroundColor = UIColor.blueColor()
        
        
        return [deleteAction]//, shareAction]
    }
    /*
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    var moveImage = shoppingListItemsImages[fromIndexPath.row]
    var moveId = shoppingListItemsIds[fromIndexPath.row]
    var moveName = shoppingListItemsNames[fromIndexPath.row]
    var moveNote = shoppingListItemsNotes[fromIndexPath.row]
    var moveQuantity = shoppingListItemsQuantity[fromIndexPath.row]
    var movePrice = shoppingListItemsPrices[fromIndexPath.row]
    //var movDelButton =
    shoppingListItemsImages.removeAtIndex(fromIndexPath.row)
    shoppingListItemsImages.insert(moveImage, atIndex: toIndexPath.row)
    
    shoppingListItemsIds.removeAtIndex(fromIndexPath.row)
    shoppingListItemsIds.insert(moveId, atIndex: toIndexPath.row)
    
    shoppingListItemsNames.removeAtIndex(fromIndexPath.row)
    shoppingListItemsNames.insert(moveName, atIndex: toIndexPath.row)
    
    shoppingListItemsNotes.removeAtIndex(fromIndexPath.row)
    shoppingListItemsNotes.insert(moveNote, atIndex: toIndexPath.row)
    
    shoppingListItemsQuantity.removeAtIndex(fromIndexPath.row)
    shoppingListItemsQuantity.insert(moveQuantity, atIndex: toIndexPath.row)
    
    shoppingListItemsPrices.removeAtIndex(fromIndexPath.row)
    shoppingListItemsPrices.insert(movePrice, atIndex: toIndexPath.row)
    
    
    }
    */
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    //// FINDOBJECTS PATTERN
    /* querycat.findObjectsInBackgroundWithBlock {
    (objects: [AnyObject]?, error: NSError?) -> Void in
    
    if error == nil {
    
    println("Successfully retrieved \(objects!.count) scores.")
    if let categoriesids = objects as? [PFObject] {
    for object in categoriesids {
    
    
    }
    
    
    }
    } else {
    // Log details of the failure
    println("Error: \(error!) \(error!.userInfo!)")
    }
    }
    */
    
 
    
    /*
    func popoverPresentationControllerShouldDismissPopover(popoverPresentationController: UIPopoverPresentationController) -> Bool {
    
    }
    */
    
    
    
    
    
    ///// END ALERT CODE
    
    
    ////// INFO ABOUT CURRENCIES
    ///// LOCAL CODE AND SYMBOL
    /*
    let local = NSLocale.currentLocale()
    var symbol = local.objectForKey(NSLocaleCurrencySymbol)
    var code = local.objectForKey(NSLocaleCurrencyCode)
    */
    
    /// GET ALL CURRENCIES
    /*
    let currencies = NSLocale.ISOCurrencyCodes()
    
    
    
    var arrayofcodesandsymbols = [[AnyObject]]()
    
    for currency in currencies { //Currency = "USD" etc
    let localeComponents = [NSLocaleCurrencyCode: currency]
    let localeIdentifier = NSLocale.localeIdentifierFromComponents(localeComponents)
    let locale = NSLocale(localeIdentifier: localeIdentifier)
    let currencySymbol = locale.objectForKey(NSLocaleCurrencySymbol) as! String
    
    arrayofcodesandsymbols.append([currency,currencySymbol])
    
    }
    
    println(arrayofcodesandsymbols)
    */
    
}
