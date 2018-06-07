//
//  AppDelegate.h
//  PikachUA
//
//  Created by students@deti on 07/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

