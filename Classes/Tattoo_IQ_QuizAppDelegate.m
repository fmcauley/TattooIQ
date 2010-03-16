//
//  Tattoo_IQ_QuizAppDelegate.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 12/31/09.
//  Copyright Frank McAuley LLC 2009. All rights reserved.
//

#import "Tattoo_IQ_QuizAppDelegate.h"
#import "Tattoo_IQ_QuizViewController.h"

@implementation Tattoo_IQ_QuizAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize _session;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[_session release];
    [viewController release];
    [window release];
    [super dealloc];
}


@end
