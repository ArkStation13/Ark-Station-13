import { exhaustiveCheck } from 'common/exhaustive';
import { useState } from 'react';

import { useBackend } from '../../../backend';
import { Button, Stack } from '../../../components';
import { Window } from '../../../layouts';
import { GamePreferencesSelectedPage, PreferencesMenuData } from '../data';
import { KeybindingsPage } from './../KeybindingsPage';
import { PageButton } from './../PageButton';
import { GamePreferencesPage } from './GamePreferencesPage';

export const GamePreferenceWindow = (props: {
  startingPage?: GamePreferencesSelectedPage;
}) => {
  const { act } = useBackend<PreferencesMenuData>();

  const [currentPage, setCurrentPage] = useState(
    props.startingPage ?? GamePreferencesSelectedPage.Settings,
  );

  let pageContents;

  switch (currentPage) {
    case GamePreferencesSelectedPage.Keybindings:
      pageContents = <KeybindingsPage />;
      break;
    case GamePreferencesSelectedPage.Settings:
      pageContents = <GamePreferencesPage />;
      break;
    default:
      exhaustiveCheck(currentPage);
  }

  return (
    <Window
      title="Game Preferences"
      width={1200}
      height={770}
      buttons={
        <>
          <Button
            icon="user"
            tooltip="Open Character Preferences"
            tooltipPosition="bottom"
            style={{ borderRadius: '20px' }}
            onClick={() => act('open_character_preferences')}
          />
          Settings are saved automatically
        </>
      }
    >
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Stack fill>
              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={GamePreferencesSelectedPage.Settings}
                  setPage={setCurrentPage}
                >
                  Settings
                </PageButton>
              </Stack.Item>

              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={GamePreferencesSelectedPage.Keybindings}
                  setPage={setCurrentPage}
                >
                  Keybindings
                </PageButton>
              </Stack.Item>
            </Stack>
          </Stack.Item>

          <Stack.Divider />

          <Stack.Item grow shrink basis="1px">
            {pageContents}
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
