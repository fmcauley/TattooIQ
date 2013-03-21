//
//  HellCityAppsViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/8/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIWebView.h>


@interface HellCityAppsViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>{
	
	IBOutlet UITextField *urlField;
	UIWebView *webview;
	UIActivityIndicatorView *activityView;
}

@property(nonatomic,strong)IBOutlet UIActivityIndicatorView *activityView;
@property(nonatomic,strong)IBOutlet UIWebView *webview;

-(IBAction) handleGoTapped;
@end
