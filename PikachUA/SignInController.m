//
//  SignInController.m
//  PikachUA
//
//  Created by students@deti on 22/06/2018.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "SignInController.h"


@interface SignInController ()

@end

@implementation SignInController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receiveNotification: )
     name:@"loggedIn"
     object:nil];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
    
    
}
- (void) receiveNotification:(NSNotification *) notification {
    if ([notification.name isEqualToString:@"loggedIn"]) {
        if([notification.userInfo[@"statusText"] isEqualToString:@"logged"]){
            [self performSegueWithIdentifier:@"goMap" sender:self];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Implement these methods only if the GIDSignInUIDelegate is not a subclass of
// UIViewController.

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
