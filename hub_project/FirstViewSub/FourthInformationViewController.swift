import UIKit
import CoreData
import DropDown
import MapKit

class FourthInformationViewController: UIViewController {

//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    let subColor = UIColor(red: CGFloat(0x5E) / 255.0, green: CGFloat(0x54) / 255.0, blue: CGFloat(0x48) / 255.0, alpha: 1.0)
    let mainColor = UIColor(red: CGFloat(0x40) / 255.0, green: CGFloat(0x34) / 255.0, blue: CGFloat(0x2A) / 255.0, alpha: 1.0)
    var mapView = MKMapView()

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
        
        super.viewDidLoad()

        // 지도 초기화
        mapView = MKMapView()
        
        // 지도의 프레임 설정
        mapView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 250)
        
        // 지도의 지역 설정
        let initialLocation = CLLocation(latitude: 37.479412, longitude: 127.034026)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(
            center: initialLocation.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        // 지도에 핀 추가
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "서울특별시 서초구 바우뫼로31길 70"
        mapView.addAnnotation(annotation)
        
        // 지도를 뷰 계층에 추가
//        view.addSubview(mapView)

        // 라벨
        let Maplabel = UILabel(frame: CGRect(x: 10, y: 20, width: view.frame.width, height: 30))
        Maplabel.text = "Map"
        Maplabel.textColor = hubRedColor
        Maplabel.font = UIFont.boldSystemFont(ofSize: 15)

        let text = """
            오시는 길
            
            서울 서초구 바우뫼로31길 70
            
            시내버스 : 140, 421, 440, 441, 452, 470, 741 번 :
            시내버스 일동제약 사거리 / 교육개발원 입구 하차
            
            마을버스 : 8, 18 번 :
            일동제약 앞 하차 후 도보
            
            지하철 : 3호선, 신분당선 양재역 9, 10, 11번 출구 :
            양재 꽃시장/성남 방면으로 500M 직진  교육개발원 입구 세븐일레븐 앞에서 골목으로 우회전  정면에 양재 온누리교회 위치
            
            양재 환승 주차장 입구 매 주일 06:30~16:30
            """

        let scheduleLabel = UILabel(frame: CGRect(x: 10, y: 300, width: view.frame.width - 40, height: view.frame.height * 0.4))
        scheduleLabel.numberOfLines = 0
        scheduleLabel.textColor = subColor
        scheduleLabel.font = UIFont.systemFont(ofSize: 14)
        
        let attributedText = NSMutableAttributedString(string: text)

        let range = (text as NSString).range(of: "오시는 길")
        let range1 = (text as NSString).range(of: "시내버스 : 140, 421, 440, 441, 452, 470, 741 번 :")
        let range2 = (text as NSString).range(of: "마을버스 : 8, 18 번 :")
        let range3 = (text as NSString).range(of: "지하철 : 3호선, 신분당선 양재역 9, 10, 11번 출구 :")
        let range4 = (text as NSString).range(of: "양재 환승 주차장 입구")



        attributedText.addAttribute(.foregroundColor, value: hubRedColor, range: range)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: range)
        attributedText.addAttribute(.foregroundColor, value: mainColor, range: range1)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: range1)
        attributedText.addAttribute(.foregroundColor, value: mainColor, range: range2)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: range2)
        attributedText.addAttribute(.foregroundColor, value: mainColor, range: range3)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: range3)
        attributedText.addAttribute(.foregroundColor, value: mainColor, range: range4)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 15), range: range4)
        scheduleLabel.attributedText = attributedText
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10

        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))

        scrollView.addSubview(scheduleLabel)
    
        scrollView.addSubview(Maplabel)
        scrollView.addSubview(mapView)
    }
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
