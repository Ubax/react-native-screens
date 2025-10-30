import React from 'react';
import {
  enableFreeze,
  ScreenStack,
  ScreenStackItem,
} from 'react-native-screens';
import Colors from './src/shared/styling/Colors';
import { Pressable, View } from 'react-native';

enableFreeze(true);

function Checkers() {
  return (
    <View
      style={{
        flex: 1,
        backgroundColor: Colors.BlueDark100,
        padding: 16,
      }}>
      <View
        style={{
          flexDirection: 'row',
          flexWrap: 'wrap',
          flex: 1,
        }}>
        {Array.from({ length: 64 }).map((_, i) => (
          <View
            key={i}
            style={{
              width: `12.5%`,
              height: `12.5%`,
              backgroundColor:
                (Math.floor(i / 8) + i) % 2 === 0
                  ? Colors.White
                  : Colors.BlueDark140,
            }}
          />
        ))}
      </View>
    </View>
  );
}

export default function App() {
  const [count, setCount] = React.useState(1);
  const [secondViewState, setSecondViewState] = React.useState<
    'willAppear' | 'didAppear' | 'willDisappear' | 'didDisappear'
  >('didDisappear');
  const pressableRef = React.useRef<View>(null);
  console.log('Second view state:', secondViewState);
  return (
    <ScreenStack style={{ flex: 1 }}>
      <ScreenStackItem
        style={{
          flex: 1,
          backgroundColor: Colors.White,
          justifyContent: 'center',
          alignItems: 'center',
        }}
        screenId="1">
        <View
          style={{
            width: '100%',
            height: 200,
            alignItems: 'center',
            marginBottom: 20,
          }}
        />
        <Pressable
          ref={pressableRef}
          style={{
            width: 200,
            height: 400,
            marginLeft: 200,
            borderRadius: 12,
            backgroundColor: Colors.BlueLight20,
            justifyContent: 'center',
            alignItems: 'center',
            // display: secondViewState === 'didAppear' ? 'none' : 'flex',
          }}
          onPress={() => setCount(2)}>
          <Checkers />
        </Pressable>
      </ScreenStackItem>
      {count > 1 && (
        <ScreenStackItem
          style={{
            // flex: 1,
            backgroundColor: Colors.BlueLight20,
          }}
          contentStyle={{ flex: 1, backgroundColor: Colors.RedLight100 }}
          onWillAppear={() => setSecondViewState('willAppear')}
          onWillDisappear={() => setSecondViewState('willDisappear')}
          onDisappear={() => {
            setCount(1);
            setSecondViewState('didDisappear');
          }}
          onAppear={() => {
            setCount(2);
            setSecondViewState('didAppear');
          }}
          zoomTransitionViewNativeTag={pressableRef?.current?.__nativeTag}
          screenId="2">
          <Checkers />
        </ScreenStackItem>
      )}
    </ScreenStack>
  );
}
