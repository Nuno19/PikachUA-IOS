//
//  ProfileViewController.m
//  FirebaseCore
//
//  Created by students@deti on 24/06/2018.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"User"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",_appDelegate.userName] ];
    
    _user = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    _name.text = [NSString stringWithFormat:@"Name: %@", _user.name];
    _startDate.text = [NSString stringWithFormat:@"Member since: %@", _user.startDate];
    _monstersCaught.text = [NSString stringWithFormat:@"Monsters Caught: %@", _user.monstersCaught];
    _totalXP.text = [NSString stringWithFormat:@"Total XP: %@", _user.totalXP];
    _totalSteps.text = [NSString stringWithFormat:@"Total Steps: %ld", (long)_appDelegate.stepsTotal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
