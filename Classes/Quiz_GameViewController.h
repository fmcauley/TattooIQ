

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

@property (nonatomic, retain) IBOutlet FinalViewController *finalViewController;
@property (nonatomic, retain) IBOutlet MiddleScoreViewController *middleScoreViewController;
@property (nonatomic, retain) IBOutlet LowScoreViewConroller *lowScoreViewController;
@property (retain, nonatomic) UILabel	*theQuestion;
@property (retain, nonatomic) UILabel	*theScore;
@property (retain, nonatomic) UILabel	*theLives;
@property (retain, nonatomic) UIButton	*answerOne;
@property (retain, nonatomic) UIButton	*answerTwo;
@property (retain, nonatomic) UIButton	*answerThree;
@property (retain, nonatomic) UIButton	*answerFour;
@property (retain, nonatomic) NSArray *theQuiz;
@property (retain, nonatomic) NSTimer *timer;
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

