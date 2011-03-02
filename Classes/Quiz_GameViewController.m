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
	time = 30.0;
	
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

- (void)getHints:(int)indexNum
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Correct Answer" 
												   message:[hintArray objectAtIndex:indexNum] 
												  delegate:self 
										 cancelButtonTitle:@"Next" 
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
		if (questionNumber == 1) {
			[self getHints:0];
		}
		
		else if (questionNumber == 2) {
			[self getHints:1];
		}
		
		else if (questionNumber == 3) {
			[self getHints:2];
		}
		else if (questionNumber == 4) {
			[self getHints:3];
		}
		else if (questionNumber == 5) {
			[self getHints:4];
		}
		else if (questionNumber == 6) {
			[self getHints:5];
		}
		else if (questionNumber == 7) {
			[self getHints:6];
		}
		else if (questionNumber == 8) {
			[self getHints:7];
		}
		else if (questionNumber == 9) {
			[self getHints:8];
		}
		else if (questionNumber == 10) {
			[self getHints:9];
		}
		else if (questionNumber == 11) {
			[self getHints:10];
		}
		else if (questionNumber == 12) {
			[self getHints:11];
		}
		else if (questionNumber == 13) {
			[self getHints:12];
		}
		else if (questionNumber == 14) {
			[self getHints:13];
		}
		else if (questionNumber == 15) {
			[self getHints:14];
		}
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
						  @"How does bleeding stop during a tattoo?",@"Ointment",@"Pressure",@"Plasma",@"Dabbing",@"3",
						  @"Laser tattoo removal does what to an existing tattoo?",@"Burns the tattoo away evenly",@"Body absorbs ink overtime",@"Evaporates the tattoo quickly",@"Lightens tattoo immediately",@"2",
						  @"Hair grows back through a new tattoo?", @"True", @"False", @"", @"", @"1",
						  @"The most common tattoos on fingers are?", @"Lettering", @"Flowers", @"Kanji", @"Skulls", @"1",
						  @"Which artist is “The New King Of Rock Tattoos” by Rolling Stone Magazine?", @"Bob Tyrell", @"Durb Morrison", @"Lyle Tuttle",@"Paul Booth", @"4",
						  @"The most common body part that people tattoo is?",@"Arms",@"Back",@"Legs",@"Chest",@"1",
						  @"Tattoo artists take these at Conventions to learn new techniques?",@"Classes",@"Seminars",@"Study Hall",@"Lessons",@"2",
						  @"The Hell City Tattoo Festival takes place in what two cities?",@"Los Angeles, CA & Houston, TX",@"Las Vegas, NV & Columbus, OH",@"Phoenix, AZ & Las Vegas, NV",@"Columbus, OH & Phoenix, AZ",@"4",
						  @"Which tattoo machine part regulates the power output?",@"Capacitor",@"Coils",@"Springs",@"Contact Screw",@"1",
						  @"The actor who wears one of the most infamous tattoos is?",@"Angelina Jolie",@"Danny Trejo",@"Josh Hartnett",@"Dwayne 'The Rock' Johnson",@"2",
						  @"Which part of a tattoo machine does the artist connect their clipcord to?",@"Tubes",@"Binding posts",@"Frame",@"Scres",@"2",
						  @"Why are ointments used during a tattoo procedure?",@"Lubrication of the skin",@"Helps wipe away ink",@"Helps stop bleeding",@"All of the above",@"4",
						  @"Which tattoo artist is know for doing amazing color portraits?",@"Carson Hill",@"Nathan Kostechko",@"Mike Devries",@"Vyvyn Lazonga",@"3",
						  @"Tattooing is regulated in every state in the U.S?",@"True",@"False",@"",@"",@"2",
						  @"Which TV show featured tattoo artists going head to head at various conventions?",@"Skin Battles",@"Tattoo Battle",@"Tattoo Wars",@"Skin Time",@"3",
						  nil];
	self.theQuiz = quizArray;
	[quizArray release];
	
	//Build out an array to hold the hints
	hintArray = [[NSArray alloc] initWithObjects:
				 @"Plasma coagulates blood to stop bleeding. It is the yellowish liquid component of blood containing proteins, glucose, minerals, hormones and carbon dioxide. It makes up 55% of blood.",
				 @"Laser energy that is directed at the tattooed disrupts the ink, allowing your body to absorb it and break it down naturally.",
				 @"Tattooing does not damage the follicle or the sebaceous gland that produces hair, allowing the hair to continue to grow through the dermis and epidermis.",
				 @"Finger tattoos commonly spell a favorite saying or combo of 4 letter words. Symbols can often express desired words as well.",
				 @"*In 2002, Rolling Stone featured Booth and proudly crowned him “The new king of rock tattoos”. Paul has recently stepped into the arena of film also.",
				 @"Arm tattoos are a staple in tattoo parlors around the world. This area is often the least painful and easy to cover up with clothing for the average collector.",
				 @"Seminars are a great way to expand your knowledge of various fields of tattooing. Seminars are a staple at any tattoo convention today.",
				 @"The Hell City Tattoo Festival takes place in it’s hometown of Columbus, OH and also travels to Phoenix, AZ to bring this amazing fest to the West.",
				 @"Capacitors are widely used in electronic circuits for blocking direct current, allowing alternating current to pass. Therefore smoothing the distribution of power throughout a tattoo machine.",
				 @"Danny Trejo has had his famous chest piece tattoo for his entire acting career. The first thing people notice on Danny Trejo is his giant chest tattoo and others on his body. He has earned the nickname of 'The Illustrated Man' as a result.",
				 @"Binding Posts are used to attach required parts to a traditional tattoo machine, including clipcords and contact screws.",
				 @"Ointments are commonly used by artists to assist in many aspects of the tattoo application. Serving many purposes, ointments are still used by today’s artists.",
				 @"Mike Devries has been making his mark in the color portraiture scene in Southern California since 2003. He is an award winning, groundbreaking artist that has a unique vision of portrait tattoos.",
				 @"Tattooing is regulated by health departments in every state except for New Mexico, North Dakota and Washington DC.",
				 @"Tattoo Wars pits the best tattoo artists against each other in a head to head creation competition. Having filmed an episode at The Hell City Tattoo Fest, each episode explores the world, legend and work of two tattooists.",
				 nil];
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