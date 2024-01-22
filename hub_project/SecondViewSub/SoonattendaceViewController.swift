
import UIKit

class SoonattendaceViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let hubRedColor = UIColor(red: CGFloat(0x8C) / 255.0, green: CGFloat(0x5B) / 255.0, blue: CGFloat(0x3F) / 255.0, alpha: 1.0)
    let backgroundColor = UIColor(red: CGFloat(242)/255, green: CGFloat(236)/255, blue: CGFloat(228)/255, alpha: 1)
    
    var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(goBack))
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: hubRedColor], for: .normal)

        navigationItem.leftBarButtonItem = backButton
        
        // UICollectionViewFlowLayout 인스턴스 생성
        let layout = UICollectionViewFlowLayout()
        // 각 셀의 크기 설정
        layout.itemSize = CGSize(width: CGFloat(view.frame.size.width / 4) - 10, height: (view.frame.size.width / 4) - 10)
        // 각 셀의 위아래 간격 설정
        layout.minimumLineSpacing = 10
        // 각 셀의 좌우 간격 설정
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = backgroundColor
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 셀의 개수
        return 52
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 각 셀에 대한 설정
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        // 테두리 스타일 및 색상 설정
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 10  // 조절 가능한 라운드 값
        // 셀의 내용이 부분적으로 가려지지 않도록 콘텐트 뷰에 테두리 설정
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 1
        
        // UILabel을 생성하여 셀에 추가
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: cell.contentView.frame.width, height: 20))
        label.textAlignment = .center
        label.text = " \(indexPath.item + 1) 주차"
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        cell.contentView.addSubview(label)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: cell.contentView.frame.height))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = hubRedColor
        imageView.image = UIImage(systemName: "checkmark.circle")
        imageView.contentMode = .center
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 화면 전환
        let SoonAttendanceDetailView = SoonAttendanceDetailView()
        navigationController?.pushViewController(SoonAttendanceDetailView, animated: true)
    }
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
}
