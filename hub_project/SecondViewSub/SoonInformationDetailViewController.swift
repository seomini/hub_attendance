import UIKit
import CoreData
import DropDown
import MapKit

//순정보
class SoonInformationDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //색정보
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    
    let subColor = UIColor(red: CGFloat(0x5E) / 255.0, green: CGFloat(0x54) / 255.0, blue: CGFloat(0x48) / 255.0, alpha: 1.0)
    let mainColor = UIColor(red: CGFloat(0x40) / 255.0, green: CGFloat(0x34) / 255.0, blue: CGFloat(0x2A) / 255.0, alpha: 1.0)
    
    let data = ["􁕜 순보고서", "􀉩 순원조회"]
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 테이블 뷰 프레임 설정
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // 테이블 뷰를 뷰에 추가
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.selectionStyle = .none  // 클릭 시 색상 변경 없음
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택한 항목: \(data[indexPath.row])")
        if indexPath.row == 0 { // "순보고서" 항목이 선택된 경우
            let tabBarVC = UITabBarController()
            
            let vc1 = UINavigationController(rootViewController: SoonRealInfotmation())
            let vc2 = UINavigationController(rootViewController: SoonattendaceViewController())
            
            vc1.title = "순원 정보"
            vc2.title = "출결"
            
            // Set view controllers for the tab bar
            tabBarVC.setViewControllers([vc1, vc2], animated: false)
            
            // Customize tab bar item appearance
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 15.0),
                .foregroundColor: subColor
            ]
            
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 15.0), 
                .foregroundColor: mainColor
            ]
            
            UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
            
            tabBarVC.tabBar.backgroundColor = .white
            
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true)
        }
    }

}
