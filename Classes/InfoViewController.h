

#import <UIKit/UIKit.h>
@class Quiz_GameViewController;

@interface InfoViewController : UIViewController {
	
	Quiz_GameViewController *quiz;
	

}

@property(nonatomic, strong) IBOutlet Quiz_GameViewController	*quiz;

//method to load the quiz from the infor screen
-(IBAction)loadQuizForStart:(id)sender;

@end
