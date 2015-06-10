//
//  PreviewCell.m
//  StretchMyHeader
//
//  Created by Abegael Jackson on 2015-06-09.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import "PreviewCell.h"

@interface PreviewCell ()

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

@end

@implementation PreviewCell

#pragma mark - Accessors -

- (void)setObject:(NewsItem*)object {
    _object = object;
    
    [self configure];
}

#pragma mark - General methods -

- (void)configure {
    self.categoryLabel.text = self.object.category;
    self.headlineLabel.text = self.object.headline;
    self.categoryLabel.textColor = self.object.textColor;
}

@end
