#include <stdio.h>
#include <stdlib.h>
#include "sod.h"

// gcc -I. -shared  -Wall -fPIC -o ../libsod.so sod.c wrapper.c -std=c99

SOD_APIEXPORT sod_img *make_empty_image(int width, int height, int channels)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_make_empty_image(width, height, channels);
    return out;
}

SOD_APIEXPORT sod_img *make_zeros_image(int width, int height, int channels)
{
    sod_img *out = make_empty_image(width, height, channels);
    out->data = calloc(width * height * channels, sizeof(float));
    return out;
}

SOD_APIEXPORT sod_img *make_random_image(int width, int height, int channels)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_make_random_image(width, height, channels);
    return out;
}

SOD_APIEXPORT sod_img *copy_image(sod_img *img)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_copy_image(*img);
    return out;
}

SOD_APIEXPORT void free_image(sod_img *img)
{
    sod_free_image(*img);
    free(img);
}

SOD_APIEXPORT int save_as_png(sod_img *img, const char *filename)
{
    sod_img im = sod_copy_image(*img); // workaround for sod_img_save_as_png, does not work with directly
    int re = sod_img_save_as_png(im, filename);
    sod_free_image(im);
    return re;
}

SOD_APIEXPORT int save_as_jpeg(sod_img *img, const char *filename, int quality)
{
    sod_img im = sod_copy_image(*img); // workaround for sod_img_save_as_jpeg, does not work with directly
    int re = sod_img_save_as_jpeg(im, filename, quality);
    sod_free_image(im);
    return re;
}

SOD_APIEXPORT int save_as_bmp(sod_img *img, const char *filename)
{
    sod_img im = sod_copy_image(*img); // workaround for sod_img_save_as_bmp, does not work with directly
    unsigned char *img_blob = sod_image_to_blob(im);
    int re = sod_img_blob_save_as_bmp(filename, img_blob, im.w, im.h, im.c);
    sod_free_image(im);
    return re;
}

SOD_APIEXPORT sod_img *load_image(const char *filename, int channels)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    if (out == NULL)
    {
        return NULL;
    }
    *out = sod_img_load_from_file(filename, channels);
    return out;
}

SOD_APIEXPORT float get_pixel(sod_img *img, int x, int y, int c)
{
    return sod_img_get_pixel(*img, x, y, c);
}

SOD_APIEXPORT void set_pixel(sod_img *img, int x, int y, int c, float val)
{
    sod_img_set_pixel(*img, x, y, c, val);
}

SOD_APIEXPORT sod_img *resize(sod_img *img, int w, int h)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_resize_image(*img, w, h);
    return out;
}

SOD_APIEXPORT sod_img *resize_max(sod_img *img, int max)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_resize_max(*img, max);
    return out;
}

SOD_APIEXPORT sod_img *resize_min(sod_img *img, int min)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_resize_min(*img, min);
    return out;
}

SOD_APIEXPORT sod_img *rotate_crop(sod_img *img, float rad, float s, int w, int h, float dx, float dy, float aspect)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_rotate_crop_image(*img, rad, s, w, h, dx, dy, aspect);
    return out;
}

SOD_APIEXPORT sod_img *rotate(sod_img *img, float rad)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_rotate_image(*img, rad);
    return out;
}

SOD_APIEXPORT void translate(sod_img *img, float s)
{
    sod_translate_image(*img, s);
}

SOD_APIEXPORT void scale(sod_img *img, float s)
{
    sod_scale_image(*img, s);
}

SOD_APIEXPORT void normalize(sod_img *img)
{
    sod_normalize_image(*img);
}

SOD_APIEXPORT void transpose(sod_img *img)
{

    sod_transpose_image(*img);
}

SOD_APIEXPORT void draw_box(sod_img *im, int x1, int y1, int x2, int y2, float r, float g, float b)
{
    sod_image_draw_box(*im, x1, y1, x2, y2, r, g, b);
}

SOD_APIEXPORT void draw_box_grayscale(sod_img *im, int x1, int y1, int x2, int y2, float g)
{
    sod_image_draw_box_grayscale(*im, x1, y1, x2, y2, g);
}

SOD_APIEXPORT void draw_circle(sod_img *im, int x0, int y0, int radius, float r, float g, float b)
{
    sod_image_draw_circle(*im, x0, y0, radius, r, g, b);
}

SOD_APIEXPORT void draw_circle_thickness(sod_img *im, int x0, int y0, int radius, int width, float r, float g, float b)
{
    sod_image_draw_circle_thickness(*im, x0, y0, radius, width, r, g, b);
}

SOD_APIEXPORT void draw_bbox(sod_img *im, sod_box bbox, float r, float g, float b)
{
    sod_image_draw_bbox(*im, bbox, r, g, b);
}

SOD_APIEXPORT void draw_bbox_width(sod_img *im, sod_box bbox, int width, float r, float g, float b)
{
    sod_image_draw_bbox_width(*im, bbox, width, r, g, b);
}

SOD_APIEXPORT void draw_line(sod_img *im, sod_pts start, sod_pts end, float r, float g, float b)
{
    sod_image_draw_line(*im, start, end, r, g, b);
}

SOD_APIEXPORT sod_img *crop(sod_img *img, int dx, int dy, int w, int h)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_crop_image(*img, dx, dy, w, h);
    return out;
}

SOD_APIEXPORT sod_img *random_crop(sod_img *img, int w, int h)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_random_crop_image(*img, w, h);
    return out;
}

SOD_APIEXPORT sod_img *random_augment(sod_img *img, float angle, float aspect, int low, int high, int size)
{
    sod_img *out = (sod_img *)malloc(sizeof(sod_img));
    *out = sod_random_augment_image(*img, angle, aspect, low, high, size);
    return out;
}
