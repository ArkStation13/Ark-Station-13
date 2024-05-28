// THIS IS A NOVA SECTOR UI FILE
import { clamp } from 'common/math';
import { useState } from 'react';

import { useBackend } from '../backend';
import {
  BlockQuote,
  Box,
  Button,
  Collapsible,
  Dropdown,
  Flex,
  Icon,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
  Stack,
  Tabs,
} from '../components';
import { Table, TableCell } from '../components/Table';
import { Window } from '../layouts';

class Interaction {
  categories = [];
  interactions;
  descriptions;
  colors;
  lewd_slots: LewdSlot[];
  target_lewd_slots: LewdSlot[];
  self;
  ref_self;
  ref_user;
  ref_target;
  block_interact;
  isTargetSelf: boolean;
  interactingWith: string;
  selfAttributes: string[];
  theirAttributes: string[];
  SelfPoloska: number[];
  TargetPoloska: number[];
  genitals: GenitalData[];
}

const PoloskiName = ['Arousal', 'Pleasure', 'Pain'];

type IconsForClothesVisible = {
  choices: string[];
};

// type GenitalInfo = {
//   genitals: GenitalData[];
// };

type GenitalData = {
  name: string;
  key: string;
  visibility: string;
  possible_choices: IconsForClothesVisible[];
  can_arouse: number;
  arousal_state: number;
};

type CharacterPrefsInfo = {
  erp_pref: string;
  noncon_pref: string;
  vore_pref: string;
  erp_status_mechanics: string;
  erp_sexuality: string;
  erp_status_hypno: string;

  erp_pref_list: string[];
  noncon_pref_list: string[];
  vore_pref_list: string[];
  erp_status_mechanics_list: string[];
  erp_sexuality_list: string[];
  erp_status_hypno_list: string[];
};

class LewdSlot {
  img;
  name;
}

export const InteractionMenuArk = () => {
  const { act, data } = useBackend<Interaction>();
  const {
    interactingWith,
    isTargetSelf,
    selfAttributes,
    theirAttributes,
    SelfPoloska,
    TargetPoloska,
    ref_user,
  } = data;
  const [tabIndex, setTabIndex] = useState(0);

  return (
    <Window theme="sex" width={470} height={730}>
      <Window.Content>
        <Section
          title={interactingWith}
          position="absolute"
          overflow="hidden"
          right="6px"
          left="6px"
          bottom={clamp(innerHeight - 390, 5, Infinity) + 'px'}
          top="6px"
          buttons={
            <Button
              color={'purple'}
              icon="tshirt"
              onClick={() =>
                act('underwear_change', {
                  userref: ref_user,
                })
              }
            />
          }
        >
          <Table>
            <Section
              position="absolute"
              bottom="-180px"
              top="6px"
              right="6px"
              left="6px"
              overflow="auto"
            >
              <Table.Row>
                <Table.Cell
                  width={
                    isTargetSelf
                      ? innerWidth - 10 + 'px'
                      : innerWidth - 220 + 'px'
                  }
                >
                  <BlockQuote>
                    You...
                    <br />
                    {theirAttributes.map((attribute) => (
                      <Box key={attribute}>
                        {attribute}
                        <br />
                      </Box>
                    ))}
                  </BlockQuote>
                </Table.Cell>
                {!isTargetSelf ? (
                  <Table.Cell width={innerWidth - 220 + 'px'}>
                    <BlockQuote>
                      They...
                      <br />
                      {selfAttributes.map((attribute) => (
                        <Box key={attribute}>
                          {attribute}
                          <br />
                        </Box>
                      ))}
                    </BlockQuote>
                  </Table.Cell>
                ) : null}
              </Table.Row>
            </Section>
          </Table>
        </Section>

        <Section
          position="absolute"
          bottom="6px"
          right="6px"
          left="6px"
          top="262px"
          overflow="hidden"
        >
          <Stack fill>
            <Stack.Item grow>
              <LabeledList>
                {TargetPoloska.map((targetpoloska, index) => (
                  <LabeledList.Item
                    key={PoloskiName[index]}
                    label={PoloskiName[index]}
                  >
                    <ProgressBar
                      mt={'0.5px'}
                      mb={'3px'}
                      minValue={0}
                      maxValue={100}
                      ranges={{
                        purple: [67, 100],
                        violet: [34, 66],
                        blue: [0, 33],
                      }}
                      value={targetpoloska}
                    />
                  </LabeledList.Item>
                ))}
              </LabeledList>
            </Stack.Item>

            {!isTargetSelf ? (
              <Stack.Item grow>
                {SelfPoloska.map((selfpoloska, index) => (
                  <Box key={selfpoloska[index]}>
                    <ProgressBar
                      mt={'0.5px'}
                      mb={'8.76px'}
                      minValue={0}
                      maxValue={100}
                      ranges={{
                        purple: [67, 100],
                        violet: [34, 66],
                        blue: [0, 33],
                      }}
                      value={selfpoloska}
                    />
                  </Box>
                ))}
              </Stack.Item>
            ) : null}
          </Stack>
          <Tabs fluid textAlign="center">
            <Tabs.Tab selected={tabIndex === 0} onClick={() => setTabIndex(0)}>
              Interactions
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 1} onClick={() => setTabIndex(1)}>
              Genital Options
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 2} onClick={() => setTabIndex(2)}>
              Genital Slots
            </Tabs.Tab>
            <Tabs.Tab selected={tabIndex === 3} onClick={() => setTabIndex(3)}>
              Character Prefs
            </Tabs.Tab>
          </Tabs>
          {(tabIndex === 0 && <InteractionsTab />) ||
            (tabIndex === 1 && <GenitalTab />) ||
            (tabIndex === 2 && <GenitalSlotsTab />) ||
            (tabIndex === 3 && <CharacterPrefsTab />)}
        </Section>
      </Window.Content>
    </Window>
  );
};

