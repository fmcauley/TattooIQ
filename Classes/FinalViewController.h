//
//  FinalViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/7/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoViewController;
@class Quiz_GameViewController;
@class HellCityAppsViewController;

//The Quiz_GameViewController will be used to obtain the final score to present to the screen

@interface FinalViewController : UIViewController {
	
	InfoViewController * infoViewController;
	Quiz_GameViewController *quiz_GameViewController;
	HellCityAppsViewController *hellCityViewController;
	UILabel *finalScore;

}

@property (nonatomic, retain) IBOutlet InfoViewController *infoViewController;
@property (nonatomic, retain) IBOutlet Quiz_GameViewController *quiz_GameViewController;
@property (nonatomic, retain) IBOutlet HellCityAppsViewController *hellCityViewController;
@property (nonatomic, retain) IBOutlet UILabel *finalScore;

-(IBAction)restartTheGame:(id)sender;
-(IBAction)goToWebSite:(id)sender;

@end
