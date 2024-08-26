import {
  hexToHsva,
  HsvaColor,
  hsvaToHex,
  hsvaToHslString,
  hsvaToRgba,
  rgbaToHsva,
  validHex,
} from 'common/color';
import { clamp } from 'common/math';
import { classes } from 'common/react';
import React, { FocusEvent, FormEvent, useEffect, useState } from 'react';
import { Interactive } from 'tgui/components/Interactive';
import { logger } from 'tgui/logging';

import { useBackend, useLocalState } from '../backend';
import {
  Autofocus,
  Box,
  Flex,
  NumberInput,
  Pointer,
  Section,
  Stack,
  Tooltip,
} from '../components';
import { Button } from '../components/Button';
import { Window } from '../layouts';
import { InputButtons } from './common/InputButtons';
import { Loader } from './common/Loader';

const colorGroups = {
  Red: [
    '#FFEBEE',
    '#FFCDD2',
    '#EF9A9A',
    '#E57373',
    '#EF5350',
    '#F44336',
    '#E53935',
    '#D32F2F',
    '#C62828',
    '#B71C1C',
    '#FF8A80',
    '#FF5252',
    '#FF1744',
    '#D50000',
  ],
  Pink: [
    '#FCE4EC',
    '#F8BBD0',
    '#F48FB1',
    '#F06292',
    '#EC407A',
    '#E91E63',
    '#D81B60',
    '#C2185B',
    '#AD1457',
    '#880E4F',
    '#FF80AB',
    '#FF4081',
    '#F50057',
    '#C51162',
  ],
  Purple: [
    '#F3E5F5',
    '#E1BEE7',
    '#CE93D8',
    '#BA68C8',
    '#AB47BC',
    '#9C27B0',
    '#8E24AA',
    '#7B1FA2',
    '#6A1B9A',
    '#4A148C',
    '#EA80FC',
    '#E040FB',
    '#D500F9',
    '#AA00FF',
  ],
  DeepPurple: [
    '#EDE7F6',
    '#D1C4E9',
    '#B39DDB',
    '#9575CD',
    '#7E57C2',
    '#673AB7',
    '#5E35B1',
    '#512DA8',
    '#4527A0',
    '#311B92',
    '#B388FF',
    '#7C4DFF',
    '#651FFF',
    '#6200EA',
  ],
  Indigo: [
    '#E8EAF6',
    '#C5CAE9',
    '#9FA8DA',
    '#7986CB',
    '#5C6BC0',
    '#3F51B5',
    '#3949AB',
    '#303F9F',
    '#283593',
    '#1A237E',
    '#8C9EFF',
    '#536DFE',
    '#3D5AFE',
    '#304FFE',
  ],
  Blue: [
    '#E3F2FD',
    '#BBDEFB',
    '#90CAF9',
    '#64B5F6',
    '#42A5F5',
    '#2196F3',
    '#1E88E5',
    '#1976D2',
    '#1565C0',
    '#0D47A1',
    '#82B1FF',
    '#448AFF',
    '#2979FF',
    '#2962FF',
  ],
  LightBlue: [
    '#E1F5FE',
    '#B3E5FC',
    '#81D4FA',
    '#4FC3F7',
    '#29B6F6',
    '#03A9F4',
    '#039BE5',
    '#0288D1',
    '#0277BD',
    '#01579B',
    '#80D8FF',
    '#40C4FF',
    '#00B0FF',
    '#0091EA',
  ],
  Cyan: [
    '#E0F7FA',
    '#B2EBF2',
    '#80DEEA',
    '#4DD0E1',
    '#26C6DA',
    '#00BCD4',
    '#00ACC1',
    '#0097A7',
    '#00838F',
    '#006064',
    '#84FFFF',
    '#18FFFF',
    '#00E5FF',
    '#00B8D4',
  ],
  Teal: [
    '#E0F2F1',
    '#B2DFDB',
    '#80CBC4',
    '#4DB6AC',
    '#26A69A',
    '#009688',
    '#00897B',
    '#00796B',
    '#00695C',
    '#004D40',
    '#A7FFEB',
    '#64FFDA',
    '#1DE9B6',
    '#00BFA5',
  ],
  Green: [
    '#E8F5E9',
    '#C8E6C9',
    '#A5D6A7',
    '#81C784',
    '#66BB6A',
    '#4CAF50',
    '#43A047',
    '#388E3C',
    '#2E7D32',
    '#1B5E20',
    '#B9F6CA',
    '#69F0AE',
    '#00E676',
    '#00C853',
  ],
  LightGreen: [
    '#F1F8E9',
    '#DCEDC8',
    '#C5E1A5',
    '#AED581',
    '#9CCC65',
    '#8BC34A',
    '#7CB342',
    '#689F38',
    '#558B2F',
    '#33691E',
    '#CCFF90',
    '#B2FF59',
    '#76FF03',
    '#64DD17',
  ],
  Lime: [
    '#F9FBE7',
    '#F0F4C3',
    '#E6EE9C',
    '#DCE775',
    '#D4E157',
    '#CDDC39',
    '#C0CA33',
    '#AFB42B',
    '#9E9D24',
    '#827717',
    '#F4FF81',
    '#EEFF41',
    '#C6FF00',
    '#AEEA00',
  ],
  Yellow: [
    '#FFFDE7',
    '#FFF9C4',
    '#FFF59D',
    '#FFF176',
    '#FFEE58',
    '#FFEB3B',
    '#FDD835',
    '#FBC02D',
    '#F9A825',
    '#F57F17',
    '#FFFF8D',
    '#FFFF00',
    '#FFEA00',
    '#FFD600',
  ],
  Amber: [
    '#FFF8E1',
    '#FFECB3',
    '#FFE082',
    '#FFD54F',
    '#FFCA28',
    '#FFC107',
    '#FFB300',
    '#FFA000',
    '#FF8F00',
    '#FF6F00',
    '#FFE57F',
    '#FFD740',
    '#FFC400',
    '#FFAB00',
  ],
  Orange: [
    '#FFF3E0',
    '#FFE0B2',
    '#FFCC80',
    '#FFB74D',
    '#FFA726',
    '#FF9800',
    '#FB8C00',
    '#F57C00',
    '#EF6C00',
    '#E65100',
    '#FFD180',
    '#FFAB40',
    '#FF9100',
    '#FF6D00',
  ],
  DeepOrange: [
    '#FBE9E7',
    '#FFCCBC',
    '#FFAB91',
    '#FF8A65',
    '#FF7043',
    '#FF5722',
    '#F4511E',
    '#E64A19',
    '#D84315',
    '#BF360C',
    '#FF9E80',
    '#FF6E40',
    '#FF3D00',
    '#DD2C00',
  ],
  Brown: [
    '#EFEBE9',
    '#D7CCC8',
    '#BCAAA4',
    '#A1887F',
    '#8D6E63',
    '#795548',
    '#6D4C41',
    '#5D4037',
    '#4E342E',
    '#3E2723',
  ],
  Gray: [
    '#FAFAFA',
    '#F5F5F5',
    '#EEEEEE',
    '#E0E0E0',
    '#BDBDBD',
    '#9E9E9E',
    '#757575',
    '#616161',
    '#424242',
    '#212121',
  ],
  BlueGray: [
    '#ECEFF1',
    '#CFD8DC',
    '#B0BEC5',
    '#90A4AE',
    '#78909C',
    '#607D8B',
    '#546E7A',
    '#455A64',
    '#37474F',
    '#263238',
  ],
  BlackWhite: ['#000000', '#FFFFFF'],
};

