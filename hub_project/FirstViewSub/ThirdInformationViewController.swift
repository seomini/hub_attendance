import UIKit
import CoreData
import DropDown
import MapKit

//교역자 소개
class ThirdInformationViewController: UIViewController {

    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    let subColor = UIColor(red: CGFloat(0x5E) / 255.0, green: CGFloat(0x54) / 255.0, blue: CGFloat(0x48) / 255.0, alpha: 1.0)
    let mainColor = UIColor(red: CGFloat(0x40) / 255.0, green: CGFloat(0x34) / 255.0, blue: CGFloat(0x2A) / 255.0, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이즈 설정
        let screenSize = UIScreen.main.bounds.size
        let imagesize =  screenSize.width * 0.5
        let hightsetting = screenSize.width * 0.6
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hubRedColor], for: .normal)

        navigationItem.leftBarButtonItem = backButton
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = backgroundcolor
        view.addSubview(scrollView)
        
        // 교역자 사진 및 라벨
        let pastorlabel = UILabel()
        pastorlabel.text = "• 이서진 목사"
        pastorlabel.font = UIFont.systemFont(ofSize: 20)
        pastorlabel.frame = CGRect(x: 0, y: 20, width: 200, height: 30)
        pastorlabel.textColor = mainColor
        
        let pastorView = UIImageView(frame: CGRect(x: 0, y: 50, width: imagesize, height: imagesize))
        pastorView.image = UIImage(named: "이서진 목사")
        pastorView.contentMode = .scaleAspectFit
        pastorView.layer.cornerRadius = pastorView.frame.size.width / 2
        pastorView.clipsToBounds = true
        
        let missionarylovelabel = UILabel()
        missionarylovelabel.text = "• 박새미 전도사 (사랑)"
        missionarylovelabel.font = UIFont.systemFont(ofSize: 20)
        missionarylovelabel.frame = CGRect(x: 0, y: 20 + hightsetting, width: 200, height: 30)
        missionarylovelabel.textColor = mainColor
        
        let missionaryloveView = UIImageView(frame: CGRect(x: 0, y: 50 + hightsetting, width: imagesize, height: imagesize))
        missionaryloveView.image = UIImage(named: "박새미 전도사")
        missionaryloveView.contentMode = .scaleAspectFit
        missionaryloveView.layer.cornerRadius = missionaryloveView.frame.size.width / 2
        missionaryloveView.clipsToBounds = true
        
        let missionaryhopelabel = UILabel()
        missionaryhopelabel.text = "• 이진기 전도사 (소망)"
        missionaryhopelabel.font = UIFont.systemFont(ofSize: 20)
        missionaryhopelabel.frame = CGRect(x: 0, y: 20 + hightsetting * 2, width: 200, height: 30)
        missionaryhopelabel.textColor = mainColor
        
        let missionaryhopeView = UIImageView(frame: CGRect(x: 0, y: 50 + hightsetting * 2, width: imagesize, height: imagesize))
        missionaryhopeView.image = UIImage(named: "이진기 전도사")
        missionaryhopeView.contentMode = .scaleAspectFit
        missionaryhopeView.layer.cornerRadius = missionaryhopeView.frame.size.width / 2
        missionaryhopeView.clipsToBounds = true
        
        let missionarybelieflabel = UILabel()
        missionarybelieflabel.text = "• 구길모 전도사 (믿음)"
        missionarybelieflabel.font = UIFont.systemFont(ofSize: 20)
        missionarybelieflabel.frame = CGRect(x: 0, y: 20 + hightsetting * 3, width: 200, height: 30)
        missionarybelieflabel.textColor = mainColor
        
        let missionarybeliefView = UIImageView(frame: CGRect(x: 0, y: 50 + hightsetting * 3, width: imagesize, height: imagesize))
        missionarybeliefView.image = UIImage(named: "구길모 전도사")
        missionarybeliefView.contentMode = .scaleAspectFit
        missionarybeliefView.layer.cornerRadius = missionarybeliefView.frame.size.width / 2
        missionarybeliefView.clipsToBounds = true
        
        //label
        scrollView.addSubview(pastorlabel)
        scrollView.addSubview(missionarylovelabel)
        scrollView.addSubview(missionaryhopelabel)
        scrollView.addSubview(missionarybelieflabel)
        
        //image
        scrollView.addSubview(pastorView)
        scrollView.addSubview(missionaryloveView)
        scrollView.addSubview(missionaryhopeView)
        scrollView.addSubview(missionarybeliefView)
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
