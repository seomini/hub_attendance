import UIKit
import CoreData
import DropDown
import MapKit

// 소개합니다
class SecondInformationViewController: UIViewController {

    //    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
        let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    //    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
        let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
        let subColor = UIColor(red: CGFloat(0x5E) / 255.0, green: CGFloat(0x54) / 255.0, blue: CGFloat(0x48) / 255.0, alpha: 1.0)
        let mainColor = UIColor(red: CGFloat(0x40) / 255.0, green: CGFloat(0x34) / 255.0, blue: CGFloat(0x2A) / 255.0, alpha: 1.0)

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
            backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hubRedColor], for: .normal)

            navigationItem.leftBarButtonItem = backButton

            let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 0.9)  // Adjust content size as needed
            scrollView.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = false
            scrollView.backgroundColor = backgroundcolor
            view.addSubview(scrollView)
            
            let text = """
                
                양재 2부 새벽 기도회
                
                월~금 6:30am
                양재 기쁨홀 현장 예배, 유튜브 실시간 온라인 예배
                
                
                허브 금요 기도회 <The Calling>
                
                금요일 8:00pm
                양재 화평홀 현장 예배

                
                
                화요성령집회
                
                매주 화요일 7:30pm
                서빙고 본당 예배당 예배, 유튜브 실시간 영상 예배

                
                캠퍼스를 위한 예배의 자리 <캠미>
                
                시간 : 카톡 주보를 통해 공지
                실시간 200m 예배

                
                허브 캠퍼스 모임
                
                캠퍼스 모임을 만들거나 하고 싶으신 분들은 연락주세요 :)
                김예은(35) 010-4413-2388

                
                온라인 모임
                
                허브 중보기도회
                허브 예배를 위한 중보기도회
                주일 12시 10분
                양재 강의동 203호
                """

            let scheduleLabel = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width - 40, height: view.frame.height * 0.8))
            scheduleLabel.numberOfLines = 0
            scheduleLabel.textColor = subColor
            scheduleLabel.font = UIFont.systemFont(ofSize: 14)
            
            let attributedText = NSMutableAttributedString(string: text)

            
            let range = (text as NSString).range(of: "양재 2부 새벽 기도회")
            let range1 = (text as NSString).range(of: "허브 금요 기도회 <The Calling>")
            let range2 = (text as NSString).range(of: "화요성령집회")
            let range3 = (text as NSString).range(of: "캠퍼스를 위한 예배의 자리 <캠미>")
            let range4 = (text as NSString).range(of: "허브 캠퍼스 모임")
            let range5 = (text as NSString).range(of: "온라인 모임")

            
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range)
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range1)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range1)
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range2)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range2)
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range3)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range3)
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range4)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range4)
            attributedText.addAttribute(.foregroundColor, value: mainColor, range: range5)
            attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 18), range: range5)
            
            scheduleLabel.attributedText = attributedText
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 3  // Adjust the value to set the desired line spacing

            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))

            scrollView.addSubview(scheduleLabel)
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
