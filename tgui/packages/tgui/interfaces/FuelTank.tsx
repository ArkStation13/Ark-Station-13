import { useBackend } from '../backend';
import { Button, LabeledList, NumberInput, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  fuel: number;
  max_fuel: number;
  balance: number;
  price: number;
};
export const FuelTank = (props) => {
  const { act, data } = useBackend<Data>();
  const { fuel, max_fuel } = data;
  return (
    <Window width={335} height={120}>
      <Window.Content>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Balance">
              {data.balance} credits
            </LabeledList.Item>
            <LabeledList.Item label="Fuel Price">
              {data.price} credits for liter!
            </LabeledList.Item>
            <LabeledList.Item label="How many liters?">
              <NumberInput
                animated
                value={fuel}
                unit="liters"
                width="75px"
                minValue={0}
                maxValue={max_fuel}
                onChange={(_, value) =>
                  act('fuel', {
                    fuel: value,
                  })
                }
              />
              <Button
                ml={1}
                icon="plus"
                content="Max"
                disabled={fuel === max_fuel}
                onClick={() =>
                  act('fuel', {
                    fuel: 'max',
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
