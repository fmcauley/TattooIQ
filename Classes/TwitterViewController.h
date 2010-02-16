
#import <UIKit/UIKit.h>
@class FinalViewController;

@interface TwitterViewController : UIViewController {
	
	UILabel *textView;
	
	FinalViewController *finalViewController;

}

@property (nonatomic, retain) IBOutlet FinalViewController *finalViewController;
@property (nonatomic, retain) IBOutlet UILabel *textView;

-(IBAction)goBackOneScreen:(id)sender;
-(IBAction)setUpdateToTwitter:(id)sender;

@end
