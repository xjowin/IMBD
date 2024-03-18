import UIKit
import AVFoundation
import AVFAudio
import AVKit

class MoviePageViewController: UIViewController {
    
    var voicee : AVAudioPlayer!
    var ostt : AVAudioPlayer!
    
    var btnVoice : UIButton!
    var btnOst : UIButton!
    var trailer = ""
        
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieCover: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var trailerCover: UIImageView!
    @IBOutlet weak var soundtrackName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var voice = ""
        var ost = ""
        
        switch (category) {
        case 1 :
            voice = "minionsVoice"
            ost = "minionsOST"
            trailer = "minionsTrailer"
            movieName.text = "Minions (2015)"
            movieCover.image = UIImage(named: "minionsCover")
            movieDescription.text = minionsDesc
            trailerCover.image = UIImage(named: "minionsTrailerCover")
            soundtrackName.text = "Universal Fanfare"
        case 2 :
            voice = "peakyBlindersVoice"
            ost = "peakyBlindersOST"
            trailer = "peakyBlindersTrailer"
            movieName.text = "Peaky Blinders"
            movieCover.image = UIImage(named: "peakyBlindersCover")
            movieDescription.text = peakyBlindersDesc
            trailerCover.image = UIImage(named: "peakyBlindersTrailerCover")
            soundtrackName.text = "Red Right Hand"
        case 3 :
            voice = "theBoysVoice"
            ost = "theBoysOST"
            trailer = "theBoysTrailer"
            movieName.text = "The Boys"
            movieCover.image = UIImage(named: "theBoysCover")
            movieDescription.text = theBoysDesc
            trailerCover.image = UIImage(named: "theBoysTrailerCover")
            soundtrackName.text = "Translucent Alive"
        default:
            movieDescription.text = theBoysDesc
        }
        
        if let str = Bundle.main.url(forResource: voice, withExtension: "mp3")?.relativeString {
            if let url = URL(string: str) {
                voicee = try! AVAudioPlayer(contentsOf: url)
                voicee.prepareToPlay()
                voicee.volume = 0.5
            }
        }
        if let strr = Bundle.main.url(forResource: ost, withExtension: "mp3")?.relativeString {
            if let url = URL(string: strr) {
                ostt = try! AVAudioPlayer(contentsOf: url)
                ostt.prepareToPlay()
                ostt.volume = 0.5
            }
        }
        
    }
    
    
    @IBAction func trailerPlayBtn(_ sender: Any) {
        if let str = Bundle.main.url(forResource: trailer, withExtension: "mp4")?.relativeString {
            if let url = URL(string: str) {
                let screen = AVPlayerViewController()
                screen.player = AVPlayer(url: url)
                self.present(screen, animated: true)
            }
        }
    }
    
    
    @IBAction func ostPlayBtn(_ sender: Any) {
        btnOst = sender as? UIButton
        
        if voicee.isPlaying{
            voicee.stop()
            btnVoice.setImage(UIImage(systemName: "play.fill"), for: .normal)

        }
        
        if ostt.isPlaying {
            ostt.stop()
            btnOst.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            ostt.play()
            btnOst.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
    }
    
    
    @IBAction func voicePlayBtn(_ sender: Any) {
        btnVoice = sender as? UIButton
        
        if ostt.isPlaying{
            ostt.stop()
            btnOst.setImage(UIImage(systemName: "play.fill"), for: .normal)

        }
        
        if voicee.isPlaying {
            voicee.stop()
            btnVoice.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            voicee.play()
            btnVoice.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
    }
    
    
    @IBAction func bqckBtn(_ sender: Any) {
        ostt.stop()
        voicee.stop()
        let new = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
