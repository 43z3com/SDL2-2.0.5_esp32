#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

int testfile_main(int argc, char *argv[]);

void setup() {
}

void loop() {
  testfile_main(0, NULL);
}

#ifdef __cplusplus
};
#endif
