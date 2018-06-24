//
//  ProfileViewController.h
//  FirebaseCore
//
//  Created by students@deti on 24/06/2018.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "User+CoreDataClass.h"
@import Firebase;

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *monstersCaught;
@property (weak, nonatomic) IBOutlet UILabel *totalXP;
@property (weak, nonatomic) IBOutlet UILabel *totalSteps;

@property (strong,nonatomic) FIRDatabaseReference *ref;
@property(strong, nonatomic) FIRFunctions *functions;

@property (retain,nonatomic) User *user;

@end
