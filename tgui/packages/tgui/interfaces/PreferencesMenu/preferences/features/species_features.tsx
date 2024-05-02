import {
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureColorInput,
  FeatureDropdownInput, // ARK STATION EDIT
  FeatureValueProps,
} from './base'; // ARK STATION EDIT

export const eye_color: Feature<string> = {
  name: 'Eye Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Facial Hair Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Facial Hair Gradient', // ARK STATION EDIT
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Facial Hair Gradient Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Hair Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Hair Gradient', // ARK STATION EDIT
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const hair_gradient_color: Feature<string> = {
  name: 'Hair Gradient Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const feature_human_ears: FeatureChoiced = {
  name: 'Ears',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_human_tail: FeatureChoiced = {
  name: 'Tail',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_legs: FeatureChoiced = {
  name: 'Legs',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Spines',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_tail: FeatureChoiced = {
  name: 'Tail',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor: Feature<string> = {
  name: 'Mutant Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Underwear Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const bra_color: Feature<string> = {
  name: 'Bra Color', // ARK STATION EDIT
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Vampire Status', // ARK STATION EDIT
  component: FeatureDropdownInput,
};

export const heterochromatic: Feature<string> = {
  name: 'Heterochromatic (Right Eye) Color', // ARK STATION EDIT
  component: FeatureColorInput,
};
