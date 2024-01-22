import UIKit
import CoreData
import DropDown
import MapKit

//메인 화면
class FristViewController: UIViewController, UIScrollViewDelegate {
    // 색 번호
//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        //스크롤뷰 설정
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 0.9)  // Adjust content size as needed
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = backgroundcolor
        view.addSubview(scrollView)
        
        // 사이즈 및 위치
        let screenSize = UIScreen.main.bounds.size
        let introductionSize = screenSize.width * 0.14
        let paddingwidthSize = screenSize.width * 0.093
        let padding1widthSize = paddingwidthSize * 2 + introductionSize
        let padding2widthSize = paddingwidthSize * 3 + introductionSize * 2
        let padding3widthSize = paddingwidthSize * 4 + introductionSize * 3
        
        // 이미지 로고
        let imageView  = UIImageView(image: UIImage(named: "hub_logo_zero")) // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        // 배너
        let BannerViewController = BannerViewController()
        BannerViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        
        //introduction 버튼 및 라벨 3개
        let fristimgViewButton: UIButton = {
            let button = UIButton(frame: CGRect(x: paddingwidthSize, y: 225, width: introductionSize, height: introductionSize))
            button.setImage(UIImage(named: "megaphone"), for: .normal) // Replace with your image name
            button.addTarget(self, action: #selector(didfristimgViewTapButton), for: .touchUpInside)
            return button
        }()
        let firstlabel = UILabel(frame: CGRect(x: paddingwidthSize - 10, y: 235 + introductionSize, width: 100, height: 20))
        firstlabel.text = "교회 소개"
        firstlabel.font = UIFont.systemFont(ofSize: 16.0) // 원하는 크기로 변경
        firstlabel.textColor = hubRedColor // 원하는 색상으로 변경
        scrollView.addSubview(firstlabel)
        
        let secondimgViewButton: UIButton = {
            let button = UIButton(frame: CGRect(x: padding1widthSize, y: 225, width: introductionSize, height: introductionSize))
            button.setImage(UIImage(named: "house"), for: .normal) // Replace with your image name
            button.addTarget(self, action: #selector(didsecondimgViewTapButton), for: .touchUpInside)
            return button
        }()
        let secondlabel = UILabel(frame: CGRect(x: padding1widthSize - 10, y: 235 + introductionSize, width: 100, height: 20))
        secondlabel.text = "예배 시간"
        secondlabel.font = UIFont.systemFont(ofSize: 16.0) // 원하는 크기로 변경
        secondlabel.textColor = hubRedColor // 원하는 색상으로 변경
        scrollView.addSubview(secondlabel)
        
        let thirdimgViewButton: UIButton = {
            let button = UIButton(frame: CGRect(x: padding2widthSize, y: 225, width: introductionSize, height: introductionSize))
            button.setImage(UIImage(named: "music"), for: .normal) // Replace with your image name
            button.addTarget(self, action: #selector(didthirdimgViewTapButton), for: .touchUpInside)
            return button
        }()
        let thirdlabel = UILabel(frame: CGRect(x: padding2widthSize - 10, y: 235 + introductionSize, width: 100, height: 20))
        thirdlabel.text = "교역자 소개"
        thirdlabel.font = UIFont.systemFont(ofSize: 16.0) // 원하는 크기로 변경
        thirdlabel.textColor = hubRedColor // 원하는 색상으로 변경
        scrollView.addSubview(thirdlabel)
        
        let fourthimgViewButton: UIButton = {
            let button = UIButton(frame: CGRect(x: padding3widthSize, y: 225, width: introductionSize, height: introductionSize))
            button.setImage(UIImage(named: "placeholder"), for: .normal) // Replace with your image name
            button.addTarget(self, action: #selector(didfourthimgViewTapButton), for: .touchUpInside)
            return button
        }()
        let fourthlabel = UILabel(frame: CGRect(x: padding3widthSize - 10, y: 235 + introductionSize, width: 70, height: 20))
        fourthlabel.text = "오시는 길"
        fourthlabel.font = UIFont.systemFont(ofSize: 16.0) // 원하는 크기로 변경
        fourthlabel.textAlignment = .center
        fourthlabel.textColor = hubRedColor // 원하는 색상으로 변경
        scrollView.addSubview(fourthlabel)
    
        // 오늘의 큐티 noticeboard
        let qtboard = UILabel()
        qtboard.text = "오늘의 큐티"
        qtboard.font = UIFont.systemFont(ofSize: 20)
        qtboard.frame = CGRect(x: 0, y: 330, width:view.frame.width * 0.92 , height: 200)
        qtboard.center.x = screenSize.width / 2
        qtboard.layer.cornerRadius = 10.0
        qtboard.layer.borderWidth = 1.0
        qtboard.layer.borderColor = UIColor.white.cgColor
        qtboard.textColor = UIColor.black
        qtboard.textAlignment = NSTextAlignment.center
        qtboard.backgroundColor = UIColor.white // 배경색을 흰색으로 설정
        qtboard.layer.masksToBounds = true
        
        // 알림판 noticeboard
        let noticeboard = UILabel()
        noticeboard.text = "알림판"
        noticeboard.font = UIFont.systemFont(ofSize: 20)
        noticeboard.frame = CGRect(x: 0, y: 560, width:view.frame.width * 0.92 , height: 200)
        noticeboard.center.x = screenSize.width / 2
        noticeboard.layer.cornerRadius = 10.0
        noticeboard.layer.borderWidth = 1.0
        noticeboard.layer.borderColor = UIColor.white.cgColor
        noticeboard.textColor = UIColor.black
        noticeboard.textAlignment = NSTextAlignment.center
        noticeboard.backgroundColor = UIColor.white // 배경색을 흰색으로 설정
        noticeboard.layer.masksToBounds = true
        
        // 명암(그림자) 설정
        noticeboard.layer.shadowColor = UIColor.black.cgColor
        noticeboard.layer.shadowOpacity = 0.7
        noticeboard.layer.shadowOffset = CGSize(width: 0, height: 2)
        noticeboard.layer.shadowRadius = 4
        
        scrollView.addSubview(BannerViewController.view)
        scrollView.addSubview(fristimgViewButton)
        scrollView.addSubview(secondimgViewButton)
        scrollView.addSubview(thirdimgViewButton)
        scrollView.addSubview(fourthimgViewButton)
        scrollView.addSubview(qtboard)
        scrollView.addSubview(noticeboard)
    
    }
    //클릭 이벤트
    @objc func didfristimgViewTapButton() {
        let vc = FristInformationViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    @objc func didsecondimgViewTapButton() {
        let vc = SecondInformationViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    @objc func didthirdimgViewTapButton() {
        let vc = ThirdInformationViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    @objc func didfourthimgViewTapButton() {
        let vc = FourthInformationViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
}
