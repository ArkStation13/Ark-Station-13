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

const ColorPalette = ({ onColorSelect }) => {
  const colorGroups = [
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
    [
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
      '#FAFAFA',
      '#F5F5F5',
      '#EEEEEE',
      '#E0E0E0',
    ],
    [
      '#BDBDBD',
      '#9E9E9E',
      '#757575',
      '#616161',
      '#424242',
      '#212121',
      '#ECEFF1',
      '#CFD8DC',
      '#B0BEC5',
      '#90A4AE',
      '#78909C',
      '#607D8B',
      '#546E7A',
      '#455A64',
    ],
    ['#37474F', '#263238', '#000000', '#FFFFFF'],
  ];

  return (
    <Box>
      <Flex wrap="nowrap" justify="space-between">
        {colorGroups.map((group, columnIndex) => (
          <Flex.Item key={columnIndex} grow={1} basis="20px">
            <Stack vertical>
              {group
                .slice()
                .reverse()
                .map((color, rowIndex) => (
                  <Box
                    key={rowIndex}
                    width="20px"
                    height="20px"
                    backgroundColor={color}
                    mt={1}
                    style={{ cursor: 'pointer' }}
                    onClick={() => onColorSelect(color)}
                  />
                ))}
            </Stack>
          </Flex.Item>
        ))}
      </Flex>
    </Box>
  );
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

  // Состояние для отображения палитры
  const [showPalette, setShowPalette] = useLocalState<boolean>(
    context,
    'show_palette',
    false,
  );

  // Обработчик выбора цвета из палитры
  const handleColorSelect = (color: string) => {
    setSelectedColor(hexToHsva(color));
  };

  return (
    <Window
      height={showPalette ? 1000 : 400} // Увеличиваем высоту окна при отображении палитры
      title={title}
      width={600}
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
          <Stack.Item>
            <Stack justify="space-between" align="center">
              <Button.Checkbox
                checked={showPalette}
                onClick={() => setShowPalette(!showPalette)}
              >
                Show Color Palette
              </Button.Checkbox>
              <InputButtons input={hsvaToHex(selectedColor)} />
            </Stack>
          </Stack.Item>
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
            <Stack.Item grow>
              <Section fill scrollable>
                <ColorPalette onColorSelect={handleColorSelect} />
              </Section>
            </Stack.Item>
          )}
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
