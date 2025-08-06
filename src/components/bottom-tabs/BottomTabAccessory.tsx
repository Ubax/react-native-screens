'use client';

import React, { useState } from 'react';
import NativeBottomAccessory, {
  type NativeProps,
} from '../../fabric/bottom-tabs/BottomTabAccessoryNativeComponent';
import { Platform, StyleSheet } from 'react-native';

export function BottomTabsAccessory(props: Omit<NativeProps, 'onSizeChange'>) {
  const [size, setSize] = useState({ width: 0, height: 0 });
  console.log('BottomAccessory render', size);
  if (Platform.OS !== 'ios') {
    return null;
  }
  return (
    <NativeBottomAccessory
      {...props}
      style={[
        props.style,
        styles.accessory,
        { width: size.width, height: size.height },
      ]}
      onSizeChange={({ nativeEvent: { width, height } }) => {
        setSize({ width, height });
      }}
    />
  );
}

const styles = StyleSheet.create({
  accessory: {
    position: 'absolute',
  },
});
