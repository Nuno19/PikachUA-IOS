//
//  TableCellTableViewCell.m
//  MapTest
//
//  Created by students@deti on 06/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import "TableCellTableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@implementation TableCell
- (void)displayContent:(UIImage*)image : (NSString*) label{
    _pokemonName.text = label;
    _pokemonImage.image = image;
}

@end
