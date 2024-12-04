import { Antagonist, Category } from '../base';

const SentientDisease: Antagonist = {
  key: 'sentientdisease',
  name: 'Sentient Disease',
  description: [
    `
      Mutate and spread yourself and infect as much of the crew as possible
      with a deadly plague of your own creation. Don't forget, one infected
      crew must survive.
    `,
  ],
  category: Category.Midround,
};

export default SentientDisease;
