//
//  Tattoo_IQ_QuizAppDelegate.h
//  Tattoo IQ Quiz
//
//  Created by Frank McAuley on 12/31/09.
//  Copyright Frank McAuley LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Tattoo_IQ_QuizViewController;


@interface Tattoo_IQ_QuizAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
 Tattoo_IQ_QuizViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Tattoo_IQ_QuizViewController *viewController;


@end

