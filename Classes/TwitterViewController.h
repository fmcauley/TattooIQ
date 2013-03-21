
#import <UIKit/UIKit.h>
@class FinalViewController;

@interface TwitterViewController : UIViewController <UITextFieldDelegate> {
	
	UILabel *textView;
	
	FinalViewController *finalViewController;
	NSString *__weak theMessage;
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


@property (nonatomic, strong) IBOutlet UILabel *textView;
@property (weak)NSString *theMessage;
@property (nonatomic, strong) IBOutlet UITextField *username;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) IBOutlet UITextView *tweetsView;

-(IBAction)goBackOneScreen:(id)sender;
-(IBAction)setUpdateToTwitter;
-(NSString *)setTheMessage;

@end
