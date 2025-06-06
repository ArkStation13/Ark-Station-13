import { sortBy } from 'common/collections';
import {
  ComponentType,
  createElement,
  ReactNode,
  useEffect,
  useState,
} from 'react';
import { useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  Dropdown,
  Input,
  NumberInput,
  Slider,
  Stack,
  TextArea, // NOVA EDIT ADDITION
} from 'tgui-core/components';
import { BooleanLike, classes } from 'tgui-core/react';

import { createSetPreference, PreferencesMenuData } from '../../types';
import { useServerPrefs } from '../../useServerPrefs';

export function sortChoices(array: [string, ReactNode][]) {
  return sortBy(array, ([name]) => name);
}

export type Feature<
  TReceiving,
  TSending = TReceiving,
  TServerData = undefined,
> = {
  name: string;
  component: FeatureValue<TReceiving, TSending, TServerData>;
  category?: string;
  description?: string;
  small_supplemental?: boolean;
};

/**
 * Represents a preference.
 * TReceiving = The type you will be receiving
 * TSending = The type you will be sending
 * TServerData = The data the server sends through preferences.json
 */
type FeatureValue<
  TReceiving,
  TSending = TReceiving,
  TServerData = undefined,
> = ComponentType<FeatureValueProps<TReceiving, TSending, TServerData>>;

export type FeatureValueProps<
  TReceiving,
  TSending = TReceiving,
  TServerData = undefined,
> = Readonly<{
  featureId: string;
  handleSetValue: (newValue: TSending) => void;
  serverData: TServerData | undefined;
  shrink?: boolean;
  value: TReceiving;
}>;

export function FeatureColorInput(props: FeatureValueProps<string>) {
  const { act } = useBackend<PreferencesMenuData>();
  const { featureId, shrink, value } = props;

  return (
    <Button
      onClick={() => {
        act('set_color_preference', {
          preference: featureId,
        });
      }}
    >
      <Stack align="center" fill>
        <Stack.Item>
          <Box
            style={{
              background: value.startsWith('#') ? value : `#${value}`,
              border: '2px solid white',
              boxSizing: 'content-box',
              height: '11px',
              width: '11px',
              ...(shrink
                ? {
                    margin: '1px',
                  }
                : {}),
            }}
          />
        </Stack.Item>

        {!shrink && <Stack.Item>Change</Stack.Item>}
      </Stack>
    </Button>
  );
}

export type FeatureToggle = Feature<BooleanLike, boolean>;

export function CheckboxInput(props: FeatureValueProps<BooleanLike, boolean>) {
  const { handleSetValue, value } = props;

  return (
    <Button.Checkbox
      checked={!!value}
      onClick={() => {
        handleSetValue(!value);
      }}
    />
  );
}

export function CheckboxInputInverse(
  props: FeatureValueProps<BooleanLike, boolean>,
) {
  const { handleSetValue, value } = props;

  return (
    <Button.Checkbox
      checked={!value}
      onClick={() => {
        handleSetValue(!value);
      }}
    />
  );
}

export const createDropdownInput = <T extends string | number = string>(
  // Map of value to display texts
  choices: Record<T, ReactNode>,
  dropdownProps?: Record<T, unknown>,
): FeatureValue<T> => {
  // ARK STATION EDIT
  return (props: FeatureValueProps<T>) => {
    const { handleSetValue, value } = props;

    return (
      <Dropdown
        selected={choices[value] as string}
        onSelected={handleSetValue}
        width="100%"
        options={sortChoices(Object.entries(choices)).map(
          ([dataValue, label]) => {
            return {
              displayText: label,
              value: dataValue,
            };
          },
        )}
        {...dropdownProps}
      />
    );
  };
};

export type FeatureChoicedServerData = {
  choices: string[];
  display_names?: Record<string, string>;
  icons?: Record<string, string>;
  extra_quirk_data?: Record<string, string>; // NOVA EDIT ADDITION
};

export type FeatureChoiced = Feature<string, string, FeatureChoicedServerData>;

const capitalizeFirstLetter = (text: string) =>
  text.toString().charAt(0).toUpperCase() + text.toString().slice(1);

