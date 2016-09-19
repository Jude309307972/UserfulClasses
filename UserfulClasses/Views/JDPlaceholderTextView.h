//
//  JDPlaceholderTextView.h
//  UserfulClasses
//
//  Created by Jude on 16/9/19.
//  Copyright © 2016年 Jude. All rights reserved.
//

#import <UIKit/UIKit.h>

// 有占位文字的textView
@interface JDPlaceholderTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
