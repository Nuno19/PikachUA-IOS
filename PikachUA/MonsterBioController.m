//
//  MonsterBioController.m
//  PikachUA
//
//  Created by students@deti on 07/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "MonsterBioController.h"

@interface MonsterBioController ()

@end

@implementation MonsterBioController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest= [[NSFetchRequest alloc] initWithEntityName:@"Pokedex"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"name == %@",_pokemon.nickname] ];
    
    _poked = [[_appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:nil ] mutableCopy][0];
    
    //Pokedex *poke = self.pokemon[_pokemon[@"id"]];
    _name.text = _pokemon.nickname;
    _cp.text = _pokemon.value;
    _image.image = [UIImage imageNamed:_pokemon.nickname];
    
    NSLog(@"%@", _poked);
    //_poked = _pokemon.pokemon_id;
    
    _height.text = [NSString stringWithFormat:@"Heigth: %@", _poked.height];
    _weight.text = [NSString stringWithFormat:@"Weigth: %@", _poked.weight];
    _pokedex.text = _poked.pokedex;
    [_pokedex sizeToFit];
    _nickname.text = _poked.nickname;
    
    // Do any additional setup after loading the view.
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

- (IBAction)trade:(id)sender {
}
@end
