//
//  ViewController.m
//  MapTest
//
//  Created by students@deti on 09/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "ViewController.h"
@import CoreData;

@interface ViewController ()

@end

@implementation ViewController
CLLocationManager *locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSTimer scheduledTimerWithTimeInterval:15.0 target:self selector:@selector(spawnPokemons ) userInfo:nil repeats:YES] fire];
    [[NSTimer scheduledTimerWithTimeInterval:180.0 target:self selector:@selector(spawnPokeStops ) userInfo:nil repeats:YES] fire];
    
    _ref = [[FIRDatabase database] reference];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    [self getLocation];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.625421, -8.647336);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    [_map setRegion:region animated:YES];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [_appDelegate startTracking];
    
    self.functions = [FIRFunctions functions];
    _map.delegate = self;
    
    NSLog(@"%@", _appDelegate.userID);
    [[ _ref child:@"pokemonsInst"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(id key in dict){
         //   NSLog(@"ENTERED");
            NSDictionary *pokeDict = [dict objectForKey:key];
            
            if([pokeDict[@"user_id"] isEqualToString:_appDelegate.userID]){
            
                PokemonInst *poke = [NSEntityDescription insertNewObjectForEntityForName:@"PokemonInst" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                poke.nickname = pokeDict[@"nickname"];
                poke.id = pokeDict[@"id"];
                poke.pokemon_id = pokeDict[@"pokemon_id"];
                poke.value = pokeDict[@"value"];
                poke.image = pokeDict[@"image"];
            
                [_appDelegate saveContext];
              //  NSLog(@"%@", poke);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    [[ _ref child:@"pokedex"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        for(id key in dict){
       //     NSLog(@"ENTERED");
            NSDictionary *pokeDict = [dict objectForKey:key];
            if([pokeDict[@"user_id"] isEqualToString:_appDelegate.userID]){
                //NSDictionary *pokeDict = [dict objectForKey:key];
            
                Pokemon *poke = [NSEntityDescription insertNewObjectForEntityForName:@"Pokemon" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                
                poke.id = pokeDict[@"id"];
                poke.image = pokeDict[@"image"];
                poke.name = pokeDict[@"name"];
            
                [_appDelegate saveContext];
              //  NSLog(@"%@", poke);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    [[ _ref child:@"pokemons"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSMutableArray *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(NSDictionary *pokeDict in dict){
         //   NSLog(@"ENTERED");
            //NSDictionary *pokeDict = [dict objectForKey:key];
                
            Pokedex *poke = [NSEntityDescription insertNewObjectForEntityForName:@"Pokedex" inManagedObjectContext:_appDelegate.managedObjectContext];
                
                
            poke.id = pokeDict[@"id"];
            poke.weight = pokeDict[@"weight"];
            poke.image = pokeDict[@"image"];
            poke.height = pokeDict[@"height"];
            poke.pokedex = pokeDict[@"pokedex"];
            poke.nickname = pokeDict[@"nickname"];
            poke.name = pokeDict[@"name"];
                
            [_appDelegate saveContext];
            //NSLog(@"%@", poke);
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    
    [[ _ref child:@"items_inst"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        // Get user value
        NSDictionary *dict = snapshot.value;
        //NSLog(@"%@", dict);
        for(id key in dict){

           // NSLog(@"ENTERED");
            NSDictionary *itemDict = [dict objectForKey:key];
            if([itemDict[@"user_id"] isEqualToString:_appDelegate.userID]){
                ItemInst *item = [NSEntityDescription insertNewObjectForEntityForName:@"ItemInst" inManagedObjectContext:_appDelegate.managedObjectContext];
            
                item.name = itemDict[@"name"];
                item.descriptions = itemDict[@"description"];
                item.amount = (int)[[itemDict objectForKey:@"amount"] integerValue];
                item.id = itemDict[@"id"];
                item.image = itemDict[@"image"];
            
                [_appDelegate saveContext];
               // NSLog(@"%@", item);
            }
        }
        
    }withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
}

- (void)getLocation{
    
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    NSLog(@"Started Location");
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
//locationManager.distanceFilter = 1;
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    _lastLoc = location;
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        
        // If the event is recent, do something with it.
      //  NSLog(@"latitude %+.6f, longitude %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
        
        [_map setCenterCoordinate:location.coordinate animated:YES ];

        
    }
}


-(void) spawnPokemons {
    _steps.text = [NSString stringWithFormat:@"%ld",(long)_appDelegate.stepsTotal];
    NSLog(@"STEPS:              %d", (int)_appDelegate.stepsTotal);
    NSLog(@"SPawned");
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSString *lat = [NSString stringWithFormat:@"%f",_lastLoc.coordinate.latitude];
    NSString *lon = [NSString stringWithFormat:@"%f",_lastLoc.coordinate.longitude];
    
    [data setValue:lat forKey:@"lat"];
    [data setValue:lon forKey:@"long"];
    
    [[_functions HTTPSCallableWithName:@"getPokeInstLoc"] callWithObject:@{@"location":data}
                                                              completion:^(FIRHTTPSCallableResult * _Nullable result, NSError * _Nullable error) {
                                                                  if (error) {
                                                                      if (error.domain == FIRFunctionsErrorDomain) {
                                                                          FIRFunctionsErrorCode code = error.code;
                                                                          NSString *message = error.localizedDescription;
                                                                          NSObject *details = error.userInfo[FIRFunctionsErrorDetailsKey];
                                                                          
                                                                          NSLog(message,details,code);
                                                                          return;
                                                                      }
                                                                      
                                                                  }
                                                                  [_map removeAnnotations:_map.annotations];
                                                                  for (NSDictionary *dict in result.data[@"pokemon"]){
                                                                      
                                                                      double latP = [ dict[@"latitude"] doubleValue];
                                                                      double lonP = [ dict[@"longitude"] doubleValue];
                                                                      CLLocationCoordinate2D position = CLLocationCoordinate2DMake(latP, lonP);
                                                                      MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                                                                      point.title = dict[@"name"];
                                                                      point.subtitle = dict[@"id"];
                                                                      point.coordinate = position;
                                                                      [_map addAnnotation:point];
                                                                      
                                                                  }
                                                              }];
    
    
}


-(void) spawnPokeStops {

    NSLog(@"POKESTOPS");
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    NSString *lat = [NSString stringWithFormat:@"%f",_lastLoc.coordinate.latitude];
    NSString *lon = [NSString stringWithFormat:@"%f",_lastLoc.coordinate.longitude];
    
    [data setValue:lat forKey:@"lat"];
    [data setValue:lon forKey:@"long"];
    
    [[_functions HTTPSCallableWithName:@"getStopInstLoc"] callWithObject:@{@"location":data}
                                                              completion:^(FIRHTTPSCallableResult * _Nullable result, NSError * _Nullable error) {
                                                                  if (error) {
                                                                      if (error.domain == FIRFunctionsErrorDomain) {
                                                                          FIRFunctionsErrorCode code = error.code;
                                                                          NSString *message = error.localizedDescription;
                                                                          NSObject *details = error.userInfo[FIRFunctionsErrorDetailsKey];
                                                                          
                                                                          NSLog(message,details,code);
                                                                          return;
                                                                      }
                                                                      
                                                                  }
                                                                  [_map removeAnnotations:_map.annotations];
                                                                  for (NSDictionary *dict in result.data[@"pokestop"]){
                                                                      
                                                                      double latP = [ dict[@"latitude"] doubleValue];
                                                                      double lonP = [ dict[@"longitude"] doubleValue];
                                                                      CLLocationCoordinate2D position = CLLocationCoordinate2DMake(latP, lonP);
                                                                      MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                                                                      point.title = @"PokeStop";
                                                                      point.subtitle = dict[@"id"];
                                                                      point.coordinate = position;
                                                                      [_map addAnnotation:point];
                                                                      NSLog(@"%@", dict);
                                                                  }
                                                              }];
    
    
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([[annotation title] isEqualToString:@"Current Location"]) {
        return nil;
    }
    
    MKAnnotationView *annView = [[MKAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    
    
    CGRect rect = CGRectMake(0,0,75,75);
    UIGraphicsBeginImageContext( rect.size );
    UIImage *image = [ UIImage imageNamed: annotation.title ];
    [image drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    
    annView.image = img;
    
    annView.canShowCallout = YES;
    return annView;
}
@end
