
#import <UIKit/UIKit.h>
@class FinalViewController;

@interface TwitterViewController : UIViewController <UITextFieldDelegate> {
	
	UILabel *textView;
	
	FinalViewController *finalViewController;
	NSString *theMessage;
	UITextField *username;
	UITextField *password;

}


@property (nonatomic, retain) IBOutlet UILabel *textView;
@property (assign)NSString *theMessage;
@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITextField *password;

-(IBAction)goBackOneScreen:(id)sender;
-(IBAction)setUpdateToTwitter;
-(NSString *)setTheMessage;

@end