export const StandardizedDropdown = (props: {
  choices: string[];
  disabled?: boolean;
  displayNames: Record<string, ReactNode>;
  onSetValue: (newValue: string) => void;
  value: string;
  buttons?: boolean;
}) => {
  const { choices, disabled, buttons, displayNames, onSetValue, value } = props;

  return (
    <Dropdown
      disabled={disabled}
      buttons={buttons}
      selected={value}
      onSelected={onSetValue}
      width="100%"
      displayText={displayNames[value]}
      options={choices.map((choice) => {
        return {
          displayText: displayNames[choice],
          value: choice,
        };
      })}
    />
  );
};

export const FeatureButtonedDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData> & {
    disabled?: boolean;
  },
) => {
  return <FeatureDropdownInput disabled={props.disabled} buttons {...props} />;
};

export const FeatureDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData> & {
    disabled?: boolean;
    buttons?: boolean;
  },
) => {
  const serverData = props.serverData;
  if (!serverData) {
    return null;
  }

  const displayNames =
    serverData.display_names ||
    Object.fromEntries(
      serverData.choices.map((choice) => [
        choice,
        capitalizeFirstLetter(choice),
      ]),
    );

  return serverData.choices.length > 7 ? (
    <StandardizedDropdown
      choices={sortBy(serverData.choices)}
      disabled={props.disabled}
      buttons={props.buttons}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
    />
  ) : (
    <StandardizedChoiceButtons
      choices={sortBy(serverData.choices)}
      disabled={props.disabled}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
    />
  );
};

export const FeatureForcedDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData> & {
    disabled?: boolean;
    buttons?: boolean;
  },
) => {
  const serverData = props.serverData;
  if (!serverData) {
    return null;
  }

  const displayNames =
    serverData.display_names ||
    Object.fromEntries(
      serverData.choices.map((choice) => [
        choice,
        capitalizeFirstLetter(choice),
      ]),
    );

  return (
    <StandardizedDropdown
      choices={sortBy(serverData.choices)}
      disabled={props.disabled}
      buttons={props.buttons}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value}
    />
  );
};

export type FeatureWithIcons<T> = Feature<
  // ARK STATION EDIT
  { value: T },
  T,
  FeatureChoicedServerData
>;

export const FeatureIconnedDropdownInput = (
  // ARK STATION EDIT
  props: FeatureValueProps<
    {
      value: string;
    },
    string,
    FeatureChoicedServerData
  > & {
    buttons?: boolean;
  },
) => {
  const serverData = props.serverData;
  if (!serverData) {
    return null;
  }

  const icons = serverData.icons;

  const textNames =
    serverData.display_names ||
    Object.fromEntries(
      serverData.choices.map((choice) => [
        choice,
        capitalizeFirstLetter(choice),
      ]),
    );

  const displayNames = Object.fromEntries(
    Object.entries(textNames).map(([choice, textName]) => {
      let element: ReactNode = textName;

      if (icons && icons[choice]) {
        const icon = icons[choice];
        element = (
          <Stack>
            <Stack.Item>
              <Box
                className={classes(['preferences32x32', icon])}
                style={{
                  transform: 'scale(0.8)',
                }}
              />
            </Stack.Item>

            <Stack.Item grow>{element}</Stack.Item>
          </Stack>
        );
      }

      return [choice, element];
    }),
  );

  return (
    <StandardizedDropdown
      buttons={props.buttons}
      choices={sortBy(serverData.choices)}
      displayNames={displayNames}
      onSetValue={props.handleSetValue}
      value={props.value.value}
    />
  );
};

export const StandardizedChoiceButtons = (props: {
  choices: string[];
  disabled?: boolean;
  displayNames: Record<string, ReactNode>;
  onSetValue: (newValue: string) => void;
  value?: string;
}) => {
  const { choices, disabled, displayNames, onSetValue, value } = props;
  return (
    <>
      {choices.map((choice) => (
        <Button
          key={choice}
          content={displayNames[choice]}
          selected={choice === value}
          disabled={disabled}
          onClick={() => onSetValue(choice)}
        />
      ))}
    </>
  );
};

export type HexValue = {
  lightness: number;
  value: string;
};
export type FeatureNumericData = {
  minimum: number;
  maximum: number;
  step: number;
};

export type FeatureNumeric = Feature<number, number, FeatureNumericData>;