export const ColorPickerModal = (_, context) => {
  const { data } = useBackend<ColorPickerData>(context);
  const {
    timeout,
    message,
    title,
    autofocus,
    default_color = '#000000',
  } = data;
  const [selectedColor, setSelectedColor] = useLocalState<HsvaColor>(
    context,
    'color_picker_choice',
    hexToHsva(default_color),
  );
  const [initialized, setInitialized] = useState(false);
  const [showPalette, setShowPalette] = useState(false); // Для управления отображением палитры

  // Инициализация начального цвета при монтировании
  useEffect(() => {
    if (!initialized) {
      setSelectedColor(hexToHsva(default_color));
      setInitialized(true);
    }
  }, [default_color, initialized, setSelectedColor]);

  return (
    <Window
      height={showPalette ? 800 : 430}
      title={title}
      width={865}
      theme="generic"
    >
      {!!timeout && <Loader value={timeout} />}
      <Window.Content>
        <Stack fill vertical>
          {message && (
            <Stack.Item m={1}>
              <Section fill>
                <Box color="label" overflow="hidden">
                  {message}
                </Box>
              </Section>
            </Stack.Item>
          )}
          <Stack.Item grow>
            <Section fill>
              {!!autofocus && <Autofocus />}
              <ColorSelector
                color={selectedColor}
                setColor={setSelectedColor}
                defaultColor={default_color}
              />
            </Section>
          </Stack.Item>
          {showPalette && (
            <Stack.Item grow style={{ overflowY: 'auto', maxHeight: '300px' }}>
              <Section fill>
                <ColorPalette setColor={setSelectedColor} />
              </Section>
            </Stack.Item>
          )}
          <Stack.Item>
            <Flex justify="space-between">
              <InputButtons input={hsvaToHex(selectedColor)} />
              <Button
                onClick={() => setShowPalette(!showPalette)}
                color={showPalette ? 'red' : 'good'}
                style={{
                  marginLeft: '10px',
                  // right: '0.5em',
                  padding: '2px 20px',
                  minWidth: '150px',
                }}
              >
                {showPalette ? 'Скрыть палитру' : 'Показать палитру'}
              </Button>
            </Flex>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

export const ColorSelector = (
  {
    color,
    setColor,
    defaultColor,
  }: { color: HsvaColor; setColor: any; defaultColor: string },
  context,
) => {
  const handleChange = (params: Partial<HsvaColor>) => {
    setColor((current: HsvaColor) => {
      return Object.assign({}, current, params);
    });
  };

  const rgb = hsvaToRgba(color);
  const hexColor = hsvaToHex(color);

  return (
    <Flex direction="row">
      <Flex.Item mr={2}>
        <Stack vertical>
          <Stack.Item>
            <div className="react-colorful">
              <SaturationValue hsva={color} onChange={handleChange} />
              <Hue
                hue={color.h}
                onChange={handleChange}
                className="react-colorful__last-control"
              />
            </div>
          </Stack.Item>
          <Stack.Item>
            <Box inline width="100px" height="20px" textAlign="center">
              Current
            </Box>
            <Box inline width="100px" height="20px" textAlign="center">
              Previous
            </Box>
            <br />
            <Tooltip content={hexColor} position="bottom">
              <Box
                inline
                width="100px"
                height="30px"
                backgroundColor={hexColor}
              />
            </Tooltip>
            <Tooltip content={defaultColor} position="bottom">
              <Box
                inline
                width="100px"
                height="30px"
                backgroundColor={defaultColor}
              />
            </Tooltip>
          </Stack.Item>
        </Stack>
      </Flex.Item>
      <Flex.Item grow fontSize="15px" lineHeight="24px">
        <Stack vertical>
          <Stack.Item>
            <Stack>
              <Stack.Item>
                <Box textColor="label">Hex:</Box>
              </Stack.Item>
              <Stack.Item grow height="24px">
                <HexColorInput
                  fluid
                  color={hsvaToHex(color).substring(1)}
                  onChange={(value) => {
                    logger.info(value);
                    setColor(hexToHsva(value));
                  }}
                  prefixed
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Divider />
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">H:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <Hue hue={color.h} onChange={handleChange} />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={color.h}
                  callback={(_, v) => handleChange({ h: v })}
                  max={360}
                  unit="°"
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">S:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <Saturation color={color} onChange={handleChange} />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={color.s}
                  callback={(_, v) => handleChange({ s: v })}
                  unit="%"
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">V:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <Value color={color} onChange={handleChange} />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={color.v}
                  callback={(_, v) => handleChange({ v: v })}
                  unit="%"
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Divider />
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">R:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <RGBSlider color={color} onChange={handleChange} target="r" />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={rgb.r}
                  callback={(_, v) => {
                    rgb.r = v;
                    handleChange(rgbaToHsva(rgb));
                  }}
                  max={255}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">G:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <RGBSlider color={color} onChange={handleChange} target="g" />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={rgb.g}
                  callback={(_, v) => {
                    rgb.g = v;
                    handleChange(rgbaToHsva(rgb));
                  }}
                  max={255}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <Stack>
              <Stack.Item width="25px">
                <Box textColor="label">B:</Box>
              </Stack.Item>
              <Stack.Item grow>
                <RGBSlider color={color} onChange={handleChange} target="b" />
              </Stack.Item>
              <Stack.Item>
                <TextSetter
                  value={rgb.b}
                  callback={(_, v) => {
                    rgb.b = v;
                    handleChange(rgbaToHsva(rgb));
                  }}
                  max={255}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Flex.Item>
    </Flex>
  );
};

const TextSetter = ({
  value,
  callback,
  min = 0,
  max = 100,
  unit,
}: {
  value: number;
  callback: any;
  min?: number;
  max?: number;
  unit?: string;
}) => {
  return (
    <NumberInput
      width="70px"
      value={Math.round(value)}
      step={1}
      minValue={min}
      maxValue={max}
      onChange={callback}
      unit={unit}
    />
  );
};

interface HexColorInputProps
  extends Omit<ColorInputBaseProps, 'escape' | 'validate'> {
  /** Enables `#` prefix displaying */
  prefixed?: boolean;
  /** Allows `#rgba` and `#rrggbbaa` color formats */
  alpha?: boolean;
}

/** Adds "#" symbol to the beginning of the string */
const prefix = (value: string) => '#' + value;

export const HexColorInput = (props: HexColorInputProps) => {
  const { prefixed, alpha, color, fluid, onChange, ...rest } = props;

  /** Escapes all non-exadecimal characters including "#" */
  const escape = (value: string) =>
    value.replace(/([^0-9A-F]+)/gi, '').substring(0, alpha ? 8 : 6);

  /** Validates hexadecimal strings */
  const validate = (value: string) => validHex(value, alpha);

  return (
    <ColorInput
      {...rest}
      fluid={fluid}
      color={color}
      onChange={onChange}
      escape={escape}
      format={prefixed ? prefix : undefined}
      validate={validate}
    />
  );
};

interface ColorInputBaseProps {
  fluid?: boolean;
  color: string;
  onChange: (newColor: string) => void;
  /** Blocks typing invalid characters and limits string length */
  escape: (value: string) => string;
  /** Checks that value is valid color string */
  validate: (value: string) => boolean;
  /** Processes value before displaying it in the input */
  format?: (value: string) => string;
}

export const ColorInput: React.FC<ColorInputBaseProps> = (props) => {
  const [localValue, setLocalValue] = useState(props.escape(props.color));

  // Trigger `onChange` handler only if the input value is a valid color
  const handleInput = (e: FormEvent<HTMLInputElement>) => {
    const inputValue = props.escape(e.currentTarget.value);
    setLocalValue(inputValue);
  };

  // Take the color from props if the last typed color (in local state) is not valid
  const handleBlur = (e: FocusEvent<HTMLInputElement>) => {
    if (e.currentTarget) {
      if (!props.validate(e.currentTarget.value)) {
        setLocalValue(props.escape(props.color)); // return to default;
      } else {
        props.onChange(
          props.escape
            ? props.escape(e.currentTarget.value)
            : e.currentTarget.value,
        );
      }
    }
  };

  useEffect(() => {
    setLocalValue(props.escape(props.color));
  }, [props.color]);

  return (
    <Box className={classes(['Input', props.fluid && 'Input--fluid'])}>
      <div className="Input__baseline">.</div>
      <input
        className="Input__input"
        value={props.format ? props.format(localValue) : localValue}
        spellCheck="false" // the element should not be checked for spelling errors
        onInput={handleInput}
        onBlur={handleBlur}
      />
    </Box>
  );
};

const SaturationValue = ({ hsva, onChange }) => {
  const handleMove = (interaction: any) => {
    onChange({
      s: interaction.left * 100,
      v: 100 - interaction.top * 100,
    });
  };

  const handleKey = (offset: any) => {
    // Saturation and brightness always fit into [0, 100] range
    onChange({
      s: clamp(hsva.s + offset.left * 100, 0, 100),
      v: clamp(hsva.v - offset.top * 100, 0, 100),
    });
  };

  const containerStyle = {
    backgroundColor: `${hsvaToHslString({ h: hsva.h, s: 100, v: 100, a: 1 })} !important`,
  };

  return (
    <div className="react-colorful__saturation_value" style={containerStyle}>
      <Interactive
        onMove={handleMove}
        onKey={handleKey}
        aria-label="Color"
        aria-valuetext={`Saturation ${Math.round(hsva.s)}%, Brightness ${Math.round(hsva.v)}%`}
      >
        <Pointer
          className="react-colorful__saturation_value-pointer"
          top={1 - hsva.v / 100}
          left={hsva.s / 100}
          color={hsvaToHslString(hsva)}
        />
      </Interactive>
    </div>
  );
};

const Hue = ({
  className,
  hue,
  onChange,
}: {
  className?: string;
  hue: number;
  onChange: (newHue: { h: number }) => void;
}) => {
  const handleMove = (interaction: any) => {
    onChange({ h: 360 * interaction.left });
  };

  const handleKey = (offset: any) => {
    // Hue measured in degrees of the color circle ranging from 0 to 360
    onChange({
      h: clamp(hue + offset.left * 360, 0, 360),
    });
  };

  const nodeClassName = classes(['react-colorful__hue', className]);

  return (
    <div className={nodeClassName}>
      <Interactive
        onMove={handleMove}
        onKey={handleKey}
        aria-label="Hue"
        aria-valuenow={Math.round(hue)}
        aria-valuemax="360"
        aria-valuemin="0"
      >
        <Pointer
          className="react-colorful__hue-pointer"
          left={hue / 360}
          color={hsvaToHslString({ h: hue, s: 100, v: 100, a: 1 })}
        />
      </Interactive>
    </div>
  );
};

const Saturation = ({
  className,
  color,
  onChange,
}: {
  className?: string;
  color: HsvaColor;
  onChange: (newSaturation: { s: number }) => void;
}) => {
  const handleMove = (interaction: any) => {
    onChange({ s: 100 * interaction.left });
  };

  const handleKey = (offset: any) => {
    // Hue measured in degrees of the color circle ranging from 0 to 100
    onChange({
      s: clamp(color.s + offset.left * 100, 0, 100),
    });
  };

  const nodeClassName = classes(['react-colorful__saturation', className]);

  return (
    <div className={nodeClassName}>
      <Interactive
        style={{
          background: `linear-gradient(to right, ${hsvaToHslString({
            h: color.h,
            s: 0,
            v: color.v,
            a: 1,
          })}, ${hsvaToHslString({ h: color.h, s: 100, v: color.v, a: 1 })})`,
        }}
        onMove={handleMove}
        onKey={handleKey}
        aria-label="Saturation"
        aria-valuenow={Math.round(color.s)}
        aria-valuemax="100"
        aria-valuemin="0"
      >
        <Pointer
          className="react-colorful__saturation-pointer"
          left={color.s / 100}
          color={hsvaToHslString({ h: color.h, s: color.s, v: color.v, a: 1 })}
        />
      </Interactive>
    </div>
  );
};

const Value = ({
  className,
  color,
  onChange,
}: {
  className?: string;
  color: HsvaColor;
  onChange: (newValue: { v: number }) => void;
}) => {
  const handleMove = (interaction: any) => {
    onChange({ v: 100 * interaction.left });
  };

  const handleKey = (offset: any) => {
    onChange({
      v: clamp(color.v + offset.left * 100, 0, 100),
    });
  };

  const nodeClassName = classes(['react-colorful__value', className]);

  return (
    <div className={nodeClassName}>
      <Interactive
        style={{
          background: `linear-gradient(to right, ${hsvaToHslString({
            h: color.h,
            s: color.s,
            v: 0,
            a: 1,
          })}, ${hsvaToHslString({ h: color.h, s: color.s, v: 100, a: 1 })})`,
        }}
        onMove={handleMove}
        onKey={handleKey}
        aria-label="Value"
        aria-valuenow={Math.round(color.s)}
        aria-valuemax="100"
        aria-valuemin="0"
      >
        <Pointer
          className="react-colorful__value-pointer"
          left={color.v / 100}
          color={hsvaToHslString({ h: color.h, s: color.s, v: color.v, a: 1 })}
        />
      </Interactive>
    </div>
  );
};

const RGBSlider = ({
  className,
  color,
  onChange,
  target,
}: {
  className?: string;
  color: HsvaColor;
  onChange: (newValue: HsvaColor) => void;
  target: string;
}) => {
  const rgb = hsvaToRgba(color);

  const setNewTarget = (value: number) => {
    rgb[target] = value;
    onChange(rgbaToHsva(rgb));
  };

  const handleMove = (interaction: any) => {
    setNewTarget(255 * interaction.left);
  };

  const handleKey = (offset: any) => {
    setNewTarget(clamp(rgb[target] + offset.left * 255, 0, 255));
  };

  const nodeClassName = classes([`react-colorful__${target}`, className]);

  let selected =
    target === 'r'
      ? `rgb(${Math.round(rgb.r)},0,0)`
      : target === 'g'
        ? `rgb(0,${Math.round(rgb.g)},0)`
        : `rgb(0,0,${Math.round(rgb.b)})`;

  return (
    <div className={nodeClassName}>
      <Interactive
        onMove={handleMove}
        onKey={handleKey}
        aria-valuenow={rgb[target]}
        aria-valuemax="100"
        aria-valuemin="0"
      >
        <Pointer
          className={`react-colorful__${target}-pointer`}
          left={rgb[target] / 255}
          color={selected}
        />
      </Interactive>
    </div>
  );
};

const ColorPalette = ({ setColor }) => {
  return (
    <Flex wrap>
      {Object.keys(colorGroups).map((group) => (
        <Flex.Item key={group} m={1}>
          <Stack vertical>
            {colorGroups[group].map((color) => (
              <Tooltip key={color} content={color} position="bottom">
                <Box
                  width="20px"
                  height="20px"
                  backgroundColor={color}
                  m={0.5}
                  border="1px solid #ccc"
                  borderRadius="6px"
                  cursor="pointer"
                  onClick={() => setColor(hexToHsva(color))}
                />
              </Tooltip>
            ))}
          </Stack>
        </Flex.Item>
      ))}
    </Flex>
  );
};
