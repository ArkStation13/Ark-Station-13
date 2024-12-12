// ARK STATION UI FILE
import { Feature } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const bloom_filter_level: Feature<string> = {
  name: 'Bloom Quality',
  category: 'GAMEPLAY',
  component: FeatureDropdownInput,
};
