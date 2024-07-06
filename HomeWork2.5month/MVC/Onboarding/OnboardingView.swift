//
//  OnboardingView.swift
//  HomeWork2.5month
//
//  Created by Aijan Saadatova on 1/7/24.
//

import UIKit

var currentPage = 0

class OnboardingView: UIViewController  {
    
    var structOnboarding: [StructOnboarding] = []
    
    private lazy var onboardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseID)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var uiPageControl: UIPageControl = {
        let view = UIPageControl()
        view.currentPage = 0
        view.numberOfPages = 3
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var skipButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("skip", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(skipbuttonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Next", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 22
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
        setupButtons()
        setupParamets()
        onboardingCollectionView.reloadData()
        DispatchQueue.main.async {
            self.scrollToCurrentPage(animated: false)
        }
                
    }
    
    func test() {
        guard structOnboarding.count > currentPage + 0 else { return }
        
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: IndexPath(item: currentPage + 0, section: 0), at: .bottom, animated: true)
        onboardingCollectionView.isPagingEnabled = true
    }
    
    private func setupConstrains() {
        view.addSubview(onboardingCollectionView)
        view.addSubview(uiPageControl)
        NSLayoutConstraint.activate([
            onboardingCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            onboardingCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            onboardingCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            onboardingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            uiPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            uiPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupParamets() {
        structOnboarding = [
            StructOnboarding(image: "first", label: "Welcome to The Note", secondLabel: "Welcome to The Note – your new companion for tasks, goals, health – all in one place. Let's get started!."),
            StructOnboarding(image: "second", label: "Set Up Your Profile", secondLabel: "Now that you're with us, let's get to know each other better. Fill out your profile, share your interests, and set your goals."),
            StructOnboarding(image: "third", label: "Dive into The Note", secondLabel: "You're fully equipped to dive into the world of The Note. Remember, we're here to assist you every step of the way. Ready to start? Let's go!")
        ]
        onboardingCollectionView.reloadData()
    }
    
    private func setupButtons() {
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            skipButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            skipButton.heightAnchor.constraint(equalToConstant: 42),
            skipButton.widthAnchor.constraint(equalToConstant: 173),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 42),
            nextButton.widthAnchor.constraint(equalToConstant: 173)
        ])
    }
    
    @objc private func nextButtonTapped() {
        UserDefaults.standard.set(true, forKey: "Onboarding_cell")
        if currentPage < structOnboarding.count - 1 {
            currentPage += 1
            scrollToCurrentPage(animated: true)
        } else {
            transitionToHomeView()
        }
    }
    
    private func scrollToCurrentPage(animated: Bool) {
        let indexPath = IndexPath(item: currentPage, section: 0)
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: animated)
        onboardingCollectionView.isPagingEnabled = true
        uiPageControl.currentPage = currentPage
    }
    
    private func transitionToHomeView() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func skipbuttonTapped() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return structOnboarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseID, for: indexPath) as! OnboardingCell
        cell.configure(with: structOnboarding[indexPath.row])
        return cell
    }
}

extension OnboardingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSet = scrollView.contentOffset.x
        
        let page = (contentOffSet / view.frame.width)
        
        switch page {
        case 0.0:
            uiPageControl.currentPage = 0
            currentPage = 0
        case 1.0:
            uiPageControl.currentPage = 1
            currentPage = 1
        case 2.0:
            uiPageControl.currentPage = 2
            currentPage = 2
        default:
            ()
        }
    }
}

