//
//  Tattoo_IQ_QuizViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 12/31/09.
//  Copyright Frank McAuley LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoViewController;


@interface Tattoo_IQ_QuizViewController : UIViewController {
	
	InfoViewController *infoViewController;
	NSTimer *timer;
	

}


@property (nonatomic, strong) IBOutlet InfoViewController *infoViewController;


@end

