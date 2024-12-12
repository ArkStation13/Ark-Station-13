import { Icon, Section, Table, Tooltip } from 'tgui-core/components';

import { classes } from '../../common/react';
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

export const CrewManifest = (props) => {
  const {
    data: { manifest, positions },
  } = useBackend();

  return (
    <Window title="Crew Manifest" width={350} height={500}>
      <Window.Content scrollable>
        {Object.entries(manifest).map(([dept, crew]) => (
          <Section
            className={'CrewManifest--' + dept}
            key={dept}
            title={
              dept +
              (dept !== 'Misc'
                ? ` (${positions[dept].open} positions open)`
                : '')
            }
          >
            <Table>
              {Object.entries(crew).map(([crewIndex, crewMember]) => (
                <Table.Row key={crewIndex}>
                  <Table.Cell
                    className={'CrewManifest__Cell'}
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%"
                  >
                    {crewMember.name}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      'CrewManifest__Cell',
                      'CrewManifest__Icons',
                    ])}
                    collapsing
                    minWidth="40px"
                    width="40px"
                  >
                    {positions[dept].exceptions.includes(crewMember.rank) && (
                      <Tooltip content="No position limit" position="bottom">
                        <Icon className="CrewManifest__Icon" name="infinity" />
                      </Tooltip>
                    )}
                    {crewMember.trim === 'Ark Commander' && (
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
                    {commandJobs.includes(crewMember.trim) && (
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
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%"
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
