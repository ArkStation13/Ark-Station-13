// THIS IS A NOVA SECTOR UI FILE
import { CheckboxInput, FeatureToggle } from '../../base'; // ARK STATION EDIT

export const soulcatcher_join_action: FeatureToggle = {
  name: 'Enable soulcatcher notifications', // ARK STATION EDIT
  category: 'GHOST',
  description:
    'Toggles whether you wish to have the action to join a soulcatcher as a ghost shown to you. You still have access to the verb regardless.',
  component: CheckboxInput,
};
