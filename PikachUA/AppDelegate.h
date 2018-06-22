//
//  AppDelegate.h
//  MapTest
//
//  Created by students@deti on 09/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MCManager.h"
@import CoreMotion;
@import GoogleSignIn;


@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (nonatomic, strong) MCManager *mcManager;


@property (nonatomic) NSInteger stepsTurn;
@property (nonatomic) NSInteger stepsTotal;


@property (nonatomic, strong) CMPedometer *pedometer;


@property (nonatomic, strong) NSString *userID;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void)startTracking;

@end

