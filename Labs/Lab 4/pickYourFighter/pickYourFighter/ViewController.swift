//
//  ViewController.swift
//  pickYourFighter
//
//  Created by Azariah Kierson-Galeano on 10/9/18.
//  Copyright © 2018 Azariah Kierson-Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Fighter
    var fighter = fighterClass()
    let filename = "test.plist"

    @IBOutlet weak var fighterImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var satanismLabel: UILabel!
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        nameLabel.text = fighter.name
        strengthLabel.text = fighter.strength
        speedLabel.text = fighter.speed
        satanismLabel.text = fighter.satanism
        switch fighter.type {
        case 0:
            fighterImg.image = UIImage(named: "red")
        case 1:
            fighterImg.image = UIImage(named: "yellow")
        case 2:
            fighterImg.image = UIImage(named: "blue")
        case 3:
            fighterImg.image = UIImage(named: "green")
        default:
            break
        }
    }
    
    func dataFileURL(_ filename:String) -> URL? {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
    
    override func viewDidLoad() {
        let fileURL = dataFileURL(filename)
        
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                //creates a data buffer with the contents of the plist
                let data = try Data(contentsOf: url)
                //create an instance of PropertyListDecoder
                let decoder = PropertyListDecoder()
                //decode the data using the structure of the Favorite class
                fighter = try decoder.decode(fighterClass.self, from: data)
                //assign data to things
                nameLabel.text = fighter.name
                strengthLabel.text = fighter.strength
                speedLabel.text = fighter.speed
                satanismLabel.text = fighter.satanism
                switch fighter.type {
                case 0:
                    fighterImg.image = UIImage(named: "red")
                case 1:
                    fighterImg.image = UIImage(named: "yellow")
                case 2:
                    fighterImg.image = UIImage(named: "blue")
                case 3:
                    fighterImg.image = UIImage(named: "green")
                default:
                    break
                }
                
            } catch {
                print("no file")
            }
        } else {
            print("file does not exist")
        }
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func applicationWillResignActive(_ notification: Notification){
        //url of data file
        let fileURL = dataFileURL(filename)
        //create an instance of PropertyListEncoder
        let encoder = PropertyListEncoder()
        //set format type to xml
        encoder.outputFormat = .xml
        do {
            //encode the data using the structure of the Favorite class
            let plistData = try encoder.encode(fighter)
            //write encoded data to the file
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




