import UIKit
import CoreData
import DropDown
import MapKit

//배너 클래스
class BannerViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController?
    var currentIndex = 0
    var recipes = ["banner1", "banner2"] // 이미지 파일명 배열
    var timer: Timer?
    var imageView = UIImageView() // 이미지를 표시할 UIImageView

    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController() // 페이지 뷰 컨트롤러 생성 함수 호출
        startTimer() // 타이머 시작
    }

    // 페이지 뷰 컨트롤러 생성
    func createPageViewController() {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self

        if let initialViewController = viewControllerAtIndex(currentIndex) {
            pageController.setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }

        self.pageViewController = pageController
        self.addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.pageViewController!.didMove(toParent: self)

        // 이미지뷰 설정
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }

    // 해당 인덱스의 이미지 뷰 컨트롤러 생성
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if index < 0 || index >= recipes.count {
            return nil
        }

        let imageViewController = UIViewController()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: recipes[index])
        imageViewController.view.addSubview(imageView)

        return imageViewController
    }

    // 이전 페이지의 뷰 컨트롤러 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = currentIndex
        if index == 0 {
            return nil
        }
        index -= 1
        currentIndex = index
        return viewControllerAtIndex(index)
    }

    // 다음 페이지의 뷰 컨트롤러 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = currentIndex
        index += 1
        if index == recipes.count {
            return nil
        }
        currentIndex = index
        return viewControllerAtIndex(index)
    }

    // 타이머 시작 함수
    func startTimer() {
        // 3초마다 이미지 변경을 위한 타이머 시작
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            self.changeImageAutomatically()
        }
    }

    // 자동으로 이미지 변경
    @objc func changeImageAutomatically() {
        // 다음 이미지를 보여주기 위해 currentIndex 업데이트
        currentIndex = (currentIndex + 1) % recipes.count

        // 새로운 뷰 컨트롤러를 가져와서 현재 뷰 컨트롤러로 설정
        if let nextViewController = self.viewControllerAtIndex(currentIndex) {
            self.pageViewController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
