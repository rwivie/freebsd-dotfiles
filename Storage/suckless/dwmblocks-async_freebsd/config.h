#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "  "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(cmd, interval, signal).
#define BLOCKS(X)         \
    X("", "sb-mpd-2", 5, 1)   \
    X("", "sb-updates", 3600, 2)  \
    X("", "sb-news-2", 3600, 3)  \
    X("", "sb-disk-2", 1800, 4) \
    X("", "sb-memory-2", 10, 5) \
    X("", "sb-loadavg", 5, 6) \
    X("", "sb-forecast", 10, 7)  \
    X("", "sb-moonphase", 10, 8) \
    X("", "sb-volume", 1, 9)  \
    X("", "sb-date-2", 1, 10)

#endif  // CONFIG_H
