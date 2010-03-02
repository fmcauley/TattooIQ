//
//  TestImageAsButton.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 1/11/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;


@interface TestImageAsButton : UIViewController {
	
	 InfoViewController *info;
	 NSTimer *timer;
	
}

@property(nonatomic, retain) IBOutlet InfoViewController *info;
@property(nonatomic, retain) NSTimer *timer;

@end
