import UIKit
import CoreData
import DropDown
import MapKit

class MakeIDViewController: UIViewController {
    
    // 텍스트 박스 설정
    var makeusernameTextField = UITextField() //이름
    var makeuseridTextField = UITextField()   //아이디
    var makeuserbirthTextField = UITextField()//생일
    var makepassword1TextField = UITextField()//비밀번호
    var makepassword2TextField = UITextField()//비밀번호확인
    var makephoneTextField = UITextField()//휴대폰
    var makeemailTextField = UITextField()//이메일
    //라벨 설정
    let maketitleLabel = UILabel() //제목
    let makeusernameLabel = UILabel() //이름
    let makeuseridLabel = UILabel()   //아이디
    let makeuserbirthLabel = UILabel()//생년월일
    let makepassword1Label = UILabel()//비밀번호
    let makephoneLabel = UILabel()//휴대폰
    let makeemailLabel = UILabel()//이메일
    
    // 색 번호
//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    //확인 버튼
    let mkoklabelbutton: UIButton = {
        //화면 크기 설정
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let paddingwidthSize = screenSize.width * 0.1
        //버튼 세팅
        let lbutton = UIButton(frame: CGRect(x: 0, y: 635, width: widthSize, height: 40))
        lbutton.center.x = screenSize.width / 2
        lbutton.setTitle("확인", for: .normal)
        lbutton.backgroundColor = .orange
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        // 버튼의 모서리를 둥글게 설정
        lbutton.layer.cornerRadius = 20  // 25는 반지름 값으로 원하는 값으로 조절 가능
        // 버튼의 글씨체를 볼드 처리
        lbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // 18.0은 원하는 글씨 크기
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
        view.backgroundColor = .white
        //키보드 세팅
        
        NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardWillHide(_:)),
                                                name: UIResponder.keyboardWillHideNotification,
                                                object: nil)
        NotificationCenter.default.addObserver(self,
                                                selector: #selector(keyboardWillShow(_:)),
                                                name: UIResponder.keyboardWillShowNotification,
                                                object: nil)
        
        //화면 크기 설정
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let paddingwidthSize = screenSize.width * 0.1
        
        // 색 설정
        view.backgroundColor = backgroundcolor
        mkoklabelbutton.backgroundColor = hubRedColor
        
        
        // title
        maketitleLabel.text = "회원가입"
        maketitleLabel.font = UIFont.systemFont(ofSize: 20)
        maketitleLabel.frame = CGRect(x: 0, y: 50, width: widthSize, height: 40)
        maketitleLabel.center.x = screenSize.width / 2
        maketitleLabel.layer.cornerRadius = 10.0
        maketitleLabel.layer.borderWidth = 1.0
        maketitleLabel.layer.borderColor = UIColor.gray.cgColor
        maketitleLabel.textColor = UIColor.black
        
        maketitleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(maketitleLabel)
        
        // 사용자 이름 입력 필드 설정
        makeusernameLabel.text = "이름"
        makeusernameLabel.font = UIFont.systemFont(ofSize: 15)
        makeusernameLabel.frame = CGRect(x: paddingwidthSize, y: 100, width: widthSize, height: 30)
        makeusernameLabel.textColor = UIColor.gray
        view.addSubview(makeusernameLabel)
        
        makeusernameTextField.placeholder = ""
        makeusernameTextField.borderStyle = .roundedRect
        makeusernameTextField.keyboardType = .default
        makeusernameTextField.frame = CGRect(x: 0, y: 130, width: widthSize, height: 40)
        makeusernameTextField.center.x = screenSize.width / 2
        view.addSubview(makeusernameTextField)
        
       
        // 아이디 입력 필드 설정
        makeuseridLabel.text = "아이디"
        makeuseridLabel.font = UIFont.systemFont(ofSize: 15)
        makeuseridLabel.frame = CGRect(x: paddingwidthSize, y: 180, width: widthSize, height: 30)
        makeuseridLabel.textColor = UIColor.gray
        view.addSubview(makeuseridLabel)
        
        makeuseridTextField.placeholder = ""
        makeuseridTextField.borderStyle = .roundedRect
        makeuseridTextField.keyboardType = .alphabet
        makeuseridTextField.frame = CGRect(x: 0, y: 210, width: widthSize, height: 40)
        makeuseridTextField.center.x = screenSize.width / 2
        view.addSubview(makeuseridTextField)
        
        // 비밀번호 입력 필드 설정
        makepassword1Label.text = "비밀번호"
        makepassword1Label.font = UIFont.systemFont(ofSize: 15)
        makepassword1Label.frame = CGRect(x: paddingwidthSize, y: 260, width: widthSize, height: 30)
        makepassword1Label.textColor = UIColor.gray
        view.addSubview(makepassword1Label)
        
        makepassword1TextField.placeholder = "비밀번호"
        makepassword1TextField.borderStyle = .roundedRect
        makepassword1TextField.keyboardType = .alphabet
        makepassword1TextField.isSecureTextEntry = true
        makepassword1TextField.frame = CGRect(x: 0, y: 290, width: widthSize, height: 40)
        makepassword1TextField.center.x = screenSize.width / 2
        view.addSubview(makepassword1TextField)
    
        makepassword2TextField.placeholder = "비밀번호 확인"
        makepassword2TextField.borderStyle = .roundedRect
        makepassword2TextField.keyboardType = .alphabet
        makepassword2TextField.isSecureTextEntry = true
        makepassword2TextField.frame = CGRect(x: 0, y: 340, width: widthSize, height: 40)
        makepassword2TextField.center.x = screenSize.width / 2
        view.addSubview(makepassword2TextField)
        
        // 생년월일 이름 입력 필드 설정
        makeuserbirthLabel.text = "생년월일"
        makeuserbirthLabel.font = UIFont.systemFont(ofSize: 15)
        makeuserbirthLabel.frame = CGRect(x: paddingwidthSize, y: 390, width: widthSize, height: 30)
        makeuserbirthLabel.textColor = UIColor.gray
        view.addSubview(makeuserbirthLabel)

        makeuserbirthTextField.placeholder = "ex) yymmdd"
        makeuserbirthTextField.borderStyle = .roundedRect
        makeuserbirthTextField.keyboardType = .numberPad
        makeuserbirthTextField.frame = CGRect(x: 0, y: 420, width: widthSize, height: 40)
        makeuserbirthTextField.center.x = screenSize.width / 2
        view.addSubview(makeuserbirthTextField)
 
        // 휴대폰 입력 필드 설정
        makephoneLabel.text = "전화번호"
        makephoneLabel.font = UIFont.systemFont(ofSize: 15)
        makephoneLabel.frame = CGRect(x: paddingwidthSize, y: 470, width: widthSize, height: 30)
        makephoneLabel.textColor = UIColor.gray
        view.addSubview(makephoneLabel)
        
        makephoneTextField.placeholder = ""
        makephoneTextField.borderStyle = .roundedRect
        makephoneTextField.frame = CGRect(x: 0, y: 500, width: widthSize, height: 40)
        makephoneTextField.center.x = screenSize.width / 2
        makephoneTextField.keyboardType = .numberPad
        view.addSubview(makephoneTextField)
        
        // 이메일 입력 필드 설정
        makeemailLabel.text = "이메일"
        makeemailLabel.font = UIFont.systemFont(ofSize: 15)
        makeemailLabel.frame = CGRect(x: paddingwidthSize, y: 550, width: widthSize, height: 30)
        makeemailLabel.textColor = UIColor.gray
        view.addSubview(makeemailLabel)
        
        makeemailTextField.placeholder = ""
        makeemailTextField.borderStyle = .roundedRect
        makeemailTextField.keyboardType = .emailAddress
        makeemailTextField.frame = CGRect(x: 0, y: 580, width: widthSize, height: 40)
        makeemailTextField.center.x = screenSize.width / 2
        view.addSubview(makeemailTextField)
        
        view.addSubview(mkoklabelbutton)
        mkoklabelbutton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
    }
    //키보드 올라갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillShow(_ sender:Notification){
            self.view.frame.origin.y = -150
    }
    //키보드 내려갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillHide(_ sender:Notification){
            self.view.frame.origin.y = 0
    }
    @IBAction func signButtonTapped(_ sender: UIButton) {

        let username = makeusernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let userid = makeuseridTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let userbirth = makeuserbirthTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let userpwd1 = makepassword1TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let userpwd2 = makepassword2TextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let userphone = makephoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let useremail = makeemailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        // 필수 필드가 비어 있는지 확인합니다.
        if username.isEmpty || userid.isEmpty || userbirth.isEmpty || userpwd1.isEmpty || userphone.isEmpty || useremail.isEmpty {
            // 필수 필드 중 하나라도 비어 있다면 오류 메시지를 표시합니다.
            let alertController = UIAlertController(title: "회원가입 오류", message: "모든 필수 정보를 입력해주세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if userpwd1 != userpwd2 {
            let alertController = UIAlertController(title: "비밀번호 오류", message: "비밀번호가 다릅니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if userbirth == "" {
            let alertController = UIAlertController(title: "", message: "생년월일을 바르게 입력하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
    }
}
