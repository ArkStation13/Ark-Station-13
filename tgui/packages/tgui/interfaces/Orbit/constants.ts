export const ANTAG2COLOR = {
  Abductors: 'pink',
  'Ash Walkers': 'olive',
  Biohazards: 'brown',
  'Bounty Hunters': 'yellow',
  CentCom: 'teal',
  'Digital Anomalies': 'teal',
  'Emergency Response Team': 'teal',
  'Escaped Fugitives': 'orange',
  'Xenomorph Infestation': 'violet',
  'Spacetime Aberrations': 'white',
  'Deviant Crew': 'white',
  'Invasive Overgrowth': 'green',
} as const;

type Department = {
  color: string;
  trims: string[];
};

export const DEPARTMENT2COLOR: Record<string, Department> = {
  cargo: {
    color: 'brown',
    /* NOVA EDIT CHANGE START - ORIGINAL:
    trims: ['Bitrunner', 'Cargo Technician', 'Shaft Miner', 'Quartermaster'],
    */
    trims: [
      'Bitrunner',
      'Deck Worker', // ARK STATION EDIT
      'Customs Agent',
      'Excavation Specialist', // ARK STATION EDIT
      'Quartermaster',
    ],
  },
  command: {
    color: 'blue',
    // NOVA EDIT CHANGE START - ORIGINAL: trims: ['Captain', 'Head of Personnel'],
    trims: [
      'Ark Commander', // ARK STATION EDIT
      'Donk Co. Manager', // ARK STATION EDIT
      'Consul of the Solar Federation', // ARK STATION EDIT
      'Solar Federation Shield', // ARK STATION EDIT
    ], // NOVA EDIT CHANGE END
  },
  engineering: {
    color: 'orange',
    /* NOVA EDIT CHANGE START - ORIGINAL:
    trims: ['Atmospheric Technician', 'Chief Engineer', 'Station Engineer'],
    */
    trims: [
      'Life Support Technician', // ARK STATION EDIT
      'Tech Overseer', // ARK STATION EDIT
      'Engineering Guard',
      'Engine Specialist', // ARK STATION EDIT
      'Telecomms Specialist',
    ], // NOVA EDIT CHANGE END
  },
  medical: {
    color: 'olive',
    trims: [
      'Synthetic Pharmacist', // ARK STATION EDIT
      'Medtech Curator', // ARK STATION EDIT
      'Necropsier', // ARK STATION EDIT
      'Physician', // ARK STATION EDIT
      'Emergency Medical Technician', // ARK STATION EDIT
      'Orderly', // NOVA EDIT ADDITION
      'Viral Selectionist', // NOVA EDIT ADDITION // ARK STATION EDIT
    ],
  },
  science: {
    color: 'pink',
    /* NOVA EDIT CHANGE START - ORIGINAL:
    trims: ['Geneticist', 'Research Director', 'Roboticist', 'Scientist'],
    */
    trims: [
      'Bioaugmentator', // ARK STATION EDIT
      'Scientific Director ', // ARK STATION EDIT
      'Biomechanical Engineer', // ARK STATION EDIT
      'Science Guard', // ARK STATION EDIT
      'Researcher', // ARK STATION EDIT
    ], // NOVA EDIT CHANGE END
  },
  security: {
    color: 'red',
    /* NOVA EDIT CHANGE START - ORIGINAL:
    trims: ['Detective', 'Head of Security', 'Security Officer', 'Warden'],
    */
    trims: [
      'Corrections Officer',
      'RHIB Agent', // ARK STATION EDIT
      'Head of Red Hawk', // ARK STATION EDIT
      'Red Hawk Private', // ARK STATION EDIT
      'Red Hawk Inspector', // ARK STATION EDIT
      'Red Hawk Pilot', // ARK STATION ADDITION
      'Red Hawk Medic', // ARK STATION ADDITION
    ], // NOVA EDIT CHANGE END
  },
  service: {
    color: 'green',
    trims: [
      'Bartender',
      'Botanist',
      // 'Chaplain', // ARK STATION REMOVED
      'Chef',
      'Clown',
      'Cook',
      'Curator',
      'Janitor',
      'Lawyer',
      'Mime',
      'Psychologist',
      'Barber', // NOVA EDIT ADDITION
      'Donk Co. Guard', // NOVA EDIT ADDITION // ARK STATION EDIT
    ],
  },
  church: {
    // ARK STATION ADDITION
    color: 'grey',
    trims: ['Priest of Neo-Vatican', 'Fiscal', 'Deacon'],
  },
};

export const THREAT = {
  Low: 1,
  Medium: 5,
  High: 8,
} as const;

export const HEALTH = {
  Good: 69, // nice
  Average: 19,
  Bad: 0,
  Crit: -30,
  Dead: -100,
  Ruined: -200,
} as const;

export const VIEWMODE = {
  Health: 'heart',
  Orbiters: 'ghost',
  Department: 'id-badge',
} as const;
