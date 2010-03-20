//
//  FacebookAPI.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 3/15/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FBConnect/FBConnect.h"
#import "FBConnect/FBSession.h"


@interface FacebookAPI : UIViewController <FBSessionDelegate,FBRequestDelegate>{
	FBLoginButton *loginButton;
	UIAlertView *facebookAlert;
	FBSession *usersession;
	NSString *username;
	BOOL post;
	UIButton *backButton;

}

@property(nonatomic,retain) FBLoginButton *loginButton;
@property(nonatomic,retain) UIAlertView *facebookAlert;
@property(nonatomic,retain) FBSession *usersession;
@property(nonatomic,retain) NSString *username;
@property(nonatomic,assign) BOOL post;
@property(nonatomic,retain) UIButton *backButton;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(void)getFacebookName;
-(void)postToWall;
-(void)goBack:(id)sender;


@end
