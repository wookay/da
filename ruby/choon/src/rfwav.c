// Program to make a WAV file from an Choon program output file
//
// This should probably compile ok on any platform where shorts are 2 bytes and
// longs are 4 bytes.  Big endian architechture such as SunSparc or Motorola chips
// are tested for, and the wav files should still be correct.
//
// The input consists of:
// >volume level (absolute value, 16 bit)
// Tnote length (ms)
// ;note value (0 = A440)
// .
// Any number of notes can follow each T, they will be played simultaneously.
// If zero notes follow a T, there will be a silence for that length of time.
// A volume parameter can appear at any time, it applies to all future notes.
// A full stop is required after the last note.
//
// (c) S.D.Sykes Feb 2002

#include <stdio.h>
#include <errno.h>
#include <math.h>
#include <string.h>

#define KHZ 15000       // kilohertz
#define SECS 1000		// max seconds of wav
#define MAXCHOON 100000	// input buffer length
#define STCTOLEN 0.05   // length of staccato tones in seconds
#define GAP 0.025       // inter-note gap in seconds
// #define DEBUG

int buf[KHZ * SECS];    // crude, a later version will malloc the buffer
int bufposn = 0;
int bufposn_start = 0;

void exit(int);
//
// writewav()
// writes out the wav file from the values stored in buf[]
//
void writewav() {
  int i;
  FILE *fd = stdout;
  union {        // Union used for writing header out
    struct {     // This is the wav format spec
      char  riff[4];
      long  len;
      char  wavefmt[8];
      long  fmtlen;
      short z1;
      short channels;
      long  rate;
      long  bytepsec;
      short bytepsample;
      short bitpsample;
      char  data[4];
      long  datalen;
    } head;
    unsigned char obuf[44];
  } hu;

  union {                 // Another union!  Never use one your whole life, then two come at once.
    short a;              // Suns and motorola are big endian, dec alpha and intel are little endian
    unsigned char b[2];   // this union is used to test endian-ness
  } endian_test;

  strncpy(hu.head.riff, "RIFF", 4);
  strncpy(hu.head.wavefmt, "WAVEfmt ", 8);
  hu.head.fmtlen = 16;
  hu.head.z1 = 1;
  hu.head.channels = 1;
  hu.head.rate = KHZ;
  hu.head.bytepsec = KHZ*2;
  hu.head.bytepsample = 2;
  hu.head.bitpsample = 16;
  strncpy(hu.head.data, "data", 4);
  hu.head.datalen = bufposn * 2;
  hu.head.len = bufposn + 36;

  endian_test.a = 1;
  if (endian_test.b[1]) {     // this must be a big endian machine
    for (i=0; i<44; i++) {    // write header byte by byte
      switch (i) {
        case 4: case 5: case 6: case 7: fprintf(fd, "%c", hu.obuf[11-i]); break;
        case 16: case 17: case 18: case 19: fprintf(fd, "%c", hu.obuf[35-i]); break;
        case 20: case 21: fprintf(fd, "%c", hu.obuf[41-i]); break;
        case 22: case 23: fprintf(fd, "%c", hu.obuf[45-i]); break;
        case 24: case 25: case 26: case 27: fprintf(fd, "%c", hu.obuf[51-i]); break;
        case 28: case 29: case 30: case 31: fprintf(fd, "%c", hu.obuf[59-i]); break;
        case 32: case 33: fprintf(fd, "%c", hu.obuf[65-i]); break;
        case 34: case 35: fprintf(fd, "%c", hu.obuf[69-i]); break;
        case 40: case 41: case 42: case 43: fprintf(fd, "%c", hu.obuf[83-i]); break;
        default: fprintf(fd, "%c", hu.obuf[i]);
      }
    }
  } else { // little endian
    for (i=0; i<44; i++) {      // write header
      fprintf(fd, "%c", hu.obuf[i]);
    }
  }

  for (i=0; i<bufposn ; i++) {
    union {
      short a;
      unsigned char b[2];
    } ob; 
    if (buf[i] < -32768) buf[i] = -32768;
    else if (buf[i] > 32767) buf[i] = 32767;
    ob.a = buf[i];
    if (endian_test.b[1]) {
      fprintf(fd, "%c%c", ob.b[1], ob.b[0]);
    } else {
      fprintf(fd, "%c%c", ob.b[0], ob.b[1]);
    }
  }
}

