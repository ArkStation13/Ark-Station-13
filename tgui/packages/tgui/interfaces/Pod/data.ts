import { BooleanLike } from 'common/react';

export type AccessData = {
  name: string;
  number: number;
};

export type MainData = {
  isoperator: BooleanLike;
  name: string;
  integrity: number;
  integrity_max: number;
  power_level: number;
  power_max: number;
  mecha_flags: number;
  mechflag_keys: string[];
  dna_lock: string | null;
  pod_view: string;
  sheet_material_amount: number;
};
