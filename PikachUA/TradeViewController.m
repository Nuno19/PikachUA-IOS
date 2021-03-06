//
//  MonsterBioViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "TradeViewController.h"

@interface TradeViewController ()
-(void)didReceiveDataWithNotification:(NSNotification *)notification;

@end

@implementation TradeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate mcManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate mcManager] advertiseSelf:_swVisible.isOn];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveDataWithNotification:)
                                                 name:@"MPReceiveData"
                                               object:nil];

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

- (IBAction)browseForDevices:(id)sender {
    [[_appDelegate mcManager] setupMCBrowser];
    [[[_appDelegate mcManager] browser] setDelegate:self];
    [self presentViewController:[[_appDelegate mcManager] browser] animated:YES completion:nil];

}

- (IBAction)disconnect:(id)sender {
    [_appDelegate.mcManager.session disconnect];
        
    [_tblConnectedDevices reloadData];
}

- (IBAction)toggleVisibility:(id)sender {
}

- (IBAction)sendText:(id)sender {
    NSString *data = [NSString stringWithFormat:@"%@/%@/%@/%@/%@", _pokemon.id, _pokemon.pokemon_id, _pokemon.nickname, _pokemon.image, _pokemon.value];
    NSData *dataToSend = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = _appDelegate.mcManager.session.connectedPeers;
    NSError *error;
    
    [_appDelegate.mcManager.session sendData:dataToSend
                                     toPeers:allPeers
                                    withMode:MCSessionSendDataReliable
                                       error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        [_appDelegate.managedObjectContext deleteObject:_pokemon];
        [_appDelegate saveContext];
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:NO];
        [navigationController popViewControllerAnimated:YES];
    }
    
}


-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}


-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController{
    [_appDelegate.mcManager.browser dismissViewControllerAnimated:YES completion:nil];
}

@end
