import { exhaustiveCheck } from 'common/exhaustive';

import { useBackend } from '../../backend';
import { CharacterPreferenceWindow } from './ArkStation/CharacterPreferenceWindow';
import { GamePreferenceWindow } from './ArkStation/GamePreferenceWindow';
import {
  GamePreferencesSelectedPage,
  PreferencesMenuData,
  Window,
} from './data';

export const PreferencesMenu = (props) => {
  const { data } = useBackend<PreferencesMenuData>();

  const window = data.window;

  switch (window) {
    case Window.Character:
      return <CharacterPreferenceWindow />;
    case Window.Game:
      return <GamePreferenceWindow />;
    case Window.Keybindings:
      return (
        <GamePreferenceWindow
          startingPage={GamePreferencesSelectedPage.Keybindings}
        />
      );
    default:
      exhaustiveCheck(window);
  }
};
