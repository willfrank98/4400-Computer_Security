#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "defs.h"

/******************************************************
 * PINWHEEL KERNEL
 *
 * Your different versions of the pinwheel kernel go here
 ******************************************************/

/*
 * naive_pinwheel - The naive baseline version of pinwheel
 */
char naive_pinwheel_descr[] = "naive_pinwheel: baseline implementation";
void naive_pinwheel(pixel *src, pixel *dest)
{
  int i, j;

  for (i = 0; i < src->dim; i++)
    for (j = 0; j < src->dim; j++) {
      /* Check whether we're in the diamond region */
      if ((fabs(i + 0.5 - src->dim/2) + fabs(j + 0.5 - src->dim/2)) < src->dim/2) {
        /* In diamond region, so rotate and grayscale */
        int s_idx = RIDX(i, j, src->dim);
        int d_idx = RIDX(src->dim - j - 1, i, src->dim);
        dest[d_idx].red = ((int)src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].green = ((int)src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].blue = ((int)src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
      } else {
        /* Not in diamond region, so keep the same */
        int s_idx = RIDX(i, j, src->dim);
        int d_idx = RIDX(i, j, src->dim);
        dest[d_idx] = src[s_idx];
      }
    }
}

/*
 * pinwheel - Your current working version of pinwheel
 * IMPORTANT: This is the version you will be graded on
 */
char pinwheel_descr[] = "pinwheel: Current working version";
void pinwheel(pixel *src, pixel *dest)
{
  int i, j, s_idx, d_idx, grey, leftb, rightb;
  int dim = src->dim;

  leftb = dim/2;
  rightb = dim/2 - 1;
  for (i = 0; i < dim/2; i++) {
    for (j = 0; j < dim; j++) {
      s_idx = RIDX(i, j, dim);
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j >= leftb && j <= rightb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb--;
    rightb++;
  }

  //leftb = 1;
  //rightb = dim - 1;
  for (i = dim/2; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      s_idx = RIDX(i, j, dim);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j < rightb && j > leftb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb++;
    rightb--;
  }
}

char desc2[] = "safety";
void pin2(pixel* src, pixel* dest)
{
  int i, j, s_idx, d_idx, grey, leftb, rightb;
  int dim = src->dim;
  int dim2 = dim/2;

  leftb = dim2;
  rightb = dim2 - 1;
  s_idx = 1;
  for (i = 0; i < dim2; i++) {
    for (j = 0; j < dim; j++) {
      /* Check whether we're in the diamond region */
      if (j >= leftb && j <= rightb) {
        /* In diamond region, so rotate and grayscale */
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        dest[s_idx] = src[s_idx];
      }
      s_idx++;
    }
    leftb--;
    rightb++;
  }

  for (i = dim2; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      s_idx = RIDX(i, j, dim);
      /* Check whether we're in the diamond region */
      if (j < rightb && j > leftb) {
        /* In diamond region, so rotate and grayscale */
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        dest[s_idx] = src[s_idx];
      }
      s_idx++;
    }
    leftb++;
    rightb--;
  }
}


char desc7[] = "halves";
void pin7(pixel *src, pixel *dest)
{
  int i, j, s_idx, d_idx, grey, leftb, rightb;
  int dim = src->dim;

  leftb = dim/2;
  rightb = dim/2 - 1;
  for (i = 0; i < dim/2; i++) {
    for (j = 0; j < dim; j++) {
      s_idx = RIDX(i, j, dim);
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j >= leftb && j <= rightb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb--;
    rightb++;
  }

  //leftb = 1;
  //rightb = dim - 1;
  for (i = dim/2; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      s_idx = RIDX(i, j, dim);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j < rightb && j > leftb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb++;
    rightb--;
  }
}

char desc8[] = "halves, dim2";
void pin8(pixel *src, pixel *dest)
{
  int i, j, s_idx, d_idx, grey, leftb, rightb;
  int dim = src->dim;
  int dim2 = dim/2;

  leftb = dim2;
  rightb = dim2 - 1;
  for (i = 0; i < dim2; i++) {
    for (j = 0; j < dim; j++) {
      s_idx = RIDX(i, j, dim);
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim2) + fabs(j + 0.5 - dim2)) < dim2) {
      if (j >= leftb && j <= rightb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb--;
    rightb++;
  }

  //leftb = 1;
  //rightb = dim - 1;
  for (i = dim2; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      s_idx = RIDX(i, j, dim);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim2) + fabs(j + 0.5 - dim2)) < dim2) {
      if (j < rightb && j > leftb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
    }
    leftb++;
    rightb--;
  }
}

