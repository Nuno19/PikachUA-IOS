//
//  SignInController.h
//  PikachUA
//
//  Created by students@deti on 22/06/2018.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
@import GoogleSignIn;

@interface SignInController : UIViewController <GIDSignInUIDelegate>


@property (nonatomic, strong) AppDelegate *appDelegate;
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end
