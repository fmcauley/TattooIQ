//
//  Quiz_GameViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 1/1/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import "Quiz_GameViewController.h"
#import "FinalViewController.h"
#import "MiddleScoreViewController.h"
#import "LowScoreViewConroller.h"


@implementation Quiz_GameViewController
@synthesize middleScoreViewController;
@synthesize lowScoreViewController;
@synthesize finalViewController;
@synthesize theQuestion;
@synthesize theScore;
@synthesize theLives;
@synthesize answerOne;
@synthesize answerTwo;
@synthesize answerThree;
@synthesize answerFour;
@synthesize theQuiz;
@synthesize timer;
@synthesize myScore;


//THIS IS A TEST

-(NSInteger)getMyScore {
	return myScore;
}
	


-(void)askQuestion
{
	
	
	// Unhide all the answer buttons.
	[answerOne setHidden:NO];
	[answerTwo setHidden:NO];
	[answerThree setHidden:NO];
	[answerFour setHidden:NO];
	
	// Set the game to a "live" question (for timer purposes)
	
	questionLive = YES;
	
	// Set the time for the timer
	time = 20.0;
	
	// Go to the next question
	questionNumber = questionNumber + 1;
	
	// THIS IS REALLY TERRIBLE CODE!!!
	// We get the question from the questionNumber * the row that we look up in the array.
	// This is absolutely horrible, just a placeholder until the right way.
	// I cannot even begin to describe how wrong this solution is.
	NSInteger row = 0;
	if(questionNumber == 1)
	{
		row = questionNumber - 1;
	}
	else
	{
		row = ((questionNumber - 1) * 6);
	}
	
	// Set the question string, and set the buttons the the answers
	NSString *selected = [theQuiz objectAtIndex:row];
	NSString *activeQuestion = [[NSString alloc] initWithFormat:@"%@", selected];
	[answerOne setTitle:[theQuiz objectAtIndex:row+1] forState:UIControlStateNormal];
	[answerTwo setTitle:[theQuiz objectAtIndex:row+2] forState:UIControlStateNormal];
	[answerThree setTitle:[theQuiz objectAtIndex:row+3] forState:UIControlStateNormal];
	[answerFour setTitle:[theQuiz objectAtIndex:row+4] forState:UIControlStateNormal];
	rightAnswer = [[theQuiz objectAtIndex:row+5] intValue];
	
	// Set theQuestion label to the active question
	theQuestion.text = activeQuestion;
	
	// Start the timer for the countdown
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
	
	[selected release];
	[activeQuestion release];
}

-(void)updateScore
{
	// If the score is being updated, the question is not live
	questionLive = NO;
	
	[timer invalidate];
	
	// Hide the answers from the previous question
	[answerOne setHidden:YES];
	[answerTwo setHidden:YES];
	[answerThree setHidden:YES];
	[answerFour setHidden:YES];
	NSString *scoreUpdate = [[NSString alloc] initWithFormat:@"Score: %d", myScore];
	theScore.text = scoreUpdate;
	[scoreUpdate release];
	
	// END THE GAME.
	NSInteger endOfQuiz = [theQuiz count];
	if((((questionNumber - 1) * 6) + 6) == endOfQuiz)
	{
		
		
		
		// Game is over.
		if(myScore >= 130)
		{
			[self presentModalViewController:finalViewController animated:YES];
		
			
			
		} 
			else if(myScore < 130 && myScore >= 100)  {
				
				[self presentModalViewController:middleScoreViewController animated:YES];
			
						
		}

		
		else
		{
			[self presentModalViewController:lowScoreViewController animated:YES];
			
		}
		
	}
		
	else
	{
		// Give a short rest between questions
		time = 3.0;
		
		// Initialize the timer
		timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
	}
}



-(void)countDown
{
	// Question live counter
	if(questionLive==YES)
	{
		time = time - 1;
		theLives.text = [NSString stringWithFormat:@"Time remaining: %i", time];
		
		if(time == 0)
		{
			// Loser!
			questionLive = NO;
			theQuestion.text = @"Times up! Try to work faster!";
			myScore = myScore - 0; //was -30 but the score should not be impacted for a wrong answer...
			[timer invalidate];
			[self updateScore];
		}
	}
	// In-between Question counter
	else
	{
		time = time - 1;
		theLives.text = [NSString stringWithFormat:@"Next question in...%i", time];
		
		if(time == 0)
		{
			[timer invalidate];
			theLives.text = @"";
			[self askQuestion];
		}
	}
	if(time < 0)
	{
		[timer invalidate];
	}
}


