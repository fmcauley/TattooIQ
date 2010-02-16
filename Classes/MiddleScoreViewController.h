//
//  MiddleScoreViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;
@class HellCityAppsViewController;
@class TwitterViewController;


@interface MiddleScoreViewController : UIViewController {
	
	IBOutlet InfoViewController *infoViewController;
	IBOutlet HellCityAppsViewController *hellCityViewController;
	IBOutlet TwitterViewController *twitterViewController;
	UILabel *middleOutput;

}


@property (nonatomic, retain) IBOutlet UILabel *middleOutput;



-(IBAction)restartTheGame:(id)sender;
-(IBAction)goToWebSite:(id)sender;
-(IBAction)updateTwitter:(id)sender;

@end
