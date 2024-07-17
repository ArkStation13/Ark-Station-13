import { DmIcon, Icon } from '../../components';
import { JOB2ICON } from '../common/JobToIcon';
import { Antagonist, Observable } from './types';

type Props = {
  item: Observable | Antagonist;
  realNameDisplay: boolean;
};

type IconSettings = {
  dmi: string;
  transform: string;
};

const normalIcon: IconSettings = {
  dmi: 'modular_nova/master_files/icons/mob/huds/hud.dmi', // NOVA CHANGE - ORIGINAL 'icons/mob/huds/hud.dmi'
  transform: 'scale(2.3) translateX(9px) translateY(1px)',
};

const antagIcon: IconSettings = {
  dmi: 'icons/mob/huds/antag_hud.dmi',
  transform: 'scale(1.8) translateX(-16px) translateY(7px)',
};

export function JobIcon(props: Props) {
  const { item, realNameDisplay } = props;

  let iconSettings: IconSettings;
  if ('antag' in item) {
    iconSettings = antagIcon;
  } else {
    iconSettings = normalIcon;
  }

  // We don't need to cast here but typescript isn't smart enough to know that
  const { icon = '', job = '', mind_icon = '', mind_job = '' } = item;
  const usedIcon = realNameDisplay ? mind_icon || icon : icon;
  const usedJob = realNameDisplay ? mind_job || job : job;

  return (
    <div className="JobIcon">
      {icon === 'borg' ? (
<<<<<<< HEAD
        <Icon color="lightblue" name={JOB2ICON[job]} mr={0.5} />
      ) : (
        <div
=======
        <Icon color="lightblue" name={JOB2ICON[usedJob]} ml={0.3} mt={0.4} />
      ) : (
        <DmIcon
          icon={iconSettings.dmi}
          icon_state={usedIcon}
>>>>>>> 9533a883146e... [MIRROR] Ghosts once again can see people's true names and roundstart jobs [MDB IGNORE] (#3842)
          style={{
            height: '17px',
            width: '18px',
          }}
        >
          <DmIcon
            icon={iconSettings.dmi}
            icon_state={icon}
            style={{ transform: iconSettings.transform }}
          />
        </div>
      )}
    </div>
  );
}
