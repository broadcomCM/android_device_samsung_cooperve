#!/system/bin/sh

/system/bin/mv /data/dontpanic/apanic_threads  /data/dontpanic/apanic_threads_`date +%d%m%y_%H%M%S`.txt
/system/bin/mv /data/dontpanic/apanic_console  /data/dontpanic/apanic_console_`date +%d%m%y_%H%M%S`.txt
/system/bin/mv /data/dontpanic/cp_dump  /data/dontpanic/cp_dump_`date +%d%m%y_%H%M%S`.bin
