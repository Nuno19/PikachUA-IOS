//
//  CollectionCell.m
//  MapTest
//
//  Created by students@deti on 02/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell
- (void)displayContent:(UIImage*)image : (NSString*) label : (NSString*) label2{
    _pokemonName.text = label;
    _pokemonImage.image = image;
    _pokemonValue.text = label2;
}

@end
