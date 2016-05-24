//
//  UINavigationBar+JWNavigationBar.h
//  JWNavigationDemo
//
//  Created by szgw on 16/5/24.
//  Copyright © 2016年 JINWEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JWNavigationBar)
- (void)jwInitBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha;
- (void)jwSetBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha;
- (void)jwReset;
@end
