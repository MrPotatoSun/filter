//
//  XKAFilterManger.h
//  AFilterDemo
//
//  Created by mac_leruan on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


typedef void(^aFilterImageBlock)(UIImage *image);
@interface XKAFilterManger : UIView

@property (nonatomic,copy)aFilterImageBlock aFilterImageBlock;
- (UIImage *)createImageWithImagePi:(UIImage *)inImage andColorMatrix:(const float *)f;

@end
