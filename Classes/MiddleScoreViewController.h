//
//  MiddleScoreViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;


@interface MiddleScoreViewController : UIViewController {
	
	InfoViewController *infoViewController;
	UILabel *middleOutput;

}

@property (nonatomic,retain) IBOutlet InfoViewController *infoViewController;
@property (nonatomic, retain) IBOutlet UILabel *middleOutput;


-(IBAction)restartTheGame:(id) sender;
@end
