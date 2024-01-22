import UIKit
import CoreData
import DropDown

class SoonRealInfotmation: UIViewController {
    
    // 색 번호
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
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
    var userbirthTextField = UITextField()
    
    let usernameLabel = UILabel()
    let userphoneLabel = UILabel()
    let userageLabel = UILabel()
    let userbirthLabel = UILabel()
    let usersexLabel = UILabel()
    
    var radioman = UIButton()
    var radiofemale = UIButton()
    
    // 수정하기 생성
    let correctionlbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 700, width: widthSize, height: 40))
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
        let lbutton = UIButton(frame: CGRect(x: 0, y: 700, width: widthSize, height: 40))
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
        
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hubRedColor], for: .normal)

        navigationItem.leftBarButtonItem = backButton
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
        
        usernameTextField.text = "서민이"// ex) 예시
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.frame = CGRect(x: paddingtextwidthSize, y: 400, width: 250, height: 40)
        view.addSubview(usernameTextField)
        usernameTextField.isEnabled = false
        
        // 사용자 이름 입력 라벨
        userphoneLabel.text = "전화번호"
        userphoneLabel.font = UIFont.systemFont(ofSize: 15)
        userphoneLabel.frame = CGRect(x: paddinglabelwidthSize, y: 460, width: 200, height: 30)
        userphoneLabel.textColor = UIColor.black
        view.addSubview(userphoneLabel)
        
        userphoneTextField.text = "01030202016"// ex) 예시
        userphoneTextField.borderStyle = .roundedRect
        userphoneTextField.keyboardType = .numberPad
        userphoneTextField.frame = CGRect(x: paddingtextwidthSize, y: 460, width: 250, height: 40)
        view.addSubview(userphoneTextField)
        userphoneTextField.isEnabled = false
        
        // 사용자 이름 입력 라벨
        userageLabel.text = "기수"
        userageLabel.font = UIFont.systemFont(ofSize: 15)
        userageLabel.frame = CGRect(x: paddinglabelwidthSize, y: 520, width: 200, height: 30)
        userageLabel.textColor = UIColor.black
        view.addSubview(userageLabel)
        
        userageTextField.text = "33기"// ex) 예시
        userageTextField.borderStyle = .roundedRect
        userageTextField.frame = CGRect(x: paddingtextwidthSize, y: 520, width: 250, height: 40)
        view.addSubview(userageTextField)
        userageTextField.isEnabled = false
        
        // 사용자 이름 입력 라벨
        userbirthLabel.text = "생년월일"
        userbirthLabel.font = UIFont.systemFont(ofSize: 15)
        userbirthLabel.frame = CGRect(x: paddinglabelwidthSize, y: 580, width: 200, height: 30)
        userbirthLabel.textColor = UIColor.black
        view.addSubview(userbirthLabel)
        
        userbirthTextField.text = "970204"// ex) 예시
        userbirthTextField.borderStyle = .roundedRect
        userbirthTextField.keyboardType = .numberPad
        userbirthTextField.frame = CGRect(x: paddingtextwidthSize, y: 580, width: 250, height: 40)
        view.addSubview(userbirthTextField)
        userbirthTextField.isEnabled = false
        
        // 사용자 성별 입력 라벨
        usersexLabel.text = "성별"
        usersexLabel.font = UIFont.systemFont(ofSize: 15)
        usersexLabel.frame = CGRect(x: paddinglabelwidthSize, y: 640, width: 200, height: 30)
        usersexLabel.textColor = UIColor.black
        view.addSubview(usersexLabel)
        
        radioman.isEnabled = false
        radiofemale.isEnabled = false
        configureRadioButton(radioman, position: CGPoint(x: paddingtextwidthSize + 10, y: 640), title: "남자")
        configureRadioButton(radiofemale, position: CGPoint(x: paddingtextwidthSize + 80, y: 640), title: "여자")
        
        view.addSubview(correctionlbutton)
        view.addSubview(updatelbutton)
        updatelbutton.isHidden = true
        correctionlbutton.addTarget(self, action: #selector(correctionButtonTapped), for: .touchUpInside)
        updatelbutton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    //키보드 올라갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillShow(_ sender:Notification){
            self.view.frame.origin.y = -150
    }
    //키보드 내려갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillHide(_ sender:Notification){
            self.view.frame.origin.y = 0
    }
    func configureRadioButton(_ button: UIButton, position: CGPoint, title: String) {
        // Set the frame for the radio button
        button.frame = CGRect(origin: position, size: CGSize(width: 20, height: 20))

        // Set the radio button's appearance and target
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)

        button.tintColor = hubRedColor
        button.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
        
        // Add the radio button to the view
        view.addSubview(button)

        // Create a label for the text
        let label = UILabel(frame: CGRect(x: position.x + 30, y: position.y - 5, width: 100, height: 30))
        label.text = title
        label.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(label)
    }
    @objc func radioButtonTapped(_ sender: UIButton) {
        // Unselect all buttons
        radioman.isSelected = false
        radiofemale.isSelected = false

        // Select the tapped button
        sender.isSelected = true
    }
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    //  수정하기 이벤트
    @IBAction func correctionButtonTapped(_ sender: UIButton) {
        usernameTextField.isEnabled = true
        userphoneTextField.isEnabled = true
        userageTextField.isEnabled = true
        userbirthTextField.isEnabled = true
        radioman.isEnabled = true
        radiofemale.isEnabled = true
        correctionlbutton.isHidden = true
        updatelbutton.isHidden = false

    }
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        usernameTextField.isEnabled = false
        userphoneTextField.isEnabled = false
        userageTextField.isEnabled = false
        userbirthTextField.isEnabled = false
        radioman.isEnabled = false
        radiofemale.isEnabled = false
        correctionlbutton.isHidden = false
        updatelbutton.isHidden = true
    }
}
