var prop = argument0;
switch(prop.prop_type){
	case props.door: activateDoor(prop); break;
	case props.trapdoor: activateTrapdoor(prop); break;
	case props.platform: activatePlatform(prop); break;
	case props.cannon: activateCannon(prop) break;
	case props.laser: activateLaser(prop) break;
	case props.teleporter: activateTeleporter(prop) break;
	case props.mirror: activateMirror(prop) break;
}