import { useBackend, useSharedState } from '../backend';
import {
  Box,
  Button,
  Input,
  Knob,
  LabeledControls,
  LabeledList,
  Section,
  Stack,
  Tabs,
} from '../components';
import { Window } from '../layouts';

export const Jukebox = (props, context) => {
  const { act, data } = useBackend(context);
  const { active, track_selected, track_length, volume, repeat, songs } = data;
  const cost_for_play = 0;
  const is_emagged = false;
  const has_access = true;

  const SONGS_PER_PAGE = 25;

  const queued_tracks = data.queued_tracks || [];
  const [tab, setTab] = useSharedState('tab', 1);
  const [current_page, setPage] = useSharedState('current_page', 1);
  const [filteredSongs, setFilteredSongs] = useSharedState(
    'filteredSongs',
    songs,
  );
  const [filteredPages, setFilteredPages] = useSharedState(
    'filteredPages',
    Math.ceil(filteredSongs.length / SONGS_PER_PAGE),
  );

  return (
    <Window width={520} height={680}>
      <Window.Content overflowY="scroll">
        <Section
          fluid
          title="Настройки"
          buttons={
            // BLUEMOON EDIT
            <Box>
              <Button
                content={repeat ? 'Повтор' : '1 Раз'}
                selected={repeat}
                disabled={!has_access}
                onClick={() => act('repeat')}
              />
              <Button
                icon={active ? 'pause' : 'play'}
                content={active ? 'Стоп' : 'Играть'}
                selected={active}
                disabled={!has_access}
                onClick={() => act('toggle')}
              />
            </Box> // BLUEMOON EDIT END
          }
        >
          <Stack>
            <Stack.Item>
              <LabeledList>
                <LabeledList.Item label="Текущий трек">
                  {track_selected ? track_selected : 'Трек не выбран'}
                </LabeledList.Item>
                <LabeledList.Item label="Продолжительность">
                  {track_selected ? track_length : 'Трек не выбран'}
                </LabeledList.Item>
              </LabeledList>
            </Stack.Item>
            <Stack.Item>
              <LabeledControls justify="center">
                <LabeledControls.Item
                  position="relative"
                  label="Громкость"
                  right="4px"
                >
                  <Box position="relative">
                    <Knob
                      size={2.4}
                      color={volume > 750 ? 'red' : 'green'}
                      value={volume}
                      unit="%"
                      minValue={0}
                      maxValue={is_emagged ? 1000 : 100}
                      step={1}
                      stepPixelSize={1}
                      disabled={!has_access}
                      onDrag={(e, value) =>
                        act('set_volume', {
                          volume: value,
                        })
                      }
                    />
                    <Button
                      fluid
                      position="absolute"
                      top="67px"
                      right="66px"
                      color="transparent"
                      icon="fast-backward"
                      disabled={!has_access}
                      onClick={() =>
                        act('set_volume', {
                          volume: 'min',
                        })
                      }
                    />
                    <Button
                      fluid
                      position="absolute"
                      top="67px"
                      right="-14px"
                      color="transparent"
                      icon="fast-forward"
                      disabled={!has_access}
                      onClick={() =>
                        act('set_volume', {
                          volume: 'max',
                        })
                      }
                    />
                    <Button
                      fluid
                      position="absolute"
                      top="67px"
                      right="84px"
                      color="transparent"
                      icon="undo"
                      disabled={!has_access}
                      onClick={() =>
                        act('set_volume', {
                          volume: 'reset',
                        })
                      }
                    />
                  </Box>
                </LabeledControls.Item>
              </LabeledControls>
            </Stack.Item>
          </Stack>
          <LabeledList>
            <LabeledList.Item label="Цена добавления в очередь">
              {has_access ? 'Бесплатно' : cost_for_play + ' CR'}
            </LabeledList.Item>
          </LabeledList>
        </Section>

        <Tabs>
          <Tabs.Tab selected={tab === 1} onClick={() => setTab(1)}>
            Треки
          </Tabs.Tab>
          <Tabs.Tab selected={tab === 2} onClick={() => setTab(2)}>
            Очередь
          </Tabs.Tab>
          <Stack.Item grow />
          <Button
            color="transparent"
            icon="shuffle"
            tooltip="Случайная песня"
            onClick={() => act('random_song')}
          />
        </Tabs>
        {tab === 1 && (
          <Section fluid vertical>
            <Stack>
              <Stack.Item grow>
                <Input
                  fluid
                  autoFocus
                  placeholder="Найти треки..."
                  onChange={(e, query) => {
                    setPage(1);
                    if (query) {
                      setFilteredSongs(
                        songs.filter((track) =>
                          track.name
                            .toLowerCase()
                            .trim()
                            .includes(query.toLowerCase().trim()),
                        ),
                      );
                    } else {
                      setFilteredSongs(songs);
                    }
                    setFilteredPages(
                      Math.ceil(filteredSongs.length / SONGS_PER_PAGE),
                    );
                  }}
                />
              </Stack.Item>
            </Stack>

            <Section fluid>
              {filteredSongs && filteredSongs.length ? (
                <Tabs vertical style={{ 'pointer-events': 'none' }}>
                  {paginate(filteredSongs, SONGS_PER_PAGE, current_page).map(
                    (track) => (
                      <Tabs.Tab key={track}>
                        <Stack>
                          <Stack.Item grow>{track.name}</Stack.Item>
                          <Stack.Item grow>{track.length}</Stack.Item>
                          <Stack.Item>
                            <Button
                              icon="play"
                              content="В очередь"
                              style={{ 'pointer-events': 'auto' }}
                              onClick={() => {
                                act('add_to_queue', { track: track.name });
                              }}
                            />
                          </Stack.Item>
                        </Stack>
                      </Tabs.Tab>
                    ),
                  )}
                </Tabs>
              ) : (
                <Box textColor="gray" textAlign="center" mt={2}>
                  Треков нет
                </Box>
              )}
            </Section>
            {filteredPages > 1 ? (
              <Stack align="center" justify="center">
                <Stack.Item>
                  <Button
                    icon="chevron-left"
                    onClick={() =>
                      setPage(current_page - 1 < 1 ? 1 : current_page - 1)
                    }
                  />
                </Stack.Item>
                <Stack.Item>
                  Страница {current_page}/{filteredPages}
                </Stack.Item>
                <Stack.Item>
                  <Button
                    icon="chevron-right"
                    onClick={() =>
                      setPage(
                        current_page + 1 > filteredPages
                          ? filteredPages
                          : current_page + 1,
                      )
                    }
                  />
                </Stack.Item>
              </Stack>
            ) : (
              <Box />
            )}
          </Section>
        )}
        {tab === 2 && (
          <Section fluid>
            <Tabs vertical style={{ 'pointer-events': 'none' }}>
              {queued_tracks.map((song) => (
                <Tabs.Tab key={song}>{song}</Tabs.Tab>
              ))}
            </Tabs>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};

function paginate(array, page_size, page_number) {
  return array.slice((page_number - 1) * page_size, page_number * page_size);
}
