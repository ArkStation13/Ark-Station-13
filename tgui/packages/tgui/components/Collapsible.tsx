/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { ReactNode, useState } from 'react';

import { Box, BoxProps } from './Box';
import { Button } from './Button';

type Props = Partial<{
  buttons: ReactNode;
  open: boolean;
  title: ReactNode;
  icon: string;
  // ARK STATION EDIT START
  disabled: boolean;
  // ARK STATION EDIT END
}> &
  BoxProps;

export function Collapsible(props: Props) {
  const { children, color, title, buttons, icon, disabled, ...rest } = props;
  const [open, setOpen] = useState(props.open);

  return (
    <Box mb={1}>
      <div className="Table">
        <div className="Table__cell">
          <Button
            fluid
            color={color}
            icon={icon ? icon : open ? 'chevron-down' : 'chevron-right'}
            // ARK STATION EDIT START
            disabled={disabled}
            // ARK STATION EDIT END
            onClick={() => setOpen(!open)}
            {...rest}
          >
            {title}
          </Button>
        </div>
        {buttons && (
          <div className="Table__cell Table__cell--collapsing">{buttons}</div>
        )}
      </div>
      {open &&
        // ARK STATION EDIT START
        !disabled && (
          // ARK STATION EDIT END
          <Box mt={1}>{children}</Box>
        )}
    </Box>
  );
}
