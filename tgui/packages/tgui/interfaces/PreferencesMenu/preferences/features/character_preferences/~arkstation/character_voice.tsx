import { Button, Stack } from 'tgui-core/components';

import { useBackend } from '../../../../../../backend';
import { PreferencesMenuData } from '../../../../types';
import {
  CheckboxInput,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureNumberInput,
  FeatureNumeric,
  FeatureToggle,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

const FeatureBlooperDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) => {
  const { act } = useBackend<PreferencesMenuData>();

  return (
    <Stack>
      <Stack.Item grow>
        <FeatureDropdownInput {...props} />
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={() => {
            act('play_blooper');
          }}
          icon="play"
          width="100%"
          height="100%"
        />
      </Stack.Item>
    </Stack>
  );
};

export const blooper_speech: FeatureChoiced = {
  name: 'Character Voice',
  component: FeatureBlooperDropdownInput,
};

export const blooper_speech_speed: FeatureNumeric = {
  name: 'Character Voice Speed',
  component: FeatureNumberInput,
};

export const blooper_speech_pitch: FeatureNumeric = {
  name: 'Character Voice Pitch',
  component: FeatureNumberInput,
};

export const blooper_pitch_range: FeatureNumeric = {
  name: 'Character Voice Range',
  component: FeatureNumberInput,
};

export const hear_sound_blooper: FeatureToggle = {
  name: 'Enable Other Characters Voices',
  category: 'SOUND',
  component: CheckboxInput,
};

export const send_sound_blooper: FeatureToggle = {
  name: 'Enable Your Character Voice',
  category: 'SOUND',
  component: CheckboxInput,
};
