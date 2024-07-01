//
//  OnboardingView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 30/6/24.
//

//import UIKit
//import SnapKit
//
//class OnboardingViewController: UIViewController {
//    
//    private var pages = [UIViewController]()
//    
//    weak var viewOutput: OnboardingViewOutput!
//    
//    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput!) {
//        self.pages = pages
//        self.viewOutput = viewOutput
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private let pageViewController: UIPageViewController = {
//        let view = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
//        view.dataSource = self
//        view.delegate = self
//        
//        view.setViewControllers([pages.first], direction: .forward, animated: true)
//        view.didMove(toParent: self)
//        addChild(pageViewController)
//        
//        return view
//    }()
//    
//    private let skipBtn = ButtonView()
//    
//    private let nextBtn: ButtonView = {
//        let btn = ButtonView()
//        btn.skipBtn.setTitle("Next", for: .normal)
//        btn.skipBtn.setTitleColor(.white, for: .normal)
//        btn.layer.cornerRadius = 18
//        btn.backgroundColor = .blue
//        return btn
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        setupUI()
//    }
//    
//    private func setupUI() {
//        view.addSubview(skipBtn)
//        view.addSubview(nextBtn)
//        
//        skipBtn.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
//            make.leading.equalTo(view).offset(16)
//            //make.trailing.equalTo(nextBtn).offset(-10)
//            make.width.equalTo(180)
//            make.height.equalTo(40)
//        }
//        
//        nextBtn.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
//            make.trailing.equalTo(view).offset(-16)
//            //make.leading.equalTo(skipBtn).offset(10)
//            make.height.equalTo(40)
//            make.width.equalTo(180)
//        }
//    }
//    
//}
//
//extension OnboardingViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        return UIViewController()
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return UIViewController()
//    }
//}
//
//extension OnboardingViewController: UIPageViewControllerDelegate {
//    
//}

import Foundation

struct structOnboarding {
    var image: String
    var label: String
    var secondLabel: String
}
