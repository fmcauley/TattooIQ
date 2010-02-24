//
//  FacebookViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/23/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect/FBConnect.h"
@class FBSession;


@interface FacebookViewController : UIViewController 
<FBDialogDelegate,FBSessionDelegate,FBRequestDelegate> {
	
	IBOutlet UILabel* _label;
	IBOutlet UIButton* _permissionButton;
	IBOutlet UIButton* _feedButton;
	IBOutlet FBLoginButton* _loginButton;
	FBSession* _session;
	UILabel *dec_label;

}
@property(nonatomic, readonly) UILabel *dec_label;

- (void)askPermission:(id)target;
- (void)publishFeed:(id)target;
@end
