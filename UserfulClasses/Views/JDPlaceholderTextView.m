//
//  JDPlaceholderTextView.m
//  UserfulClasses
//
//  Created by Jude on 16/9/19.
//  Copyright © 2016年 Jude. All rights reserved.
//

#import "JDPlaceholderTextView.h"
#import "UIView+JDExtension.h"

@interface JDPlaceholderTextView ()
/** */
@property (nonatomic, weak) UILabel* placeholderLabel;
@end

@implementation JDPlaceholderTextView

- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.x = 4;
        label.y = 7;
        [self addSubview:label];
        _placeholderLabel = label;
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        self.font = [UIFont systemFontOfSize:15];
        self.placeholderColor = [UIColor grayColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textViewDidChange
{
    self.placeholderLabel.hidden = self.hasText; // 监听texview,有内容输入则隐藏占位label
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderLabel.width = self.width - self.placeholderLabel.x  * 2;
    [self.placeholderLabel sizeToFit];
}

#pragma mark - setter

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textViewDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textViewDidChange];
}

@end
