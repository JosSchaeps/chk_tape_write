/* program name : chk_tape_write.c 
 * version      : 1.0
 * file         : ~jos/tape/rel1.0/chk_tape_write.c
 * author       : Rhodix IT Services BV, all rigths reserved.
 * date         : 28-Jan-1995
 * description  : 
 * documentation: manual page, chk_tape_write.l
 *		  Makefile
 * modification : 
 */


#include <stdio.h>
#include <stdlib.h>
#include <sys/file.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>

#ifdef SUNOS5
int main(int argc, char **argv) { 
#define DEF_DEVICE "/dev/rmt/0"
#endif
#ifdef SUNOS4
int main(argc, argv) 
	int argc;
	char ** argv;
	{ 
#define DEF_DEVICE "/dev/rst0"
#endif
	char devname[128];
	char *devnmp;
	int error=0;
	struct stat buf;
	FILE *fp;
	FILE *fopen();
	char *sccsident="@(#)chk_tape_write 1.0, Rhodix IT Services BV, 28-Jan-95 Eindhoven";

	/* determine the tapedevice name 
	 * if no tapedevice is specified, chk_wrt_tape uses the environment
	 * variable TAPE. If TAPE doesn't exists the default tapedevice 
	 * /dev/rmt/0 or /dev/rst0 is used.
	 */
	switch (argc) {
		case 1: {
				devnmp=getenv("TAPE");
                		if (devnmp == NULL) {
                        		/* no environment for TAPE set */
                        		strcpy(devname, DEF_DEVICE);
                        		printf("using the default device %s\n", devname);
                		}
                		else {
                        		/* use environment TAPE */
                        		strcpy(devname, devnmp);
                        		printf("using device %s\n", devname);
                		}
				break;
			  }
		case 2: {
				strcpy(devname, argv[1]);
				break;
			  }
		default : {
				printf("Usage %s: [tapedevice]\n", argv[0]);
				exit(1);
			  }
	}
	
	/* check to make sure the device  exists */
 	if(stat(devname, &buf) != 0) {
		printf("Error, %s does not exist!\n", devname);
		exit(2);
	}

	/* the actual check */
 	if ((fp=fopen(devname, "w+")) == NULL) {
		printf("Unable to open %s for writing.\n", devname);
		error++;
		
	}
	else { 
		printf("%s is enabled for writing.\n", devname);
	}
	fclose(fp);
	
	return(error);
}

