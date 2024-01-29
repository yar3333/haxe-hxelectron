package electron;

import electron.main.*;

/**
	

	See: <https://electronjs.org/docs/api/structures/cpu-usage>
**/
@:require(js, hxelectron) typedef CPUUsage = {
	/**
		Percentage of CPU used since the last call to getCPUUsage. First call returns 0.
	**/
	var percentCPUUsage : Float;
	/**
		The number of average idle CPU wakeups per second since the last call to getCPUUsage. First call returns 0. Will always return 0 on Windows.
	**/
	var idleWakeupsPerSecond : Float;
}