export function FeatureNumberInput(
  props: FeatureValueProps<number, number, FeatureNumericData>,
) {
  const { serverData, handleSetValue, value } = props;

  return (
    <NumberInput
      onChange={(value) => handleSetValue(value)}
      disabled={!serverData}
      minValue={serverData?.minimum || 0}
      maxValue={serverData?.maximum || 100}
      step={serverData?.step || 1}
      value={value}
    />
  );
}

export function FeatureSliderInput(
  props: FeatureValueProps<number, number, FeatureNumericData>,
) {
  const { serverData, handleSetValue, value } = props;

  return (
    <Slider
      onChange={(e, value) => {
        handleSetValue(value);
      }}
      disabled={!serverData}
      minValue={serverData?.minimum || 0}
      maxValue={serverData?.maximum || 100}
      step={serverData?.step || 1}
      value={value}
      stepPixelSize={10}
    />
  );
}

type FeatureValueInputProps = {
  feature: Feature<unknown>;
  featureId: string;
  shrink?: boolean;
  value: unknown;
};

export function FeatureValueInput(props: FeatureValueInputProps) {
  const { act, data } = useBackend<PreferencesMenuData>();

  const feature = props.feature;

  const [predictedValue, setPredictedValue] = useState(props.value);

  function changeValue(newValue: unknown) {
    setPredictedValue(newValue);
    createSetPreference(act, props.featureId)(newValue);
  }

  useEffect(() => {
    setPredictedValue(props.value);
  }, [data.active_slot, props.value]);

  const serverData = useServerPrefs();

  return createElement(feature.component, {
    featureId: props.featureId,
    serverData: serverData?.[props.featureId] as any,
    shrink: props.shrink,
    handleSetValue: changeValue,
    value: predictedValue,
  });
}

type FeatureShortTextData = {
  maximum_length: number;
};

export function FeatureShortTextInput(
  props: FeatureValueProps<string, string, FeatureShortTextData>,
) {
  const { serverData, value, handleSetValue } = props;

  return (
    <Input
      disabled={!serverData}
      fluid
      value={value}
      maxLength={serverData?.maximum_length}
      onBlur={handleSetValue}
    />
  );
}
// NOVA EDIT ADDITION START - NOVA FEATURES DOWN HERE
export const FeatureTextInput = (
  props: FeatureValueProps<string, string, FeatureShortTextData>,
) => {
  const { serverData, handleSetValue, value } = props;

  if (!serverData) {
    return <Box>Loading...</Box>;
  }

  return (
    <TextArea
      height="100px"
      fluid
      expensive
      value={value}
      maxLength={serverData?.maximum_length}
      onChange={(value) => handleSetValue(value)}
    />
  );
};

export const FeatureTriColorInput = (props: FeatureValueProps<string[]>) => {
  const { act } = useBackend<PreferencesMenuData>();
  const { featureId, shrink, value } = props;

  const buttonFromValue = (index) => {
    return (
      <Stack.Item>
        <Button
          onClick={() => {
            act('set_tricolor_preference', {
              preference: featureId,
              value: index + 1,
            });
          }}
        >
          <Stack align="center" fill>
            <Stack.Item>
              <Box
                style={{
                  background: value[index].startsWith('#')
                    ? value[index]
                    : `#${value[index]}`,
                  border: '2px solid white',
                  boxSizing: 'content-box',
                  height: '11px',
                  width: '11px',
                  ...(shrink
                    ? {
                        margin: '1px',
                      }
                    : {}),
                }}
              />
            </Stack.Item>

            {!shrink && <Stack.Item>Change</Stack.Item>}
          </Stack>
        </Button>
      </Stack.Item>
    );
  };
  return (
    <Stack align="center" fill>
      {buttonFromValue(0)}
      {buttonFromValue(1)}
      {buttonFromValue(2)}
    </Stack>
  );
};

export const FeatureTriBoolInput = (props: FeatureValueProps<boolean[]>) => {
  const { handleSetValue, value } = props;

  const buttonFromValue = (index) => {
    return (
      <Stack.Item align="center">
        <Button.Checkbox
          checked={!!value[index]}
          onClick={() => {
            const currentValue = [...value];
            currentValue[index] = !currentValue[index];
            handleSetValue(currentValue);
          }}
        />
      </Stack.Item>
    );
  };
  return (
    <Stack align="center" fill>
      {buttonFromValue(0)}
      {buttonFromValue(1)}
      {buttonFromValue(2)}
    </Stack>
  );
};
// NOVA EDIT ADDITION END
