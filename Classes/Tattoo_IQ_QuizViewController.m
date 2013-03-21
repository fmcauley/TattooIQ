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
	[self presentViewController:infoViewController animated:YES completion:nil];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(countDown) userInfo:nil repeats:NO];
	
}

@end
