//
//  HellCityAppsViewController.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 2/8/10.
//  Copyright 2010 Frank McAuley LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HellCityAppsViewController : UIViewController <UITextFieldDelegate>{
	
	IBOutlet UITextField *urlField;
	IBOutlet UIWebView *webview;

}

-(IBAction) handleGoTapped;
@end
