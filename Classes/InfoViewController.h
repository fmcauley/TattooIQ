//
//  InfoViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 1/11/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Quiz_GameViewController;

@interface InfoViewController : UIViewController {
	
	Quiz_GameViewController *quiz;
	

}

@property(nonatomic, retain) IBOutlet Quiz_GameViewController	*quiz;

//method to load the quiz from the infor screen
-(IBAction)loadQuizForStart:(id)sender;

@end
