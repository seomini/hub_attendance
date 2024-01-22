import UIKit
import CoreData
import DropDown
import MapKit

//순 정보 상세
class SoonInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)

    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundcolor

        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = hubRedColor
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }

        // 테이블 뷰 프레임 설정
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = backgroundcolor
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // 이미지 뷰 생성 및 설정
        let imageView = UIImageView(frame: CGRect(x: 30, y: 10, width: 80, height: 80))
        imageView.image = UIImage(named: "default_person")  // 이미지 설정
        imageView.contentMode = .scaleAspectFit  // 이미지 콘텐츠 모드 설정
        cell.contentView.addSubview(imageView)

        // 라벨 생성 및 설정
        let label = UILabel(frame: CGRect(x: 120, y: 10, width: cell.frame.width - 60, height: 30))
        label.text = "등록 교인"
        cell.contentView.addSubview(label)

        cell.selectionStyle = .none  // 클릭 시 색 변화 없음

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    

        let soonInfoDetailVC = SoonInformationDetailViewController()
        if let sheet = soonInfoDetailVC.sheetPresentationController {
            sheet.detents = [.medium(), .medium()]
        }
        self.present(soonInfoDetailVC, animated: true, completion: nil) // 뷰 컨트롤러 표시
    }
}
