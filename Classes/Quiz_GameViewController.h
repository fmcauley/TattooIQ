

#import <UIKit/UIKit.h>

@class FinalViewController;
@class MiddleScoreViewController;
@class LowScoreViewConroller;

@interface Quiz_GameViewController : UIViewController {
	IBOutlet	UILabel		*theQuestion;
	IBOutlet	UILabel		*theScore;
	IBOutlet	UILabel		*theLives;
	IBOutlet	UIButton	*answerOne;
	IBOutlet	UIButton	*answerTwo;
	IBOutlet	UIButton	*answerThree;
	IBOutlet	UIButton	*answerFour;
	NSInteger myScore;
	NSInteger myLives;
	NSInteger questionNumber;
	NSInteger rightAnswer;
	NSInteger time;
	NSArray *theQuiz;
	NSTimer *timer;
	BOOL questionLive;
	BOOL restartGame;
	NSArray *hintArray;
	
	//seting up a new screen for restart
	FinalViewController *finalViewController;
	MiddleScoreViewController *middleScoreViewController;
	LowScoreViewConroller *lowScoreViewController;
	
}

@property (nonatomic, strong) IBOutlet FinalViewController *finalViewController;
@property (nonatomic, strong) IBOutlet MiddleScoreViewController *middleScoreViewController;
@property (nonatomic, strong) IBOutlet LowScoreViewConroller *lowScoreViewController;
@property (strong, nonatomic) UILabel	*theQuestion;
@property (strong, nonatomic) UILabel	*theScore;
@property (strong, nonatomic) UILabel	*theLives;
@property (strong, nonatomic) UIButton	*answerOne;
@property (strong, nonatomic) UIButton	*answerTwo;
@property (strong, nonatomic) UIButton	*answerThree;
@property (strong, nonatomic) UIButton	*answerFour;
@property (strong, nonatomic) NSArray *theQuiz;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic, assign) NSInteger myScore;


-(IBAction)buttonOne;
-(IBAction)buttonTwo;
-(IBAction)buttonThree;
-(IBAction)buttonFour;

-(void)checkAnswer:(int)answer;
-(void)askQuestion;
-(void)updateScore;
-(void)loadQuiz;
-(void)countDown;


@end

