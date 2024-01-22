import UIKit
import CoreData
import DropDown
import MapKit

class SecondViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {

//    let backgroundcolor = UIColor(red: 255/255, green: 252/255, blue: 247/255, alpha: 1.0)
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
//    let hubRedColor = UIColor(red: 217/255, green: 30/255, blue: 65/255, alpha: 1.0)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    let buttonColor = UIColor(red: 186/255.0, green: 176/255.0, blue: 160/255.0, alpha: 1.0)

    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        return tv
    }()
    
    var sectionHidden = Array(repeating: true, count: 20)//[true, true, true]  // 각 섹션의 표시 여부를 나타내는 배열 (초기에는 모두 보이도록 설정)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = backgroundcolor
        
        // 배너
        let mainbannerView = UIView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 180))
        mainbannerView.layer.cornerRadius = 10  // 상단 좌우 라운드 설정
        mainbannerView.backgroundColor = hubRedColor
        
        // 이미지 뷰
        let imageView = UIImageView(frame: CGRect(x: 250, y: 30, width: 120, height: 120))
        imageView.image = UIImage(named: "default_person") // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        mainbannerView.addSubview(imageView)
        
        // 이름
        let namelabel = UILabel(frame: CGRect(x: 25, y: 40, width: mainbannerView.frame.width - 100, height: 30))
        namelabel.text = "서민이"
        namelabel.textColor = .white
        namelabel.font = UIFont.boldSystemFont(ofSize: 28)
        namelabel.numberOfLines = 0 // Allow multiple lines if needed
        mainbannerView.addSubview(namelabel)
        
        // 직책
        let jeacklabel = UILabel(frame: CGRect(x: 25, y: 80, width: mainbannerView.frame.width - 100, height: 30))
        jeacklabel.text = "다락방장"
        jeacklabel.textColor = .white
        jeacklabel.font = UIFont.boldSystemFont(ofSize: 18)
        jeacklabel.numberOfLines = 0 // Allow multiple lines if needed
        mainbannerView.addSubview(jeacklabel)
        
        // 소속
        let sosocklabel = UILabel(frame: CGRect(x: 25, y: 110, width: mainbannerView.frame.width - 100, height: 30))
        sosocklabel.text = "허브"
        sosocklabel.textColor = .white
        sosocklabel.font = UIFont.boldSystemFont(ofSize: 18)
        sosocklabel.numberOfLines = 0 // Allow multiple lines if needed
        mainbannerView.addSubview(sosocklabel)
        
        view.addSubview(mainbannerView)
        
    }
    
    // 테이블 뷰를 설정하는 메서드입니다.
    func setupTableView() {
        // 델리게이트와 데이터 소스를 현재 뷰 컨트롤러(self)로 설정합니다.
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = backgroundcolor
        
        // "cellId" 식별자로 SoonInformation 클래스를 등록합니다.
        tableview.register(SoonInformation.self, forCellReuseIdentifier: "cellId")
        
        // 테이블 뷰를 현재 뷰에 추가합니다.
        view.addSubview(tableview)
        
        // Auto Layout을 사용하여 테이블 뷰의 위치 및 크기를 설정합니다.
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300) ,
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }

    // 섹션별 테이블 뷰의 행 개수를 반환하는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionHidden.count > section && !sectionHidden[section] {
            return 7 // 해당 섹션이 열려있으면 7개의 행 반환
        } else {
            return 0 // 해당 섹션이 닫혀있으면 0개의 행 반환
        }
    }

    // 특정 indexPath에 대한 테이블 뷰 셀을 반환하는 메서드입니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SoonInformation
        
        cell.backgroundColor = .white
        cell.dayLabel.text = "\(indexPath.row + 1) 번 순"
        
        return cell
    }

    // 섹션 개수를 반환하는 메서드
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    // 특정 섹션의 헤더를 설정하는 메서드
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Check if the section is within the valid range
        guard section < sectionHidden.count else {
            return nil
        }
        
        // 섹션 헤더 뷰를 생성하고 초기화합니다.
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70))
        headerView.backgroundColor = sectionHidden[section] ? buttonColor : .white  // 섹션 상태에 따라 배경색 설정
        headerView.layer.cornerRadius = 10  // 상단 좌우 라운드 설정

        // 그림자 설정
        headerView.layer.shadowColor = UIColor.gray.cgColor
        headerView.layer.shadowOpacity = 0.5
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowRadius = 4
        
        // 섹션 정보를 표시할 라벨을 생성하고 설정합니다.
        let label = UILabel(frame: CGRect(x: 15, y: 25, width: tableView.frame.size.width - 30, height: 20))
        label.text = "\(section) 번 다락방"  // 섹션 번호를 텍스트로 표시
        label.textColor = sectionHidden[section] ? .white : hubRedColor  // 섹션 상태에 따라 텍스트 색상 설정
        headerView.addSubview(label)  // 라벨을 섹션 헤더에 추가합니다.

        // 헤더 뷰에 탭 제스처를 추가하고, 해당 섹션 번호를 태그로 설정하여 구분합니다.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleSection(_:)))
        headerView.addGestureRecognizer(tapGestureRecognizer)
        headerView.tag = section  // 섹션 번호를 태그로 설정

        return headerView  // 구성된 섹션 헤더 뷰 반환
    }
    var currentlyOpenSection: Int?
    
    // 섹션을 토글하는 메서드
    @objc func toggleSection(_ sender: UITapGestureRecognizer) {
        if let section = sender.view?.tag {
            // 현재 열려있는 섹션이 있고, 현재 선택한 섹션이 아닌 경우 이전 섹션을 닫기
            if let openSection = currentlyOpenSection, openSection != section {
                sectionHidden[openSection] = true
                tableview.reloadSections(IndexSet(integer: openSection), with: .fade)
            }

            // 선택한 섹션 열기/닫기
            sectionHidden[section] = !sectionHidden[section]
            tableview.reloadSections(IndexSet(integer: section), with: .fade)

            // 열린 섹션 기억
            if !sectionHidden[section] {
                currentlyOpenSection = section
            } else {
                currentlyOpenSection = nil
            }
        }
    }

    // 특정 indexPath에 대한 테이블 뷰의 행 높이를 반환하는 메서드
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70  // 섹션 헤더의 높이
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    // 셀을 클릭했을 때 수행할 동작을 처리하는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 화면 전환
        let SoonInformationViewController = SoonInformationViewController()
        navigationController?.pushViewController(SoonInformationViewController, animated: true)
    }
    
}
