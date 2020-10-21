import UIKit
import AVFoundation

class ViewController: UIViewController{
    

    let keys = ["note1","note2","note3","note4","note5","note6","note7",]
    
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    func play(tag:Int){
        let url = Bundle.main.url(forResource: keys[tag-1], withExtension: "wav")
        do{
            player = try AVAudioPlayer(contentsOf: url!)
            player.play()
        }catch{
            print(error)
        }
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        play(tag: sender.tag)
        
    }
    
  

}

