//
//  LowScoreViewConroller.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;
@class HellCityAppsViewController;
@class TwitterViewController;
#import "FacebookAPI.h"


@interface LowScoreViewConroller : UIViewController {
	IBOutlet InfoViewController *infoViewController;
	IBOutlet HellCityAppsViewController *hellCityViewController;
	IBOutlet TwitterViewController *twitterViewController;
	IBOutlet FacebookAPI *face;
	UILabel *lowScore;

}


@property (nonatomic,retain) IBOutlet UILabel *lowScore;

-(IBAction)restartTheGame;
-(IBAction)goToWebSite;
-(IBAction)updateTwitter;
-(IBAction)updateFacebook;

@end
