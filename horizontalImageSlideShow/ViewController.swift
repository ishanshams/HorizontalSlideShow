//
//  ViewController.swift
//  horizontalImageSlideShow
//
//  Created by Ishan Shams on 8/8/16.
//  Copyright © 2016 Ishan Shams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        //2
        textView.textAlignment = .Center
        textView.text = "TEST 1: Description"
        textView.textColor = .blackColor()
        
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "Slide 1")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide 2")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Slide 3")
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Slide 4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "moveToNextPage", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView){
    
    // Test the offset and calculate the current page after scrolling ends
    let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
    let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
    // Change the indicator
    self.pageControl.currentPage = Int(currentPage);
    // Change the text accordingly
    if Int(currentPage) == 0{
    textView.text = "TEST 1: Description"
    }else if Int(currentPage) == 1{
    textView.text = "TEST 2: Description"
    }else if Int(currentPage) == 2{
    textView.text = "TEST 3: Description"
    }else{
    textView.text = "TEST 4: Description"
    // Show the "Let's Start" button in the last slide (with a fade in animation)
    
    }
    }
    
    func moveToNextPage (){
        
        // Move to next page
        let pageWidth:CGFloat = CGRectGetWidth(self.scrollView.frame)
        let maxWidth:CGFloat = pageWidth * 4
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
            // Each time you move back to the first slide, you may want to hide the button, uncomment the animation below to do so
            //            UIView.animateWithDuration(0.5, animations: { () -> Void in
            //                self.startButton.alpha = 0.0
            //            })
        }
        self.scrollView.scrollRectToVisible(CGRectMake(slideToX, 0, pageWidth, CGRectGetHeight(self.scrollView.frame)), animated: true)

    }

}

