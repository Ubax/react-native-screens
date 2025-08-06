#import "RNSBottomTabsAccessoryEventEmitter.h"

#import <React/RCTConversions.h>
#import <React/RCTLog.h>
#if RCT_NEW_ARCH_ENABLED
#import <react/renderer/components/rnscreens/EventEmitters.h>
#endif // RCT_NEW_ARCH_ENABLED

#if RCT_NEW_ARCH_ENABLED
namespace react = facebook::react;
#endif // RCT_NEW_ARCH_ENABLED

@implementation RNSBottomTabsAccessoryEventEmitter {
#if RCT_NEW_ARCH_ENABLED
  std::shared_ptr<const react::RNSBottomTabsAccessoryEventEmitter> _reactEventEmitter;
#endif // RCT_NEW_ARCH_ENABLED
}

- (instancetype)init
{
  if (self = [super init]) {
#if RCT_NEW_ARCH_ENABLED
    _reactEventEmitter = nullptr;
#endif // RCT_NEW_ARCH_ENABLED
  }
  return self;
}

#if RCT_NEW_ARCH_ENABLED
- (void)updateEventEmitter:(const std::shared_ptr<const react::RNSBottomTabsAccessoryEventEmitter> &)emitter
{
  _reactEventEmitter = emitter;
}
#endif // RCT_NEW_ARCH_ENABLED

- (BOOL)emitOnTabAccessoryEnvironmentChange:(OnTabAccessoryEnvironmentChangePayload)payload
{
#if RCT_NEW_ARCH_ENABLED
  if (_reactEventEmitter != nullptr) {
    _reactEventEmitter->onTabAccessoryEnvironmentChange(
        {.accessoryEnvironment = RCTStringFromNSString(payload.accessoryEnvironment)});
    return true;
  } else {
    RCTLogWarn(@"[RNScreens] Skipped OnTabAccessoryEnvironmentChange event emission due to nullish emitter");
    return false;
  }
#else
  if (self.onTabAccessoryEnvironmentChange) {
    self.onTabAccessoryEnvironmentChange(@{@"accessoryEnvironment" : payload.accessoryEnvironment});
    return YES;
  } else {
    RCTLogWarn(@"[RNScreens] Skipped OnTabAccessoryEnvironmentChange event emission due to nullish emitter");
    return NO;
  }
#endif // RCT_NEW_ARCH_ENABLED
}

- (BOOL)emitOnSizeChange:(OnTabAccessorySizeChangePayload)payload
{
#if RCT_NEW_ARCH_ENABLED
  if (_reactEventEmitter != nullptr) {
    _reactEventEmitter->onSizeChange({.width = payload.width.doubleValue, .height = payload.height.doubleValue});
    return true;
  } else {
    RCTLogWarn(@"[RNScreens] Skipped OnTabAccessorySizeChange event emission due to nullish emitter");
    return false;
  }
#else
  if (self.onSizeChange) {
    self.onSizeChange(@{@"width" : payload.width, @"height" : payload.height});
    return YES;
  } else {
    RCTLogWarn(@"[RNScreens] Skipped OnTabAccessorySizeChange event emission due to nullish emitter");
    return NO;
  }
#endif // RCT_NEW_ARCH_ENABLED
}

@end