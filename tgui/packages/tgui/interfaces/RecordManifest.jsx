// THIS IS A NOVA SECTOR UI FILE
import { Button, Icon, Section, Table, Tooltip } from 'tgui-core/components';
import { classes } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

const commandJobs = [
  'Donk Co. Manager', // ARK STATION EDIT
  'Head of Red Hawk', // ARK STATION EDIT
  'Tech Overseer', // ARK STATION EDIT
  'Scientific Director', // ARK STATION EDIT
  'Medtech Curator', // ARK STATION EDIT
  'Quartermaster',
  'Consul of the Solar Federation', // NOVA EDIT ADDITION // ARK STATION EDIT
  'Priest of Neo-Vatican',
];

export const RecordManifest = (props) => {
  const {
    data: { manifest, positions },
  } = useBackend();
  const { act } = useBackend();

  return (
    <Window title="All crew with information" width={450} height={500}>
      <Window.Content scrollable>
        {Object.entries(manifest).map(([dept, crew]) => (
          // ARK STATION EDIT BEGIN
          /*
          <Section className={'CrewManifest--' + dept} key={dept} title={dept}>
          */
          <Section
            className={'CrewManifest--' + dept.replaceAll(' ', '_')}
            key={dept}
            title={dept}
          >
            {/* ARK STATION EDIT END */}
            <Table>
              {Object.entries(crew).map(([crewIndex, crewMember]) => (
                <Table.Row key={crewIndex}>
                  <Table.Cell className={'CrewManifest__Cell'}>
                    {crewMember.name}
                  </Table.Cell>
                  <Table.Cell>
                    <Button
                      content="Show exploitables"
                      onClick={() =>
                        act('show_exploitables', {
                          exploitable_id: crewMember.name,
                        })
                      }
                    />
                    <Button
                      content="Show background"
                      onClick={() =>
                        act('show_background', {
                          background_id: crewMember.name,
                        })
                      }
                    />
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      'CrewManifest__Cell',
                      'CrewManifest__Icons',
                    ])}
                    collapsing
                  >
                    {positions[dept].exceptions.includes(crewMember.rank) && (
                      <Tooltip content="No position limit" position="bottom">
                        <Icon className="CrewManifest__Icon" name="infinity" />
                      </Tooltip>
                    )}
                    {crewMember.rank === 'Ark Commander' && (
                      <Tooltip content="Ark Commander" position="bottom">
                        <Icon
                          className={classes([
                            'CrewManifest__Icon',
                            'CrewManifest__Icon--Command',
                          ])}
                          name="star"
                        />
                      </Tooltip>
                    )}
                    {commandJobs.includes(crewMember.rank) && (
                      <Tooltip content="Member of command" position="bottom">
                        <Icon
                          className={classes([
                            'CrewManifest__Icon',
                            'CrewManifest__Icon--Command',
                            'CrewManifest__Icon--Chevron',
                          ])}
                          name="chevron-up"
                        />
                      </Tooltip>
                    )}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      'CrewManifest__Cell',
                      'CrewManifest__Cell--Rank',
                    ])}
                    collapsing
                  >
                    {crewMember.rank}
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        ))}
      </Window.Content>
    </Window>
  );
};
