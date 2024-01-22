import UIKit
import CoreData
import DropDown

class SoonAttendanceDetailView: UIViewController {
    
    // 색 번호
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    

    var usermemoTextField = UITextField()
    let usermemoLabel = UILabel()

    var radioattendance = UIButton()
    var radioabsent = UIButton()
    
    // 수정하기 생성
    let correctionlbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 500, width: widthSize, height: 40))
        lbutton.setTitle("수정하기", for: .normal)
        lbutton.backgroundColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width / 2
        // 버튼의 모서리를 둥글게 설정
        lbutton.layer.cornerRadius = 20  // 25는 반지름 값으로 원하는 값으로 조절 가능
        // 버튼의 글씨체를 볼드 처리
        lbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // 18.0은 원하는 글씨 크기
        return lbutton
    }()
    // 저장하기 생성
    let updatelbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 500, width: widthSize, height: 40))
        lbutton.setTitle("저장하기", for: .normal)
        lbutton.backgroundColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width / 2
        // 버튼의 모서리를 둥글게 설정
        lbutton.layer.cornerRadius = 20  // 25는 반지름 값으로 원하는 값으로 조절 가능
        // 버튼의 글씨체를 볼드 처리
        lbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // 18.0은 원하는 글씨 크기
        return lbutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hubRedColor], for: .normal)

        navigationItem.leftBarButtonItem = backButton
        //화면 비율 조정
        let screenSize = UIScreen.main.bounds.size

        let widthSize = screenSize.width * 0.8
        
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

        // 사용자 이름 입력 라벨
        usermemoLabel.text = "메모"
        usermemoLabel.font = UIFont.systemFont(ofSize: 15)
        usermemoLabel.frame = CGRect(x: paddinglabelwidthSize + 10, y: 120, width: 200, height: 30)
        usermemoLabel.textColor = UIColor.black
        view.addSubview(usermemoLabel)
        
        usermemoTextField.text = ""
        usermemoTextField.borderStyle = .roundedRect
        usermemoTextField.frame = CGRect(x: 0, y: 150, width: widthSize, height: 300)
        usermemoTextField.center.x = screenSize.width / 2
        usermemoTextField.contentVerticalAlignment = .top

        view.addSubview(usermemoTextField)
        usermemoTextField.isEnabled = false
        
        radioattendance.isEnabled = false
        radioabsent.isEnabled = false
        configureRadioButton(radioattendance, position: CGPoint(x: paddinglabelwidthSize + 10, y: 470), title: "출석")
        configureRadioButton(radioabsent, position: CGPoint(x: paddinglabelwidthSize + 70, y: 470), title: "결석")
        
        view.addSubview(correctionlbutton)
        view.addSubview(updatelbutton)
        updatelbutton.isHidden = true
        correctionlbutton.addTarget(self, action: #selector(correctionButtonTapped), for: .touchUpInside)
        updatelbutton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    func configureRadioButton(_ button: UIButton, position: CGPoint, title: String) {
        button.frame = CGRect(origin: position, size: CGSize(width: 20, height: 20))

        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)

        button.tintColor = hubRedColor
        button.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(button)

        let label = UILabel(frame: CGRect(x: position.x + 30, y: position.y - 5, width: 100, height: 30))
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(label)
    }
    @objc func radioButtonTapped(_ sender: UIButton) {
        radioattendance.isSelected = false
        radioabsent.isSelected = false

        sender.isSelected = true
    }
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    //  수정하기 이벤트
    @IBAction func correctionButtonTapped(_ sender: UIButton) {
        usermemoTextField.isEnabled = true
        radioattendance.isEnabled = true
        radioabsent.isEnabled = true
        correctionlbutton.isHidden = true
        updatelbutton.isHidden = false

    }
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        usermemoTextField.isEnabled = false
        radioattendance.isEnabled = false
        radioabsent.isEnabled = false
        correctionlbutton.isHidden = false
        updatelbutton.isHidden = true
    }
}
