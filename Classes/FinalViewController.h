

#import <UIKit/UIKit.h>

@class InfoViewController;
@class HellCityAppsViewController;
@class TwitterViewController;



@interface FinalViewController : UIViewController {
	
	InfoViewController * infoViewController;
	HellCityAppsViewController *hellCityViewController;
	TwitterViewController *twitterViewController;
	UILabel *finalScore;

}

@property (nonatomic, retain) IBOutlet InfoViewController *infoViewController;
@property (nonatomic, retain) IBOutlet HellCityAppsViewController *hellCityViewController;
@property (nonatomic, retain) IBOutlet TwitterViewController *twitterViewController;
@property (nonatomic, retain) IBOutlet UILabel *finalScore;

-(IBAction)restartTheGame:(id)sender;
-(IBAction)goToWebSite:(id)sender;
-(IBAction)updateTwitter:(id)sender;

@end
