.\" @(#)chk_tape_write.1 1.00 Jos Schaeps;
.TH chk_tape_write l "28 Jan 1995"
.SH NAME
chk_tape_write \- magnetic tape writability check
.SH SYNOPSIS
.B chk_tape_write
[
.B 
.I tapeunit device
]
.SH AVAILABILITY
.LP
Locally installed sysadmin tool
.SH DESCRIPTION
.LP
.B chk_tape_write
performs an non-destructive write on the 
.I tapeunit device
to check if a tape is write-enabled.
.LP
.B If
.I tapeunit device
is not specified, the environment variable
.SB TAPE
is used.  
.B If
.SB TAPE
does not exist,
.B chk_tape_write
uses the device
.BR /dev/rmt/0 
.B  or /dev/rst0.
.B (See FILES)
.LP
.B chk_tape_write
returns a 0 exit status when the tape in
the tapeunit device is write-enabled, 1 if the
tape is write-protected and 2 if the tapeunit device is not accessable.
.SH FILES
.PD 0
.TP 20
.B /dev/rmt/0
magnetic tape interface for sunos 5.x
.TP
.B /dev/rst0
magnetic tape interface for sunos 4.x

.SH COPYRIGHT
.B Rhodix IT Services BV
.LP
.PD 
