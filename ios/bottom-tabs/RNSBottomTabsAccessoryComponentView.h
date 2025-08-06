#import "RNSBottomTabsAccessoryEventEmitter.h"
#import "RNSReactBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RNSBottomTabsAccessoryComponentView : RNSReactBaseView

@end

#pragma mark - Props

/**
 * Properties set on component in JavaScript.
 */
@interface RNSBottomTabsAccessoryComponentView ()

@end

#pragma mark - Events

@interface RNSBottomTabsAccessoryComponentView ()

/**
 * Use returned object to emit appropriate React Events to Element Tree.
 */
- (nonnull RNSBottomTabsAccessoryEventEmitter *)reactEventEmitter;

@end

NS_ASSUME_NONNULL_END