

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
-(IBAction)updateFacebook;

@end
