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
						  @"A magnum tattoo needle is grouped in what?",@"Three layers",@"Odd numbers",@"Even numbers",@"Four layers",@"2",
						  @"A capacitor does what to a tattoo machine?", @"Makes it hum", @"Balance needles", @"Regulates current", @"Makes the machine sound good", @"3",
						  @"The first point of cross contamination in a tattoo studio is where?", @"Counters", @"Doorknob", @"Floor", @"Bathroom", @"2",
						  @"What is used under machine coil to insulate against magnetism?", @"Yoke", @"Spring", @"Washers",@"Disks", @"1",
						  @"Machine capacitors are measured in?",@"Volts",@"Magnetics",@"Microfarads",@"Inches",@"3",
						  @"Artists wear these when tattooing?",@"Plastic shoes",@"Eyewear",@"Silly hats",@"Latex gloves",@"4",
						  @"The cord that attaches to a tattoo machine is?",@"Tatt cord",@"Clipcord",@"Hose Ring",@"Wire adapter",@"2",
						  @"What style of tattooing involves no stencil?",@"Skin sketch",@"Freehand",@"Drawn on",@"Non stencil",@"2",
						  @"What does a Koi fish tattoo mean?",@"Freedom",@"Resistance",@"Growth",@"Courage",@"4",
						  @"What color tends to take the longest to heal in the skin?",@"Purple",@"Red",@"Blue",@"Green",@"2",
						  @"Which book contains the world’s largest collection of miniature paintings?",@"Pint Size Paintings",@"Mini Masterpieces",@"Tiny Canvases",@"Little artworks",@"1",
						  @"You can tattoo eyeballs and tongues?",@"True",@"False",@"",@"",@"1",
						  @"What does a Fu Dog tattoo mean?",@"Health & Wealth",@"Strength & Promise",@"Wisdom & Wit",@"Safety & Protection",@"1",
						  @"What does the artist disperse ink into while tattooing?",@"Caps",@"Pools",@"Tops",@"Trays",@"1",
						  nil];
	self.theQuiz = quizArray;
	[quizArray release];
	
	//Build out an array to hold the hints
	hintArray = [[NSArray alloc] initWithObjects:
				 @"Plasma coagulates blood to stop bleeding. It is the yellowish liquid component of blood containing proteins, glucose, minerals, hormones and carbon dioxide. It makes up 55% of blood.",
				 @"A magnum needle is two layers of needles configured in odd numbers , like a 7 magnum or 13 magnum. Magnums are considered the paint brushes of all tattoo needles!",
				 @"Capacitors store electrical energy and distribute clean electrons evenly. Perfect for high voltage applications like tattooing.",
				 @"The one object in a tattoo studio that is literally touched by everyone is the door handle. Tattoo studios wipe and clean them daily for safety and cleanliness reasons.",
				 @"The Yoke is a small steel plate that sits under the tattoo machine coils. The Yoke is found on most aluminum or brass tattoo machines.",
				 @"Values of capacitors are usually specified in ranges of farads. Microfarads are units of capacitance, equivalent to one millionth of a farad, used in small capacitors.",
				 @"Tattoo Artists wear disposable latex gloves during tattoo procedures that help prevent contamination between artist and clients. Nitrile gloves are an alternative to latex.",
				 @"A Clip Cord plugs into the power supply and connects to the tattoo machine. Carrying electrical current to the tattoo machine.",
				 @"Capacitors are widely used in electronic circuits for blocking direct current, allowing alternating current to pass. Therefore smoothing the distribution of power throughout a tattoo machine.",
				 @"Freehand tattooing involves either drawing directly on the skin with a pen or marker or absolutely no stencil, drawing or pre-design being done at all.",
				 @"Because of its strength and determination to overcome obstacles, the Japanese Koi Fish stands for courage and the ability to attain high goals.",
				 @"Red tattoo ink just happens to be the most common color for people to have what’s called “Red Reaction” due to a higher nickel and cadmium content in the minerals used to make red tattoo ink.",
				 @"Pint Size Paintings is a unique book focusing on amazing paintings done on a very small scale, while still having a large visual impact! Visit www.pintsizepaintings.com.",
				 @"Although it’s never recommended to tattoo your eyeball or your tongue, it has been done. Matt Gone, a famous heavily tattooed collector, has his eyes and tongue tattooed blue.",
				 @"The Fu Dog drives away evil spirits and brings health and wealth to those who wear it in their tattoos.",
                 @"Tattoo artists put their inks used for each client in Ink Caps. These caps are disposed of after each client and new ones are used for each color in the tattoo",
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