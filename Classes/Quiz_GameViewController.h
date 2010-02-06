//
//  Quiz_GameViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 1/1/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NSAttributedString;
@class InfoViewController;

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
	
	//seting up a new screen for restart
	InfoViewController *infoViewController;
	
}

@property (nonatomic, retain) IBOutlet InfoViewController *infoViewController;
@property (retain, nonatomic) UILabel	*theQuestion;
@property (retain, nonatomic) UILabel	*theScore;
@property (retain, nonatomic) UILabel	*theLives;
@property (retain, nonatomic) UIButton	*answerOne;
@property (retain, nonatomic) UIButton	*answerTwo;
@property (retain, nonatomic) UIButton	*answerThree;
@property (retain, nonatomic) UIButton	*answerFour;
@property (retain, nonatomic) NSArray *theQuiz;
@property (retain, nonatomic) NSTimer *timer;

-(IBAction)buttonOne;
-(IBAction)buttonTwo;
-(IBAction)buttonThree;
-(IBAction)buttonFour;

-(void)checkAnswer:(int)answer;
-(void)askQuestion;
-(void)updateScore;
-(void)loadQuiz;
-(void)countDown;
-(void)restartQuiz;


@end

