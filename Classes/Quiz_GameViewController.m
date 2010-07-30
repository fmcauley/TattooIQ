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

-(void)showCorrectAnswerHint {
	
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Correct Answer" 
												   message:@"A magnum is a tattoo needle with two rows, one on top of the other. Invented by Sailor Jerry Collins in Hawaii." 
												  delegate:self 
										 cancelButtonTitle:@"Okay" 
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
}
// Check for the answer (this is not written right, but it runs)
-(void)checkAnswer:(int)theAnswerValue
{
	
	
	if(rightAnswer == theAnswerValue)
	{
		theQuestion.text = @"Correct!\n Ready for the next question?";
		myScore = myScore + 10;
		[self showCorrectAnswerHint];
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
	NSArray *quizArray = [[NSArray alloc] initWithObjects:
						  @"Who invented the 'magnum' tattoo needle?",@"Don Ed Hardy",@"Sailor Jerry",@"Marty Holcomb",@"Horiyoshi I",@"2",
						  @"When did European explorers discover Polynesian tattooing?",@"1901",@"1753",@"1987",@"1595",@"4",
						  @"Who was the first person to tattoo while skydiving?", @"Al Christou", @"Carson Hill", @"Travis Pastrana", @"Guy Aitchison", @"1",
						  @"Which tattoo artist is know for creating evil tattoos?", @"Vyvyn Lazonga", @"Filip Leu", @"Paul Booth", @"Tin Tin", @"3",
						  @"What does the swallow tattoo mean?", @"Swam 1000 miles", @"Sailed 5000 miles", @"Flew 10000 miles",@"Walked 1000 miles", @"2",
						  @"Which famous contortionist has performed at the Hell City Tattoo Fest?",@"Jeff 'Superfly' Solin",@"Stretchy Sam",@"Rubberboy",@"Rubber Randy",@"3",
						  @"Who holds the world record for most tattoos done within 24 hours?",@"Kat Von D",@"Oliver Peck",@"Hollis Cantrell",@"Jimi Litwalk",@"3",
						  @"When did tattooing become legal in New York?",@"1997",@"1965",@"1972",@"2001",@"1",
						  @"Tattoo Inks are made of what?",@"Ashes",@"Pigment",@"Food Coloring",@"Oil",@"2",
						  @"Which culture tattoos their faces with Ta Moko's?",@"Japanese",@"Icelandic",@"Chinese",@"Maori",@"4",
						  @"Which technique is often used with coloring flash?",@"Spit Shading",@"Scratching",@"Scrubbing",@"Drip Drop",@"1",
						  @"Which tattoo artist is known for his organic images?",@"Chris Trevino",@"Leo Zulueta",@"Guy Aitchison",@"Joe Capobianco",@"3",
						  @"Don Ed Hardy tattoos in what city?",@"New York",@"Los Angeles",@"San Francisco",@"Florida",@"3",
						  @"The Japanese gang know for their tattoos are?",@"Yamozi",@"Yakuza",@"Takatura",@"Kirosumi",@"2",
						  @"When did Sailor Jerry die?",@"1973",@"1985",@"1955",@"1932",@"1",
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