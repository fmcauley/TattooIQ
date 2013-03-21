//
//  Tattoo_IQ_QuizViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 12/31/09.
//  Copyright Frank McAuley LLC 2009. All rights reserved.
//

#import "Tattoo_IQ_QuizViewController.h"
#import "InfoViewController.h"


@implementation Tattoo_IQ_QuizViewController

@synthesize infoViewController;





-(void)countDown {
	[self presentModalViewController:infoViewController animated:YES];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(countDown) userInfo:nil repeats:NO];
	
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}



@end
