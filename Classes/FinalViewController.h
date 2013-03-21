

#import <UIKit/UIKit.h>

@class InfoViewController;
@class HellCityAppsViewController;
@class TwitterViewController;




@interface FinalViewController : UIViewController {
	
	IBOutlet InfoViewController * infoViewController;
	IBOutlet HellCityAppsViewController *hellCityViewController;
	IBOutlet TwitterViewController *twitterViewController;
	
	UILabel *finalScore;

}


@property (nonatomic, retain) IBOutlet UILabel *finalScore;

-(IBAction)restartTheGame:(id)sender;
-(IBAction)goToWebSite:(id)sender;
-(IBAction)updateTwitter:(id)sender;
-(IBAction)updateFacebook;
@end