char desc9[] = "halves, s_idx moved";
void pin9(pixel *src, pixel *dest)
{
  int i, j, s_idx, d_idx, grey, leftb, rightb;
  int dim = src->dim;

  s_idx = 1;
  leftb = dim/2;
  rightb = dim/2 - 1;
  for (i = 0; i < dim/2; i++) {
    for (j = 0; j < dim; j++) {
      //s_idx = RIDX(i, j, dim);
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j >= leftb && j <= rightb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
      s_idx++;
    }
    leftb--;
    rightb++;
  }

  //leftb = 1;
  //rightb = dim - 1;
  for (i = dim/2; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      //printf("i: %d, j: %d, leftb: %d, rightb %d, ", i, j, leftb, rightb);
      s_idx = RIDX(i, j, dim);
      /* Check whether we're in the diamond region */
      //if ((fabs(i + 0.5 - dim/2) + fabs(j + 0.5 - dim/2)) < dim/2) {
      if (j < rightb && j > leftb) {
        /* In diamond region, so rotate and grayscale */
        //printf("in\n");
        d_idx = RIDX(dim - j - 1, i, dim);
        grey = (src[s_idx].red + src[s_idx].green + src[s_idx].blue) / 3;
        dest[d_idx].red = grey;
        dest[d_idx].green = grey;
        dest[d_idx].blue = grey;
      } else {
        /* Not in diamond region, so keep the same */
        //printf("out\n");
        dest[s_idx] = src[s_idx];
      }
      s_idx++;
    }
    leftb++;
    rightb--;
  }

}

/*********************************************************************
 * register_pinwheel_functions - Register all of your different versions
 *     of the pinwheel kernel with the driver by calling the
 *     add_pinwheel_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.
 *********************************************************************/

void register_pinwheel_functions() {
  add_pinwheel_function(&pin2, desc2);
  add_pinwheel_function(&pin7, desc7);
  add_pinwheel_function(&pin8, desc8);
  add_pinwheel_function(&pin9, desc9);
  add_pinwheel_function(&pinwheel, pinwheel_descr);
}


/***************************************************************
 * GLOW KERNEL
 *
 * Starts with various typedefs and helper functions for the glow
 * function, and you may modify these any way you like.
 **************************************************************/

/* A struct used to compute averaged pixel value */
typedef struct {
  int red;
  int green;
  int blue;
} pixel_sum;

/*
 * initialize_pixel_sum - Initializes all fields of sum to 0
 */
static void initialize_pixel_sum(pixel_sum *sum)
{
  sum->red = sum->green = sum->blue = 0;
}

/*
 * accumulate_sum - Accumulates field values of p in corresponding
 * fields of sum
 */
static void accumulate_weighted_sum(pixel_sum *sum, pixel p, int weight)
{
  sum->red += p.red * weight / 100;
  sum->green += p.green * weight / 100;
  sum->blue += p.blue * weight / 100;
}

/*
 * assign_sum_to_pixel - Computes averaged pixel value in current_pixel
 */
static void assign_sum_to_pixel(pixel *current_pixel, pixel_sum sum)
{
  current_pixel->red = (unsigned short)sum.red;
  current_pixel->green = (unsigned short)sum.green;
  current_pixel->blue = (unsigned short)sum.blue;
}

/*
 * weighted_combo - Returns new pixel value at (i,j)
 */
static pixel weighted_combo(int dim, int i, int j, pixel *src)
{
  int ii, jj;
  pixel_sum sum;
  pixel current_pixel;
  int weights[3][3] = { { 16, 0, 16 },
                        { 0, 30, 0 },
                        { 16, 0, 16 } };
  initialize_pixel_sum(&sum);
  if (i == 0 || i == dim-1 || j == 0 || j == dim-1) {
    for (ii=-1; ii < 2; ii++)
      for (jj=-1; jj < 2; jj++)
        if ((i + ii >= 0) && (j + jj >= 0) && (i + ii < dim) && (j + jj < dim))
          accumulate_weighted_sum(&sum, src[RIDX(i+ii,j+jj,dim)], weights[ii+1][jj+1]);
  } else {
    accumulate_weighted_sum(&sum, src[RIDX(i, j, dim)], weights[1][1]);
    accumulate_weighted_sum(&sum, src[RIDX(i-1, j-1, dim)], weights[0][0]);
    accumulate_weighted_sum(&sum, src[RIDX(i-1, j+1, dim)], weights[0][2]);
    accumulate_weighted_sum(&sum, src[RIDX(i+1, j-1, dim)], weights[2][0]);
    accumulate_weighted_sum(&sum, src[RIDX(i+1, j+1, dim)], weights[2][2]);
  }

  assign_sum_to_pixel(&current_pixel, sum);

  return current_pixel;
}