const InteractionsTab = (props) => {
  const { act, data } = useBackend<Interaction>();
  const {
    categories = [],
    interactions,
    descriptions,
    colors,
    block_interact,
    ref_self,
    ref_user,
  } = data;
  return (
    <Stack fill vertical>
      <Section key="interactions" title={'Interactions'}>
        {(block_interact && <NoticeBox>Unable to Interact</NoticeBox>) || (
          <NoticeBox>Able to Interact</NoticeBox>
        )}
        <Stack fill vertical>
          <Section key="interactions">
            {categories.map((category) => (
              <Collapsible key={category} title={category}>
                <Section fill>
                  {interactions[category].map((interaction) => (
                    <Button
                      fluid
                      key={interaction}
                      width={'auto'}
                      lineHeight={1.75}
                      disabled={block_interact}
                      color={block_interact ? 'grey' : colors[interaction]}
                      tooltip={descriptions[interaction]}
                      icon="exclamation-circle"
                      onClick={() =>
                        act('interact', {
                          interaction: interaction,
                          selfref: ref_self,
                          userref: ref_user,
                        })
                      }
                    >
                      {interaction}
                    </Button>
                  ))}
                </Section>
              </Collapsible>
            ))}
          </Section>
        </Stack>
      </Section>
    </Stack>
  );
};

const GenitalTab = () => {
  const { act, data } = useBackend<Interaction>();
  const { ref_user, genitals } = data;
  return (
    <Stack scrollable vertical>
      <Flex direction="column">
        {genitals.map((genital) => (
          <Section key={genital.key} title={genital.name} textAlign="center">
            <Table>
              <TableCell width="50%" textAlign="center">
                Visibility
                <br />
                {genital.possible_choices.map((choice) => (
                  <Button
                    align={'left'}
                    width={'150px'}
                    key={choice[0]}
                    icon={choice[1]}
                    color={
                      genital.visibility === choice[0] ? 'green' : 'default'
                    }
                    onClick={() =>
                      act('genital', {
                        genital: genital.key,
                        userref: ref_user,
                        visibility: choice,
                      })
                    }
                  >
                    {choice[0]}
                  </Button>
                ))}
              </TableCell>
              <TableCell textAlign="center">
                Actions
                <br />
                <Button
                  width="49%"
                  key={genital.arousal_state}
                  tooltip={
                    genital.can_arouse
                      ? (genital.arousal_state === 3 ? 'Unarouse' : 'Arouse') +
                        ' your ' +
                        genital.name.toLowerCase()
                      : 'You cannot modify arousal on your ' +
                        genital.name.toLowerCase()
                  }
                  icon={genital.arousal_state ? 'heart' : 'heart-broken'}
                  color={
                    genital.can_arouse
                      ? genital.arousal_state === 1
                        ? 'default'
                        : 'green'
                      : 'grey'
                  }
                  onClick={() =>
                    act('genital', {
                      genital: genital.key,
                      userref: ref_user,
                      set_arousal: genital.can_arouse
                        ? genital.arousal_state === 1
                          ? 3
                          : 1
                        : 0,
                    })
                  }
                />
              </TableCell>
            </Table>
          </Section>
        ))}
      </Flex>
    </Stack>
  );
};

