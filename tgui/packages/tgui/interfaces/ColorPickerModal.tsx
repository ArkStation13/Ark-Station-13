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
import { Window } from '../layouts';
import { InputButtons } from './common/InputButtons';
import { Loader } from './common/Loader';

type ColorPickerData = {
  autofocus: boolean;
  buttons: string[];
  message: string;
  large_buttons: boolean;
  swapped_buttons: boolean;
  timeout: number;
  title: string;
  default_color: string;
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

  // Инициализация начального цвета при монтировании
  useEffect(() => {
    if (!initialized) {
      setSelectedColor(hexToHsva(default_color));
      setInitialized(true);
    }
  }, [default_color, initialized, setSelectedColor]);

  return (
    <Window height={400} title={title} width={600} theme="generic">
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
          <Stack.Item>
            <InputButtons input={hsvaToHex(selectedColor)} />
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

  /** Escapes all non-hexadecimal characters including "#" */
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