- (IBAction)buttonOne
{
	if(questionNumber == 0){
		// This means that we are at the startup-state
		// We need to make the other buttons visible, and start the game.
		[answerTwo setHidden:NO];
		[answerThree setHidden:NO];
		[answerFour setHidden:NO];
		[self askQuestion];
	}
	else
	{
		NSInteger theAnswerValue = 1;
		[self checkAnswer:(int)theAnswerValue];
		
	}
	
}

- (IBAction)buttonTwo
{
	NSInteger theAnswerValue = 2;
	[self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonThree
{
	NSInteger theAnswerValue = 3;
	[self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonFour
{
	NSInteger theAnswerValue = 4;
	[self checkAnswer:(int)theAnswerValue];
}

// Check for the answer (this is not written right, but it runs)
-(void)checkAnswer:(int)theAnswerValue
{
	
	//FOR TESTING ONLY
	NSLog(@"The value %d\n ",restartGame); //THIS WILL BE REMOVED AFTER TESTING
	if(rightAnswer == theAnswerValue)
	{
		theQuestion.text = @"Correct!\n Ready for the next question?";
		myScore = myScore + 10;
	}
	else
	{
		theQuestion.text = @"Ouch!\nLearn more about tattooing.\nGo visit HELLCITY.COM!";
		myScore = myScore - 0; //change to 0 no negative score was -10
	}
	[self updateScore];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	questionLive = NO;
	restartGame = NO;
	theScore.text = @"Score:0";
	theLives.text = @"";
	questionNumber = 0;
	myScore = 0;
	myLives = 0;
	[self loadQuiz];
	[self askQuestion];
}

-(void)loadQuiz
{
	// This is our forced-loaded array of quiz questions.
	// FORMAT IS IMPORTANT!!!!
	// 1: Question, 2 3 4 5: Answers 1-4 respectively, 6: The right answer
	// THIS IS A TERRIBLE WAY TO DO THIS. I will figure out how to do nested arrays to make this better.
	NSArray *quizArray = [[NSArray alloc] initWithObjects:@"What is the outer layers of skin?",@"Dermatitis",@"Dermis",@"Epidermis",@"Callous",@"2",
						  @"Which Actor does not have a tattoo?",@"Mark Wahlberg",@"Johnny Depp",@"Will Smith",@"Kurt Russell",@"3",
						  @"Which famous inventor had tattoos?", @"Albert Einstein", @"Thomas Edison", @"Sir Isaac Newton", @"Ben Franklin", @"2",
						  @"Cosmetic Tattooing is also known as:", @"Dermapigmentation", @"Melanomenation", @"Facial pigmenting", @"Permentation", @"1",
						  @"A tattoo artist steps on this to make his machines operate:", @"Gun Clip", @"Foot Clamp", @"Push Button",@"Foot Pedal", @"4",
						  @"A tattoo of an anchor means?",@"Swam with sharks",@"Sailed the Atlantic ocean",@"Dove at a ship wreck site",@"Sailed the Pacific ocean",@"2",
						  @"Which tattoo artist called Columbus, Ohio home in the 70’s?",@"Don Ed Hardy",@"Greg Irons",@"Burt Grimm",@"Stoney St. Clair",@"4",
						  @"Which style of tattooing uses black lines, bold shading & bright color?",@"Realism",@"Traditional",@"Biomechanical",@"Tribal",@"2",
						  @"What damages tattoos the worst over time?",@"Aging",@"Sunlight",@"Scratching",@"Moisture",@"2",
						  @"What life saving tattoos do people get the most?",@"ID numbers",@"Social Security number",@"Their name & address",@"Medical info",@"4",
						  @"Who is the worlds most tattooed woman?",@"Isobel Varley",@"Lydia O’Lydia",@"Julia Gnuse",@"Tonya Seranski",@"1",
						  @"Which U.S. President had a tattoo?",@"Bill Clinton",@"Andrew Jackson",@"Abraham Lincoln",@"George Washington",@"2",
						  @"Maori facial tattoos are called?",@"Maoroko",@"Chintoos",@"Ta Moko",@"Facitoos",@"3",
						  @"One of the most famous Japanese Tattooists is?",@"Horikrap II",@"Horirocka",@"Horiyoshi III",@"Horijin",@"3",
						  @"This band had facial tattoos on one of their albums:",@"Police",@"The WHo",@"Rolling Stones",@"Black Sabbath",@"3",
						  nil];
	self.theQuiz = quizArray;
	[quizArray release];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[theQuestion release];
	[theScore release];
	[theLives release];
	[answerOne release];
	[answerTwo release];
	[answerThree release];
	[answerFour release];
	[theQuiz release];
	[timer release];
    [super dealloc];
}

@end