const CharacterPrefsTab = () => {
  const { act, data } = useBackend<Interaction & CharacterPrefsInfo>();

  const {
    erp_pref,
    noncon_pref,
    vore_pref,
    erp_status_mechanics,
    erp_status_hypno,
    erp_pref_list,
    noncon_pref_list,
    erp_status_hypno_list,
    erp_status_mechanics_list,
    vore_pref_list,
    ref_user,
  } = data;
  return (
    <Stack fill>
      <Stack.Item basis="100%">
        <LabeledList>
          <LabeledList.Item label="ERP Preference">
            <Dropdown
              width="100%"
              selected={erp_pref}
              options={erp_pref_list}
              onSelected={(selected) =>
                act('erp_base', { erp_pref: selected, userref: ref_user })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="ERP NonCon Preference">
            <Dropdown
              width="100%"
              selected={noncon_pref}
              options={noncon_pref_list}
              onSelected={(selected) =>
                act('erp_base', { noncon_pref: selected, userref: ref_user })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="ERP Vore Preference">
            <Dropdown
              width="100%"
              selected={vore_pref}
              options={vore_pref_list}
              onSelected={(selected) =>
                act('erp_base', { vore_pref: selected, userref: ref_user })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="ERP Hypno Preference">
            <Dropdown
              width="100%"
              selected={erp_status_hypno}
              options={erp_status_hypno_list}
              onSelected={(selected) =>
                act('erp_base', {
                  erp_status_hypno: selected,
                  userref: ref_user,
                })
              }
            />
          </LabeledList.Item>
          <LabeledList.Item label="ERP Mechanics Preference">
            <Dropdown
              width="100%"
              selected={erp_status_mechanics}
              options={erp_status_mechanics_list}
              onSelected={(selected) =>
                act('erp_base', {
                  erp_status_mechanics: selected,
                  userref: ref_user,
                })
              }
            />
          </LabeledList.Item>
        </LabeledList>
      </Stack.Item>
    </Stack>
  );
};

const GenitalSlotsTab = () => {
  const { act, data } = useBackend<Interaction>();
  const { lewd_slots, ref_self, ref_user, target_lewd_slots } = data;
  return (
    <Stack fill vertical>
      {lewd_slots.length > 0 ? (
        <Section key="item_slots" title={'Self Lewd Slots'}>
          <Stack fill>
            {lewd_slots.map((element: LewdSlot) => {
              return (
                <Stack.Item key={element.name}>
                  <Stack>
                    <Stack.Item>
                      <Button
                        style={{
                          width: '100px',
                          height: '100px',
                        }}
                        content={
                          element.img ? (
                            <img
                              style={{}}
                              src={'data:image/png;base64,' + element.img}
                            />
                          ) : (
                            <Icon
                              style={{
                                margin: 'auto',
                                height: '100%',
                                width: '100%',
                                top: '20px',
                                right: '1px',
                              }}
                              name="venus-mars"
                              size={4.5}
                              position={'relative'}
                            />
                          )
                        }
                        onClick={() =>
                          act('remove_lewd_item', {
                            item_slot: element.name,
                            selfref: ref_self,
                            userref: ref_user,
                          })
                        }
                      />
                      <Box position={'absolute'} bold textAlign="center">
                        {element.name.toUpperCase()}
                      </Box>
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
              );
            })}
          </Stack>
        </Section>
      ) : (
        ''
      )}
      {target_lewd_slots.length > 0 ? (
        <Section key="item_slots" title={'Target Lewd Slots'}>
          <Stack fill>
            {target_lewd_slots.map((target_element: LewdSlot) => {
              return (
                <Stack.Item key={target_element.name}>
                  <Stack>
                    <Stack.Item>
                      <Button
                        style={{
                          width: '100px',
                          height: '100px',
                        }}
                        content={
                          target_element.img ? (
                            <img
                              style={{}}
                              src={
                                'data:image/png;base64,' + target_element.img
                              }
                            />
                          ) : (
                            <Icon
                              style={{
                                margin: 'auto',
                                height: '100%',
                                width: '100%',
                                top: '20px',
                                right: '1px',
                              }}
                              name="venus-mars"
                              size={4.5}
                              position={'relative'}
                            />
                          )
                        }
                        onClick={() =>
                          act('remove_lewd_item', {
                            item_slot: target_element.name,
                            selfref: ref_self,
                            userref: ref_user,
                          })
                        }
                      />
                      <Box position={'absolute'} bold textAlign="center">
                        {target_element.name.toUpperCase()}
                      </Box>
                    </Stack.Item>
                  </Stack>
                </Stack.Item>
              );
            })}
          </Stack>
        </Section>
      ) : ref_user !== ref_self ? (
        <Box mt={'10px'} bold align={'center'}>
          Target has no organs or Ckey.
        </Box>
      ) : (
        ''
      )}
    </Stack>
  );
};
