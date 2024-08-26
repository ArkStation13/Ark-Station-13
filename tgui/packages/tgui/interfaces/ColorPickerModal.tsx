import {
  colorList,
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

import { useBackend } from '../backend';
import {
  Autofocus,
  Box,
  Button,
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

export const ColorPickerModal = () => {
  const { data } = useBackend<ColorPickerData>();
  const { timeout, message, autofocus, default_color = '#000000' } = data;
  let { title } = data;

  const [selectedColor, setSelectedColor] = useState<HsvaColor>(
    hexToHsva(default_color),
  );

  useEffect(() => {
    setSelectedColor(hexToHsva(default_color));
  }, [default_color]);

  if (!title) {
    title = 'Color';
  }

  return (
    <Window
      height={message ? 400 : 360}
      title={title}
      width={600}
      theme="generic"
    >
      {!!timeout && <Loader value={timeout} />}
      <Window.Content>
        <Stack fill vertical>
          {!!autofocus && <Autofocus />}
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

export const ColorPresets = ({ setColor, setShowPresets }) => {
  return (
    <>
      <Button
        onClick={() => setShowPresets(false)}
        position="absolute"
        right="4px"
        icon="arrow-left"
      />
      <Stack justify="center">
        <Stack.Item>
          {colorList.map((row, index) => {
            return (
              <Stack.Item key={index} width="100%">
                <Stack justify="center">
                  {row.map((entry) => {
                    return (
                      <Box key={entry} p="1px" backgroundColor="black">
                        <Box
                          key={entry}
                          p="1px"
                          backgroundColor="#AAAAAA"
                          onClick={() => setColor(hexToHsva(entry))}
                        >
                          <Box
                            onClick={() => setColor(hexToHsva(entry))}
                            backgroundColor={'#' + entry}
                            width="21px"
                            height="14px"
                          />
                        </Box>
                      </Box>
                    );
                  })}
                </Stack>
              </Stack.Item>
            );
          })}
        </Stack.Item>
      </Stack>
    </>
  );
};

export const ColorSelector = ({ color, setColor, defaultColor }) => {
  const handleChange = (params: Partial<HsvaColor>) => {
    setColor((current: HsvaColor) => {
      return { ...current, ...params };
    });
  };

  const [showPresets, setShowPresets] = useState<boolean>(false);
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
        {showPresets && (
          <ColorPresets
            setColor={handleChange}
            setShowPresets={setShowPresets}
          />
        )}
        {!showPresets && (
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
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    icon="eye-dropper"
                    onClick={() => setShowPresets(true)}
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
        )}
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

const HexColorInput = ({
  prefixed,
  alpha,
  color,
  fluid,
  onChange,
  ...rest
}: {
  prefixed?: boolean;
  alpha?: boolean;
  color: string;
  fluid?: boolean;
  onChange: (newColor: string) => void;
}) => {
  const escape = (value: string) =>
    value.replace(/([^0-9A-F]+)/gi, '').substring(0, alpha ? 8 : 6);
  const validate = (value: string) => validHex(value, alpha);

  const [localValue, setLocalValue] = useState(escape(color));

  // Обновляем localValue при изменении color
  useEffect(() => {
    setLocalValue(escape(color));
  }, [color]);

  const handleInput = (e: FormEvent<HTMLInputElement>) => {
    const inputValue = escape(e.currentTarget.value);
    setLocalValue(inputValue);
  };

  const handleBlur = (e: FocusEvent<HTMLInputElement>) => {
    if (!validate(e.currentTarget.value)) {
      setLocalValue(escape(color)); // return to default;
    } else {
      onChange(escape(e.currentTarget.value));
    }
  };

  return (
    <Box className={classes(['Input', fluid && 'Input--fluid'])}>
      <div className="Input__baseline">.</div>
      <input
        className="Input__input"
        value={localValue}
        spellCheck={false}
        onInput={handleInput}
        onBlur={handleBlur}
      />
    </Box>
  );
};

const ColorInput = ({
  fluid,
  color,
  onChange,
  escape,
  validate,
  format,
}: {
  fluid?: boolean;
  color: string;
  onChange: (newColor: string) => void;
  escape: (value: string) => string;
  validate: (value: string) => boolean;
  format?: (value: string) => string;
}) => {
  const [localValue, setLocalValue] = useState(escape(color));

  const handleInput = (e: FormEvent<HTMLInputElement>) => {
    const inputValue = escape(e.currentTarget.value);
    setLocalValue(inputValue);
  };

  const handleBlur = (e: FocusEvent<HTMLInputElement>) => {
    if (!validate(e.currentTarget.value)) {
      setLocalValue(escape(color)); // return to default;
    } else {
      onChange(escape(e.currentTarget.value));
    }
  };

  return (
    <Box className={classes(['Input', fluid && 'Input--fluid'])}>
      <div className="Input__baseline">.</div>
      <input
        className="Input__input"
        value={format ? format(localValue) : localValue}
        spellCheck={false}
        onInput={handleInput}
        onBlur={handleBlur}
      />
    </Box>
  );
};

const SaturationValue = ({ hsva, onChange }) => {
  const handleMove = (interaction: { left: number; top: number }) => {
    onChange({
      s: interaction.left * 100,
      v: 100 - interaction.top * 100,
    });
  };

  const handleKey = (offset: { left: number; top: number }) => {
    onChange({
      s: clamp(hsva.s + offset.left * 100, 0, 100),
      v: clamp(hsva.v - offset.top * 100, 0, 100),
    });
  };

  const containerStyle = {
    backgroundColor: hsvaToHslString({
      h: hsva.h,
      s: 100,
      v: 100,
      a: 1,
    }),
  };

  return (
    <div className="react-colorful__saturation_value" style={containerStyle}>
      <Interactive
        onMove={handleMove}
        onKey={handleKey}
        aria-label="Color"
        aria-valuetext={`Saturation ${Math.round(hsva.s)}%, Brightness ${Math.round(hsva.v)}%`}
      >
        {[
          <Pointer
            className="react-colorful__saturation_value-pointer"
            top={1 - hsva.v / 100}
            left={hsva.s / 100}
            color={hsvaToHslString(hsva)}
          />,
        ]}
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
  const handleMove = (interaction: { left: number }) => {
    onChange({ h: 360 * interaction.left });
  };

  const handleKey = (offset: { left: number }) => {
    onChange({ h: clamp(hue + offset.left * 360, 0, 360) });
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
        {[
          <Pointer
            className="react-colorful__hue-pointer"
            left={hue / 360}
            color={hsvaToHslString({ h: hue, s: 100, v: 100, a: 1 })}
          />,
        ]}
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
  const handleMove = (interaction: { left: number }) => {
    onChange({ s: 100 * interaction.left });
  };

  const handleKey = (offset: { left: number }) => {
    onChange({ s: clamp(color.s + offset.left * 100, 0, 100) });
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
        {[
          <Pointer
            className="react-colorful__saturation-pointer"
            left={color.s / 100}
            color={hsvaToHslString({
              h: color.h,
              s: color.s,
              v: color.v,
              a: 1,
            })}
          />,
        ]}
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
  const handleMove = (interaction: { left: number }) => {
    onChange({ v: 100 * interaction.left });
  };

  const handleKey = (offset: { left: number }) => {
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
        aria-valuenow={Math.round(color.v)}
        aria-valuemax="100"
        aria-valuemin="0"
      >
        {[
          <Pointer
            className="react-colorful__value-pointer"
            left={color.v / 100}
            color={hsvaToHslString({
              h: color.h,
              s: color.s,
              v: color.v,
              a: 1,
            })}
          />,
        ]}
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
  target: 'r' | 'g' | 'b';
}) => {
  const rgb = hsvaToRgba(color);

  const setNewTarget = (value: number) => {
    rgb[target] = value;
    onChange(rgbaToHsva(rgb));
  };

  const handleMove = (interaction: { left: number }) => {
    setNewTarget(255 * interaction.left);
  };

  const handleKey = (offset: { left: number }) => {
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
        aria-valuemax="255"
        aria-valuemin="0"
      >
        {[
          <Pointer
            className={`react-colorful__${target}-pointer`}
            left={rgb[target] / 255}
            color={selected}
          />,
        ]}
      </Interactive>
    </div>
  );
};