/******************************************************
 * Your different versions of the glow kernel go here
 ******************************************************/

/*
 * naive_glow - The naive baseline version of glow
 */
char naive_glow_descr[] = "naive_glow: baseline implementation";
void naive_glow(pixel *src, pixel *dst)
{
  int i, j;
  for (i = 0; i < src->dim; i++)
    for (j = 0; j < src->dim; j++)
      dst[RIDX(i, j, src->dim)] = weighted_combo(src->dim, i, j, src);
}

/*
 * glow - Your current working version of glow.
 * IMPORTANT: This is the version you will be graded on
 */
char glow_descr[] = "glow: Current working version";
void glow(pixel *src, pixel *dst)
{
  int i, j, pos, dim = src->dim;
  int ii, jj;
  pixel_sum sum;
  int weights[3][3] = { { 16, 0, 16 },
                        { 0, 30, 0 },
                        { 16, 0, 16 } };

  pos = 1;
  for (i = 0; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      initialize_pixel_sum(&sum);
      if (i == 0 || i == dim-1 || j == 0 || j == dim-1) {
        for (ii=-1; ii < 2; ii++) {
          for (jj=-1; jj < 2; jj++) {
            if ((i + ii >= 0) && (j + jj >= 0) && (i + ii < dim) && (j + jj < dim))
              accumulate_weighted_sum(&sum, src[RIDX(i+ii,j+jj,dim)], weights[ii+1][jj+1]);
          }
        }
      } else {
        accumulate_weighted_sum(&sum, src[RIDX(i, j, dim)], weights[1][1]);
        accumulate_weighted_sum(&sum, src[RIDX(i-1, j-1, dim)], weights[0][0]);
        accumulate_weighted_sum(&sum, src[RIDX(i-1, j+1, dim)], weights[0][2]);
        accumulate_weighted_sum(&sum, src[RIDX(i+1, j-1, dim)], weights[2][0]);
        accumulate_weighted_sum(&sum, src[RIDX(i+1, j+1, dim)], weights[2][2]);
      }
      assign_sum_to_pixel(&dst[pos], sum);
      pos++;
    }
  }
}

char gd2[] = "no function calls";
void glow2(pixel *src, pixel *dst)
{
  int i, j, pos, dim = src->dim;
  int ii, jj;
  pixel_sum sum;
  int weights[3][3] = { { 16, 0, 16 },
                        { 0, 30, 0 },
                        { 16, 0, 16 } };

  pos = 1;
  for (i = 0; i < dim; i++) {
    for (j = 0; j < dim; j++) {
      initialize_pixel_sum(&sum);
      if (i == 0 || i == dim-1 || j == 0 || j == dim-1) {
        for (ii=-1; ii < 2; ii++) {
          for (jj=-1; jj < 2; jj++) {
            if ((i + ii >= 0) && (j + jj >= 0) && (i + ii < dim) && (j + jj < dim))
              accumulate_weighted_sum(&sum, src[RIDX(i+ii,j+jj,dim)], weights[ii+1][jj+1]);
          }
        }
      } else {
        accumulate_weighted_sum(&sum, src[RIDX(i, j, dim)], weights[1][1]);
        accumulate_weighted_sum(&sum, src[RIDX(i-1, j-1, dim)], weights[0][0]);
        accumulate_weighted_sum(&sum, src[RIDX(i-1, j+1, dim)], weights[0][2]);
        accumulate_weighted_sum(&sum, src[RIDX(i+1, j-1, dim)], weights[2][0]);
        accumulate_weighted_sum(&sum, src[RIDX(i+1, j+1, dim)], weights[2][2]);
      }
      assign_sum_to_pixel(&dst[pos], sum);
      pos++;
    }
  }
}

char gd3[] = "blocking";
void glow3(pixel *src, pixel *dst)
{
  int i, j, ii, jj, pos, s = 32;

  pos = 1;
  for (ii = 0; ii < src->dim; ii+=s) {
    for (i = ii; i < ii+s; i++) {
      for (jj = 0; jj < src->dim; jj+=s) {
        for (j = jj; j < jj+s; j++) {
          dst[pos] = weighted_combo(src->dim, i, j, src);
          pos++;
        }
      }
    }
  }
}

/*********************************************************************
 * register_glow_functions - Register all of your different versions
 *     of the glow kernel with the driver by calling the
 *     add_glow_function() for each test function.  When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.
 *********************************************************************/

void register_glow_functions() {
  add_glow_function(&glow, glow_descr);
  add_glow_function(&naive_glow, naive_glow_descr);
  //add_glow_function(&glow2, gd2);
  //add_glow_function(&glow3, gd3);
}
