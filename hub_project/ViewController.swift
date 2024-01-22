import UIKit
import CoreData
import DropDown
import MapKit

class ViewController: UIViewController {
    //로그인 버튼
    
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    // 색 번호
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    // 이미지 추가
    let imagelogo = UIImage(named: "hub_logo_zero")
    
    let lbutton: UIButton = {
        let screenSize = UIScreen.main.bounds.size
        let widthSize = screenSize.width * 0.8
        let lbutton = UIButton(frame: CGRect(x: 0, y: 610, width: widthSize, height: 55))
        lbutton.setTitle("로그인", for: .normal)
        lbutton.setTitleShadowColor(UIColor.black, for: .normal)
        lbutton.center.x = screenSize.width / 2
        // 버튼의 모서리를 둥글게 설정
        lbutton.layer.cornerRadius = 20  // 25는 반지름 값으로 원하는 값으로 조절 가능
        // 버튼의 글씨체를 볼드 처리
        lbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)  // 18.0은 원하는 글씨 크기
        
        return lbutton
    }()

    let mklabelbutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입 |", for: .normal)
        button.frame = CGRect(x: 80, y: 700, width: 100, height: 15)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()
    
    let idlabelbutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("아이디 찾기 |", for: .normal)
        button.frame = CGRect(x: 150, y: 700, width: 100, height: 15)
        button.setTitleColor(UIColor.red, for: .normal)
        // 버튼의 다른 속성 설정
        return button
    }()
    let pwlabelbutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비밀번호 찾기", for: .normal)
        button.frame = CGRect(x: 235, y: 700, width: 100, height: 15)
        button.setTitleColor(UIColor.red, for: .normal)
        // 버튼의 다른 속성 설정
        return button
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
        // 이미지 뷰
        let imageView = UIImageView(image: imagelogo)
        imageView.frame = CGRect(x: 50, y: 100, width: widthSize * 0.8, height: widthSize * 0.8)
        imageView.center.x = screenSize.width / 2
        // 라벨 생성
        let useridLabel = UILabel()
        let userpwLabel = UILabel()
        // 이미지 뷰를 화면에 추가합니다.
        self.view.addSubview(imageView)
        
        view.addSubview(mklabelbutton)
        view.addSubview(idlabelbutton)
        view.addSubview(pwlabelbutton)
        view.addSubview(lbutton)
        
        // 사용자 이름 입력 필드 설정
        useridLabel.text = "아이디"
        useridLabel.font = UIFont.systemFont(ofSize: 15)
        useridLabel.frame = CGRect(x: 45, y: 360, width: 200, height: 30)
        useridLabel.textColor = UIColor.black
        view.addSubview(useridLabel)
        
        usernameTextField.placeholder = "아이디"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.frame = CGRect(x: 0, y: 390, width: widthSize, height: 55)
        usernameTextField.center.x = screenSize.width / 2
        // 그림자 설정
        usernameTextField.layer.shadowColor = UIColor.black.cgColor
        usernameTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
        usernameTextField.layer.shadowOpacity = 0.5
        usernameTextField.layer.shadowRadius = 1
        view.addSubview(usernameTextField)

        // 비밀번호 입력 필드 설정
        userpwLabel.text = "비밀번호"
        userpwLabel.font = UIFont.systemFont(ofSize: 15)
        userpwLabel.frame = CGRect(x: 45, y: 470, width: 200, height: 30)
        userpwLabel.textColor = UIColor.black
        view.addSubview(userpwLabel)
        
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 0, y: 500, width: widthSize, height: 55)
        passwordTextField.center.x = screenSize.width / 2
        // 그림자 설정
        passwordTextField.layer.shadowColor = UIColor.black.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
        passwordTextField.layer.shadowOpacity = 0.5
        passwordTextField.layer.shadowRadius = 0.5
        view.addSubview(passwordTextField)
        
        mklabelbutton.addTarget(self, action: #selector(labelButtonTapped), for: .touchUpInside) // 회원가입
        idlabelbutton.addTarget(self, action: #selector(label2ButtonTapped), for: .touchUpInside) // 아이디 찾기
        pwlabelbutton.addTarget(self, action: #selector(label3ButtonTapped), for: .touchUpInside) // 비밀번호 찾기
        lbutton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) // 로그인
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 색상 설정
        view.backgroundColor = backgroundcolor
//        usernameTextField.backgroundColor = backgroundcolor
//        passwordTextField.backgroundColor = backgroundcolor
        lbutton.backgroundColor = hubRedColor
        mklabelbutton.setTitleColor(hubRedColor, for: .normal)
        idlabelbutton.setTitleColor(hubRedColor, for: .normal)
        pwlabelbutton.setTitleColor(hubRedColor, for: .normal)
    }
    //키보드 올라갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillShow(_ sender:Notification){
            self.view.frame.origin.y = -150
    }
    //키보드 내려갔다는 알림을 받으면 실행되는 메서드
    @objc func keyboardWillHide(_ sender:Notification){
            self.view.frame.origin.y = 0
    }
    // 회원가입 버튼 이벤트
    @IBAction func labelButtonTapped(_ sender: UIButton) {
        present(MakeIDViewController(), animated:false)
    }
    
    // 아이디 찾기 버튼 이벤트
    @IBAction func label2ButtonTapped(_ sender: UIButton) {
        present(FindIDViewController(), animated:false)
    }
    // 비밀번호 찾기 버튼 이벤트
    @IBAction func label3ButtonTapped(_ sender: UIButton) {
        present(FindPWViewController(), animated:false)
    }

    @objc func didTapButton() {
        // 사용자가 입력한 사용자 이름과 비밀번호를 가져옴
        if let username = usernameTextField.text, let password = passwordTextField.text {
            // 로그인 로직을 구현하거나 처리할 내용을 추가하세요.
            if username == "" && password == "" {
                // 로그인 성공
                print("로그인 성공")
                // Creat and presnet tap bar controller
                
                let tabBarVC = UITabBarController()
                let appearance = UINavigationBarAppearance()
                // configureWith_______ : 그림자 값을 생성한다
                // 반투명한 그림자를 백그라운드 앞에다 생성 (반투명한 그림자를 한겹을 쌓는다)
                appearance.configureWithDefaultBackground()
                        
                let vc1 = UINavigationController(rootViewController: FristViewController())
                let vc2 = UINavigationController(rootViewController: SecondViewController())
                let vc3 = UINavigationController(rootViewController: ThirdViewController())
                let vc4 = UINavigationController(rootViewController: FourthViewController())
                
                vc1.title = "홈"
                vc2.title = "명 단"
                vc3.title = "전/입출"
                vc4.title = "프로필"
                //vc5.title = "setting"
                
                tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
                
                guard let items = tabBarVC.tabBar.items else {
                    return
                }
                
                let images = ["house","star","person.fill.checkmark","person.circle"]
                
                for x in 0..<items.count {
                    items[x].image = UIImage(systemName: images[x])
                }
                
                tabBarVC.tabBar.backgroundColor = .white
                
                tabBarVC.modalPresentationStyle = .fullScreen
                present(tabBarVC, animated: true)
            } else {
                // 로그인 실패
                print("로그인 정보가 틀렸습니다")
            }
        }

    }
}
