
#import <UIKit/UIKit.h>
@class FinalViewController;

@interface TwitterViewController : UIViewController <UITextFieldDelegate> {
	
	UILabel *textView;
	
	FinalViewController *finalViewController;
	NSString *theMessage;
	UITextField *username;
	UITextField *password;
	UIActivityIndicatorView *activityIndicator;
	UITextView *tweetsView;
	NSMutableData *tweetsData;
	NSMutableString *tweetsString;
	NSMutableDictionary *currentTweetDict;
	NSString *currentElementName;
	NSMutableString *currentText;
	NSSet *interestingTags;

}


@property (nonatomic, retain) IBOutlet UILabel *textView;
@property (assign)NSString *theMessage;
@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UITextView *tweetsView;

-(IBAction)goBackOneScreen:(id)sender;
-(IBAction)setUpdateToTwitter;
-(NSString *)setTheMessage;

@end
