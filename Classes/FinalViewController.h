

#import <UIKit/UIKit.h>
@class Quiz_GameViewController;
@class InfoViewController;
@class HellCityAppsViewController;
@class TwitterViewController;



@interface FinalViewController : UIViewController {
	
	InfoViewController * infoViewController;
	Quiz_GameViewController *quiz_GameViewController;
	HellCityAppsViewController *hellCityViewController;
	TwitterViewController *twitterViewController;
	UILabel *finalScore;

}

@property (nonatomic, retain) IBOutlet InfoViewController *infoViewController;
@property (nonatomic, retain) IBOutlet Quiz_GameViewController *quiz_GameViewController;
@property (nonatomic, retain) IBOutlet HellCityAppsViewController *hellCityViewController;
@property (nonatomic, retain) IBOutlet TwitterViewController *twitterViewController;
@property (nonatomic, retain) IBOutlet UILabel *finalScore;

-(IBAction)restartTheGame:(id)sender;
-(IBAction)goToWebSite:(id)sender;
-(IBAction)updateTwitter:(id)sender;

@end
