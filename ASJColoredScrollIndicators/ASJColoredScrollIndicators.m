//
// ASJColoredScrollIndicators.m
//
// Copyright (c) 2016 Sudeep Jaiswal
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ASJColoredScrollIndicators.h"
#import <QuartzCore/CALayer.h>
#import <UIKit/UIImageView.h>
#import <UIKit/UIImage.h>
#import <objc/runtime.h>

static NSString *const kContentOffsetKeyPath = @"contentOffset";

#pragma mark - Private category

@interface UIScrollView (Private)

@property (copy, nonatomic) NSSet *scrollIndicators;

- (void)startListeningContentOffsetChanges;
- (void)inferScrollIndicators;
- (void)applyScrollIndicatorColor;
- (void)stopListeningContentOffsetChanges;

@end

@implementation UIScrollView (Private)

- (void)setScrollIndicators:(NSSet *)scrollIndicators
{
    objc_setAssociatedObject(self, @selector(scrollIndicators), scrollIndicators, OBJC_ASSOCIATION_RETAIN);
}

- (NSSet *)scrollIndicators
{
    return objc_getAssociatedObject(self, @selector(scrollIndicators));
}

#pragma mark - Content offset KVO

- (void)startListeningContentOffsetChanges
{
    [self addObserver:self forKeyPath:kContentOffsetKeyPath options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:kContentOffsetKeyPath]) {
        return;
    }
    
    [self inferScrollIndicators];
    [self applyScrollIndicatorColor];
    [self stopListeningContentOffsetChanges];
}

- (void)inferScrollIndicators
{
    // infer subviews w/o indicators
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    NSSet *subviewsWithoutIndicator = [NSSet setWithArray:self.subviews];
    
    // infer subviews w/ indicators
    self.showsHorizontalScrollIndicator = YES;
    self.showsVerticalScrollIndicator = YES;
    NSMutableSet *subviewsWithIndicator = [NSMutableSet setWithArray:self.subviews];
    
    // filter common subviews
    [subviewsWithIndicator minusSet:subviewsWithoutIndicator];
    
    // all that remain are indicators
    self.scrollIndicators = [NSSet setWithSet:subviewsWithIndicator];
}

- (void)stopListeningContentOffsetChanges
{
    [self removeObserver:self forKeyPath:kContentOffsetKeyPath];
}

#pragma mark - Apply color

- (void)applyScrollIndicatorColor
{
    //
    // From iOS 13, the indicator is no longer an UIImageView
    // but of type "_UIScrollViewScrollIndicator" which is a subclass of UIView
    // https://stackoverflow.com/a/40890158
    //
    for (id object in self.scrollIndicators)
    {
        if ([object isKindOfClass:[UIImageView class]])
        {
            UIImageView *imageView = (UIImageView *)object;
            imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [self applyScrollIndicatorColorTo:imageView];
        }
        else
        {
            // https://stackoverflow.com/a/19088341
            NSString *className = @"X1VJU2Nyb2xsVmlld1Njcm9sbEluZGljYXRvcg==";
            NSData *data = [[NSData alloc] initWithBase64EncodedString:className options:0];
            NSString *decodedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            
            Class class = NSClassFromString(decodedString);
            if ([object isKindOfClass:class])
            {
                UIView *view = (UIView *)object;
                [self applyScrollIndicatorColorTo:view];
            }
        }
    }
}

- (void)applyScrollIndicatorColorTo:(__kindof UIView *)view
{
    view.tintColor = [UIColor clearColor];
    view.layer.cornerRadius = 1.5f;
    view.backgroundColor = self.scrollIndicatorColor;
}

@end

#pragma mark - Main category

@implementation UIScrollView (ColoredIndicators)

- (void)setScrollIndicatorColor:(UIColor *)scrollIndicatorColor
{
    // no need to do anything if nil color
    if (!scrollIndicatorColor) {
        return;
    }
    
    objc_setAssociatedObject(self, @selector(scrollIndicatorColor), scrollIndicatorColor, OBJC_ASSOCIATION_RETAIN);
    
    [self startListeningContentOffsetChanges];
}

- (UIColor *)scrollIndicatorColor
{
    return objc_getAssociatedObject(self, @selector(scrollIndicatorColor));
}

@end
