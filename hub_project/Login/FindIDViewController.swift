import UIKit
import CoreData
import DropDown
import MapKit

class FindIDViewController: UIViewController {
    
    // 색 번호
//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    
    // 버튼 생성
    let lbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 480, width: widthSize, height: 40))
        lbutton.setTitle("확인", for: .normal)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width / 2
        // 버튼의 모서리를 둥글게 설정
        lbutton.layer.cornerRadius = 20  // 25는 반지름 값으로 원하는 값으로 조절 가능
        // 버튼의 글씨체를 볼드 처리
        lbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // 18.0은 원하는 글씨 크기
        return lbutton
    }()
    let findidviewlbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 220, width: widthSize/2, height: 40))
        lbutton.setTitle("아이디 찾기", for: .normal)
        lbutton.backgroundColor = .white
        lbutton.setTitleColor(UIColor.orange, for: .normal)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width / 4
        return lbutton
    }()
    let findpwviewlbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 220, width: widthSize/2, height: 40))
        lbutton.setTitle("비밀번호 찾기", for: .normal)
        lbutton.backgroundColor = .white
        lbutton.setTitleColor(UIColor.gray, for: .normal)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width * 3 / 4
        return lbutton
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
             self.view.endEditing(true)
             }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor
        //키보드 세팅
        
        NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardWillHide(_:)),
                                                name: UIResponder.keyboardWillHideNotification,
                                                object: nil)
        NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardWillShow(_:)),
                                                name: UIResponder.keyboardWillShowNotification,
                                                object: nil)
        // 색상 설정
        findidviewlbutton.backgroundColor = backgroundcolor
        findpwviewlbutton.backgroundColor = backgroundcolor
        lbutton.backgroundColor = hubRedColor
        findidviewlbutton.setTitleColor(hubRedColor, for: .normal)
        
        // 텍스트 뷰 생성
        let usernameTextField = UITextField()
        let birthTextField = UITextField()
        let phoneTextField = UITextField()
        
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let paddingwidthSize = screenSize.width * 0.1
        
        // 사용자 이름 입력 필드 설정
        usernameTextField.placeholder = "이름"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.frame = CGRect(x: paddingwidthSize, y: 300, width: widthSize, height: 40)
        usernameTextField.center.x = screenSize.width / 2
        view.addSubview(usernameTextField)

        // 생년월일 입력 필드 설정
        birthTextField.placeholder = "생년월일"
        birthTextField.borderStyle = .roundedRect
        birthTextField.keyboardType = .numberPad
        birthTextField.isSecureTextEntry = true
        birthTextField.frame = CGRect(x: paddingwidthSize, y: 360, width: widthSize, height: 40)
        birthTextField.center.x = screenSize.width / 2
        view.addSubview(birthTextField)
        
        // 폰번호 입력 필드 설정
        phoneTextField.placeholder = "휴대폰 번호"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = .numberPad
        phoneTextField.isSecureTextEntry = true
        phoneTextField.frame = CGRect(x: paddingwidthSize, y: 420, width: widthSize, height: 40)
        phoneTextField.center.x = screenSize.width / 2
        view.addSubview(phoneTextField)
        
        view.addSubview(findidviewlbutton)
        view.addSubview(findpwviewlbutton)
        view.addSubview(lbutton)
        lbutton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        findpwviewlbutton.addTarget(self, action: #selector(pwfindButtonTapped), for: .touchUpInside)
    }
    //키보드 올라갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillShow(_ sender:Notification){
            self.view.frame.origin.y = -150
    }
    //키보드 내려갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillHide(_ sender:Notification){
            self.view.frame.origin.y = 0
    }
    //  확인 이벤트
    @IBAction func okButtonTapped(_ sender: UIButton) {
    }
    //  아이디 찾기 이벤트
    @IBAction func idfindButtonTapped(_ sender: UIButton) {
    }
    //  비밀번호 찾기 이벤트
    @IBAction func pwfindButtonTapped(_ sender: UIButton) {
        present(FindPWViewController(), animated:false)
    }
}
