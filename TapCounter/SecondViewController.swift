//
//  SecondViewController.swift
//  TapCounter
//
//  Created by Family on 4/2/16.
//  Copyright © 2016 Premium Business LLC. All rights reserved.
//

import UIKit
import AVFoundation


var player : AVAudioPlayer!

class SecondViewController: UIViewController {

    @IBOutlet weak var imageLoad: UIImageView!
    
    enum ErrorHandling:ErrorType
    {
        case NetworkError
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .CoverVertical

        // Do any additional setup after loading the view.
        
        load_image("http://www.wikihow.com/images/c/cf/Cheat-on-Scary-Maze-Step-5.jpg")
        music()
        
    
    }
    
    
    
    func load_image(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.imageLoad.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        
        task.resume()
    }
    
    func music(){
        let path = NSBundle.mainBundle().pathForResource("0477", ofType:"mp3")!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            player = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }
    }

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
