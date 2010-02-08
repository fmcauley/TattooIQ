//
//  TwitterViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/8/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FinalViewController;




@interface TwitterViewController : UIViewController {
	
	FinalViewController *finalViewController;

}

@property (nonatomic, retain) IBOutlet FinalViewController *finalViewController;

-(IBAction)goBackOneScreen:(id)sender;

@end
