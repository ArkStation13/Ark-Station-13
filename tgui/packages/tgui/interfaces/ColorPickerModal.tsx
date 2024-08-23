/**
 * @file
 * @copyright 2023 itsmeow
 * @license MIT
 */

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

export const ColorPickerModal = (props, context) => {
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
  context: any,
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
              <SaturationValue
                hsva={color}
                onChange={handleChange}
                className="react-colorful__saturation"
              />
              <Hue
                hue={color.h}
                onChange={handleChange}
                className="react-colorful__hue"
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
                <Hue
                  hue={color.h}
                  onChange={handleChange}
                  className="react-colorful__hue"
                />
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
                <Saturation
                  color={color}
                  onChange={handleChange}
                  className="react-colorful__saturation"
                />
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
                <Value
                  color={color}
                  onChange={handleChange}
                  className="react-colorful__value"
                />
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
                <RGBSlider
                  color={color}
                  onChange={handleChange}
                  target="r"
                  className="react-colorful__r"
                />
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
                <RGBSlider
                  color={color}
                  onChange={handleChange}
                  target="g"
                  className="react-colorful__g"
                />
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
                <RGBSlider
                  color={color}
                  onChange={handleChange}
                  target="b"
                  className="react-colorful__b"
                />
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

const HexColorInput = (props) => {
  const { prefixed, alpha, color, fluid, onChange, ...rest } = props;

  const escape = (value) =>
    value.replace(/([^0-9A-F]+)/gi, '').substring(0, alpha ? 8 : 6);

  const validate = (value) => validHex(value, alpha);

  return (
    <Box className={classes(['Input', fluid && 'Input--fluid'])}>
      <div className="Input__baseline">.</div>
      <input
        className="Input__input"
        value={prefixed ? `#${color}` : color}
        spellCheck="false"
        onInput={(e) => onChange(escape(e.currentTarget.value))}
        onBlur={(e) => {
          if (!validate(e.currentTarget.value)) {
            onChange(escape(color));
          }
        }}
      />
    </Box>
  );
};

const SaturationValue = ({ hsva, onChange, className }) => {
  const handleMove = (interaction) => {
    onChange({
      s: interaction.left * 100,
      v: 100 - interaction.top * 100,
    });
  };

  const handleKey = (offset) => {
    onChange({
      s: clamp(hsva.s + offset.left * 100, 0, 100),
      v: clamp(hsva.v - offset.top * 100, 0, 100),
    });
  };

  const containerStyle = {
    backgroundColor: `${hsvaToHslString({ h: hsva.h, s: 100, v: 100, a: 1 })}`,
  };

  return (
    <div
      className={classes([className, 'react-colorful__saturation_value'])}
      style={containerStyle}
    >
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

const Hue = ({ className, hue, onChange }) => {
  const handleMove = (interaction) => {
    onChange({ h: 360 * interaction.left });
  };

  const handleKey = (offset) => {
    onChange({
      h: clamp(hue + offset.left * 360, 0, 360),
    });
  };

  return (
    <div className={classes([className, 'react-colorful__hue'])}>
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

const Saturation = ({ className, color, onChange }) => {
  const handleMove = (interaction) => {
    onChange({ s: 100 * interaction.left });
  };

  const handleKey = (offset) => {
    onChange({
      s: clamp(color.s + offset.left * 100, 0, 100),
    });
  };

  return (
    <div className={classes([className, 'react-colorful__saturation'])}>
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

const Value = ({ className, color, onChange }) => {
  const handleMove = (interaction) => {
    onChange({ v: 100 * interaction.left });
  };

  const handleKey = (offset) => {
    onChange({
      v: clamp(color.v + offset.left * 100, 0, 100),
    });
  };

  return (
    <div className={classes([className, 'react-colorful__value'])}>
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
        aria-valuenow={Math.round(color.v)}
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

const RGBSlider = ({ className, color, onChange, target }) => {
  const rgb = hsvaToRgba(color);

  const setNewTarget = (value) => {
    rgb[target] = value;
    onChange(rgbaToHsva(rgb));
  };

  const handleMove = (interaction) => {
    setNewTarget(255 * interaction.left);
  };

  const handleKey = (offset) => {
    setNewTarget(clamp(rgb[target] + offset.left * 255, 0, 255));
  };

  const selected =
    target === 'r'
      ? `rgb(${Math.round(rgb.r)},0,0)`
      : target === 'g'
        ? `rgb(0,${Math.round(rgb.g)},0)`
        : `rgb(0,0,${Math.round(rgb.b)})`;

  return (
    <div className={classes([className, `react-colorful__${target}`])}>
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
