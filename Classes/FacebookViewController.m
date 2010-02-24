//
//  FacebookViewController.m
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/23/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import "FacebookViewController.h"
#import "FBConnect/FBConnect.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
// This application will not work until you enter your Facebook application's API key here:

static NSString* kApiKey = @"<YOUR API KEY>";

// Enter either your API secret or a callback URL (as described in documentation):
static NSString* kApiSecret = nil; // @"<YOUR SECRET KEY>";
static NSString* kGetSessionProxy = nil; // @"<YOUR SESSION CALLBACK)>";

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation SessionViewController

@synthesize dec_label;
///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:@"FacebookViewController" bundle:nibBundleOrNil]) {
		if (kGetSessionProxy) {
			_session = [[FBSession sessionForApplication:kApiKey getSessionProxy:kGetSessionProxy
												delegate:self] retain];
		} else {
			_session = [[FBSession sessionForApplication:kApiKey secret:kApiSecret delegate:self] retain];
		}
	}
	return self;
}

- (void)dealloc {
	[_session release];
	[super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)viewDidLoad {
	[_session resume];
	_loginButton.style = FBLoginButtonStyleWide;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBDialogDelegate

- (void)dialog:(FBDialog*)dialog didFailWithError:(NSError*)error {
	_label.text = [NSString stringWithFormat:@"Error(%d) %@", error.code,
				   error.localizedDescription];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBSessionDelegate

- (void)session:(FBSession*)session didLogin:(FBUID)uid {
	_permissionButton.hidden = NO;
	_feedButton.hidden = NO;
	
	NSString* fql = [NSString stringWithFormat:
					 @"select uid,name from user where uid == %lld", session.uid];
	
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	[[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
}

- (void)sessionDidLogout:(FBSession*)session {
	_label.text = @"";
	_permissionButton.hidden = YES;
	_feedButton.hidden = YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBRequestDelegate

- (void)request:(FBRequest*)request didLoad:(id)result {
	NSArray* users = result;
	NSDictionary* user = [users objectAtIndex:0];
	NSString* name = [user objectForKey:@"name"];
	_label.text = [NSString stringWithFormat:@"Logged in as %@", name];
}

- (void)request:(FBRequest*)request didFailWithError:(NSError*)error {
	_label.text = [NSString stringWithFormat:@"Error(%d) %@", error.code,
				   error.localizedDescription];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)askPermission:(id)target {
	FBPermissionDialog* dialog = [[[FBPermissionDialog alloc] init] autorelease];
	dialog.delegate = self;
	dialog.permission = @"status_update";
	[dialog show];
}

- (void)publishFeed:(id)target {
	FBFeedDialog* dialog = [[[FBFeedDialog alloc] init] autorelease];
	dialog.delegate = self;
	dialog.templateBundleId = 9999999;
	dialog.templateData = @"{\"key1\": \"value1\"}";
	[dialog show];
}


@end
