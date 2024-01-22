import UIKit
import CoreData
import DropDown
import MapKit

class FourthViewController: UIViewController {
    
    // 색 번호
//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "default_person")
        imageView.translatesAutoresizingMaskIntoConstraints = false // Auto Layout 설정
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 10.0 // 테두리의 모서리를 둥글게 만듦 (원하는 값으로 조절)

        return imageView
    }()
    var usernameTextField = UITextField()
    var userphoneTextField = UITextField()
    var userageTextField = UITextField()
    
    let usernameLabel = UILabel()
    let userphoneLabel = UILabel()
    let userageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        //화면 비율 조정
        let screenSize = UIScreen.main.bounds.size
        //이미지
        let widthSize = screenSize.width * 0.35 * 1.4
        let hightSize = screenSize.width * 0.4 * 1.4
        let paddinghightSize = screenSize.width * 0.3
        let paddingwidthSize = screenSize.width * 0.5
        //라벨
        let paddinglabelwidthSize = screenSize.width * 0.1
        //테스트
        let paddingtextwidthSize = screenSize.width * 0.25
        //스크롤뷰 설정
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 0.9)  // Adjust content size as needed
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = backgroundcolor
        view.addSubview(scrollView)
        scrollView.addSubview(profileImageView)
        
        // 이미지 로고
        let imageView  = UIImageView(image: UIImage(named: "hub_logo_zero")) // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        // 이미지 뷰를 화면에 추가합니다.
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: paddinghightSize),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: widthSize), // 예시로 너비 100 설정
            profileImageView.heightAnchor.constraint(equalToConstant: hightSize) // 예시로 높이 100 설정
        ])
        // 사용자 이름 입력 라벨
        usernameLabel.text = "이름"
        usernameLabel.font = UIFont.systemFont(ofSize: 15)
        usernameLabel.frame = CGRect(x: paddinglabelwidthSize, y: 400, width: 200, height: 30)
        usernameLabel.textColor = UIColor.black
        view.addSubview(usernameLabel)
        
        // 사용자 이름 입력 필드 설정
        usernameTextField.text = "서민이"// ex) 예시
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.frame = CGRect(x: paddingtextwidthSize, y: 400, width: 250, height: 40)
        view.addSubview(usernameTextField)
        usernameTextField.isEnabled = false
        // 사용자 이름 입력 라벨
        userphoneLabel.text = "전화번호"
        userphoneLabel.font = UIFont.systemFont(ofSize: 15)
        userphoneLabel.frame = CGRect(x: paddinglabelwidthSize, y: 480, width: 200, height: 30)
        userphoneLabel.textColor = UIColor.black
        view.addSubview(userphoneLabel)
        
        // 사용자 이름 입력 필드 설정
        userphoneTextField.text = "010-3020-2016"// ex) 예시
        userphoneTextField.borderStyle = .roundedRect
        userphoneTextField.frame = CGRect(x: paddingtextwidthSize, y: 480, width: 250, height: 40)
        view.addSubview(userphoneTextField)
        userphoneTextField.isEnabled = false
        // 사용자 이름 입력 라벨
        userageLabel.text = "기수"
        userageLabel.font = UIFont.systemFont(ofSize: 15)
        userageLabel.frame = CGRect(x: paddinglabelwidthSize, y: 560, width: 200, height: 30)
        userageLabel.textColor = UIColor.black
        view.addSubview(userageLabel)
        
        // 사용자 이름 입력 필드 설정
        userageTextField.text = "33기"// ex) 예시
        userageTextField.borderStyle = .roundedRect
        userageTextField.frame = CGRect(x: paddingtextwidthSize, y: 560, width: 250, height: 40)
        view.addSubview(userageTextField)
        userageTextField.isEnabled = false
    }
}
