
#import <UIKit/UIKit.h>
@class FinalViewController;

@interface TwitterViewController : UIViewController {
	
	UILabel *textView;
	
	FinalViewController *finalViewController;
	NSString *theMessage;

}


@property (nonatomic, retain) IBOutlet UILabel *textView;
@property (assign)NSString *theMessage;

-(IBAction)goBackOneScreen:(id)sender;
-(IBAction)setUpdateToTwitter:(id)sender;
-(void)buildTwitterUpdate;
-(NSString *)setTheMessage;
//-(void)userNameandPassword;

@end
