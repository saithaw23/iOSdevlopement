//
//  OnboardingViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var screens:[OnboardingScreens] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == screens.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screens = [
            OnboardingScreens(title: "Discover Your Favourites", description: "Explore a wide variety of cuisines and dishes from your favorite restaurants. Whether you're craving sushi, pizza, or a hearty burger, we have it all at your fingertips.", image: .girleating) ,
            OnboardingScreens(title: "Quick and Easy Ordering", description: "Place your order in just a few taps. Customize your meal exactly the way you like it and enjoy a hassle-free checkout process.", image: .eatingFood) ,
            OnboardingScreens(title: "Track Your Delivery", description: "Stay updated with real-time tracking. Know exactly when your order will arrive, so you can enjoy your meal fresh and hot.", image: .searchFood)
        ]

    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == screens.count - 1 {
            let loginPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "loginNC")as! UINavigationController
            loginPage.modalPresentationStyle = .fullScreen
            present(loginPage, animated: true, completion: nil)
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! OnboardingCollectionViewCell
        cell.setup(screens[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}
