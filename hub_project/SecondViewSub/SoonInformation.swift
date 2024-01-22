import UIKit
import CoreData
import DropDown
import MapKit

// SoonInformation: UITableViewCell을 상속받는 셀 클래스입니다.
class SoonInformation: UITableViewCell {
    //색정보
    let backgroundcolor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)

    // 셀 내부에 포함될 뷰입니다.
    let cellView: UIView = {
        let buttonColor = UIColor(red: 186/255.0, green: 176/255.0, blue: 160/255.0, alpha: 1.0)
        let view = UIView()
        view.backgroundColor = buttonColor
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 날짜를 나타내는 라벨입니다.
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "순"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 초기화 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 뷰 구성을 설정하는 메서드 호출
        setupView()
    }

    // 뷰 구성을 설정하는 메서드
    func setupView() {
        addSubview(cellView) // cellView를 셀에 추가
        cellView.addSubview(dayLabel) // dayLabel을 cellView에 추가
        self.selectionStyle = .none // 선택 스타일을 .none으로 설정
        
        // Auto Layout 제약조건 설정
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        // dayLabel의 크기 및 위치 제약조건 설정
        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
    }
    
    // 인터페이스 빌더에서 이 셀을 사용할 때 호출되는 초기화 메서드
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
