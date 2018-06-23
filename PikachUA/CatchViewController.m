//
//  CatchViewController.m
//  MapTest
//
//  Created by students@deti on 11/05/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "CatchViewController.h"

@interface CatchViewController ()

@end

@implementation CatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"Pokedex"];
    
    NSString *pokemon_name = @"Rattata";
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",pokemon_name] ];
    
    NSLog(@"%@", pokemon_name);
    
    _pokemon = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    //Pokedex *poke = self.pokemon[_pokemon[@"id"]];
    _cp.text = [[NSString alloc] initWithFormat:@"%d", arc4random() % 2000];
    _name.text = _pokemon.name;
    _image.image = [UIImage imageNamed:_pokemon.name];
    
        
    
    NSLog(@"%@", _pokemon);
    //_poked = _pokemon.pokemon_id;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doAction:(id)sender {
    
    if(_pokemon.catchRate.floatValue*100 > arc4random() % 100){
        NSLog(@"Got it!");
        PokemonInst *poke = [NSEntityDescription insertNewObjectForEntityForName:@"PokemonInst" inManagedObjectContext:_appDelegate.managedObjectContext];
        
        poke.nickname = _name.text;
        poke.id = [NSString stringWithFormat:@"%@_%u", _appDelegate.userID, arc4random() % 100000];
        poke.pokemon_id = _pokemon.id;
        poke.value = _cp.text;
        poke.image = _pokemon.image;
        
        [_appDelegate saveContext];
        
        _message.text = @"Got it!";
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
    }
    else{
        if(_pokemon.fleeRate.floatValue*100 > arc4random() % 100){
            NSLog(@"Oh no! It ran away!");
            _message.text = @"Oh no! It ran away!";
            UINavigationController *navigationController = self.navigationController;
            [navigationController popViewControllerAnimated:YES];
        }
    }
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