//
// addbing (len, freq, level, newflag)
// adds a tone to buf of length len (ms), frequency freq and volume level
// newflag indicates to add to the end rather than combine with the last tone written
//
void addbing(int len, float freq, int level, int newflag) {
  float period;
  int cycles = 1;
  int counter = 0;
  int endpoint;
  char style = 'c';   // continuous, maybe be able to set this in a later version
  int peaklevel = level;
  const float pi = 3.14159;
  static int prevwavpoint = 0;
  float offset = 0;

  if (peaklevel > 32767) peaklevel = 32767;
  if (newflag) {
    bufposn_start = bufposn;
  }
  bufposn = bufposn_start;
  endpoint = bufposn_start + (len * KHZ) / 1000;
  if (freq) {
    if (newflag) {
      float x = (float)prevwavpoint / peaklevel;
      if (x > 1) offset = 0.25;
      else if (x < -1) offset = 0.75;
      else offset=asin(x)/(2 * pi);
    }
    period = (float)KHZ / freq;
  } else {
    period = KHZ * SECS;  // in case we are passed a frequency of zero
  }
                          // 1 cycle should take place in period samples
  while (bufposn < endpoint && bufposn < SECS * KHZ) {
    buf[bufposn] = buf[bufposn] + sin(2 * pi * (counter / period + offset)) * peaklevel; // sine wave
    switch (style) {
      case 's': {   // staccato - silence after short amount of note
        if ((float)counter / KHZ > STCTOLEN) {
          buf[bufposn] = 0;
        }
      }
      case 'n': {  // normal - make small gap at end of note
        if (len > GAP * 2 && counter > len * KHZ - GAP * KHZ) {
          buf[bufposn] = 0;
        }
      }
      case 'c': {  // continuous - nothing to do here
      }
    }
    bufposn ++;
    counter ++;
  }
  if (style=='c') prevwavpoint = buf[bufposn -1];
  else prevwavpoint = 0;
}

//
// donote(vals,newflag)
// add a note consisisting of vals to the output buffer
// newflag indicates to start a new time period at the end rather than to add to the
// last tone written
// vals is an array of [time (ms), volume, note value, minus flag]
// the minus flag applies to the note value, 0 = A440.
// 
void donote(int vals[],int newflag) {
  float base;
  float freq;
  int noteval;
  base = 440;  // A440
  noteval = vals[3] ? -vals[2] : vals[2];
#ifdef DEBUG
  fprintf(stderr,"Adding %d, length %d at %d\n",noteval,vals[0],bufposn);
#endif
  freq = pow(2, (log(base) / log(2) + (float)noteval/12));
  addbing(vals[0],freq,vals[1],newflag);
}

//
// parse(inbuf)
// parse does all the work of parsing the choon output file which is passed in
// in a buffer
//
void parse(char *inbuf) {
  int i;
  int vals[4] = {0,0,0,0};  // time, vol, note, minus flag
  int v = 1;
  int newflag = 0;
  int innote = 0;
  for (i=0; i<strlen(inbuf); i++) {
        switch (tolower(inbuf[i])) {
          case 't': {  // indicates note length parameter
            if (newflag && v==0) bufposn += (vals[0] * KHZ) / 1000; // silence if two t params in a row
            v = 0;
            if (vals[0] && innote) donote(vals,newflag);
            newflag = 1;
            vals[v] = 0;
            innote = 0;
            break;
          }
          case '>': {  // indicates volume parameter
            v = 1;
            if (vals[0] && innote) {
              donote(vals,newflag);
              newflag = 0;
            }
            vals[v] = 0;
            innote = 0;
            break;
          }
          case ';': {
            v = 2;
            if (vals[0] && innote) {
              donote(vals,newflag);
              newflag = 0;
            }
            innote = 1;
            vals[v] = 0;
            vals[3] = 0;
            break;
          }
          case '-': {
            vals[3] = 1;
            break;
          }
          case '.': {
            if (vals[0] && innote) {
              donote(vals,newflag);
              newflag = 0;
            }
            innote = 0;
            break;
          }
          case '0':case '1':case '2':case '3':case '4':case '5':case '6':case '7':case '8':case '9': {
            vals[v] = vals[v] * 10 + inbuf[i] - '0';
          }
        }
  }
}

main(int argc, char *argv[]) {
  char inbuf[MAXCHOON+1];
  char c;
  int count=0;
  if (argc != 1) {
    char *basename = rindex(argv[0],'/') ? rindex(argv[0],'/')+1 : argv[0];
    fprintf(stderr, "Usage: %s <choonoutfile >wavfile\n", basename);
    exit(1);
  }
  while (count < MAXCHOON && (c = getc(stdin))!= EOF) {
   inbuf[count++] = c;
  }
  inbuf[count] = '\0';

  parse(inbuf);

  writewav();

  exit(0);
}
