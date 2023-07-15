TITLE
=====

SOD

SUBTITLE
========

Raku bindings for the SOD image processing library

DESCRIPTION
===========

SOD is an embedded, modern cross-platform computer vision and machine learning software library that exposes a set of APIs for deep-learning, advanced media analysis & processing including real-time, multi-class object detection and model training on embedded systems with limited computational resource and IoT devices.

CLASSES
=======

Image
-----

An `Image` class representing an image that can be manipulated.

### Attributes

  * * CImage $.cimage - underlying CImage structure

### Class Methods

  * *load*

    `load(Str $filename, Int :$channels = 3 --> Image)`

    Load an image from file with a specified number of channels

  * *load_gray*

    `load_gray(Str $filename --> Image)`

    Load an image from file in grayscale (single channel)

  * *empty*

    `empty(:w($width), :h($height), :c($channels) = 3 --> Image)`

    Create an empty image with given dimensions and number of channels

  * *zeros*

    `zeros(:w($width), :h($height), :c($channels) = 3 --> Image)`

    Create an image filled with zeros with given dimensions and number of channels

  * *random*

    `random(:w($width), :h($height), :c($channels) = 3 --> Image)`

    Create a random image with given dimensions and number of channels

### Instance Methods

  * *copy*

    `copy(--> Image)`

    Copy the current image

  * *clone*

    `clone(--> Image)`

    Clone the current image (alias for copy)

  * *save_png*

    `save_png(Str $filename --> uint8)`

    Save the current image as a PNG file

  * *save_jpeg*

    `save_jpeg(Str $filename, Int() $quality --> uint8)`

    Save the current image as a JPEG file with specified quality

  * *save_bmp*

    `save_bmp(Str $filename --> uint8)`

    Save the current image as a BMP file

  * *set_pixel*

    `set_pixel($x, $y, $c, Num() $v)`

    Set the pixel value at the specified coordinates and channel

  * *get_pixel*

    `get_pixel($x, $y, $c)`

    Get the pixel value at the specified coordinates and channel

  * *resize*

    `resize(Int() $w, Int() $h --> Image)`

    Resize the current image to the specified dimensions

  * *resize_max*

    `resize_max(Int() $max --> Image)`

    Resize the current image such that the maximum dimension is equal to $max

  * *resize_min*

    `resize_min(Int() $min --> Image)`

    Resize the current image such that the minimum dimension is equal to $min

  * *rotate_crop*

    `rotate_crop(Num() :a($angle), Scale() :s($scale), Int() :w($width), Int() :h($height), Int() :x($dx), Int() :y($dy), Num() :as($aspect) --> Image)`

    Rotate and crop the current image

  * *translate*

    `translate(Scale() $scale --> Image)`

    Translate the current image by the specified scale

  * *scale*

    `scale(Scale() $scale --> Image)`

    Scale the current image by the specified scale

  * *normalize*

    `normalize(--> Image)`

    Normalize the current image

  * *transpose*

    `transpose(--> Image)`

    Transpose the current image

  * *rotate*

    `rotate(Num() $angle --> Image)`

    Rotate the current image by the specified angle

  * *box*

    `box(Int() $x1, Int() $y1, Int() $x2, Int() $y2, Num() $r, Num() $g, Num() $b --> Image)`

    Draw a box on the current image with specified coordinates and color

  * *bbox*

    `bbox(Box $box, Num() $r, Num() $g, Num() $b --> Image)`

    `bbox(Box $box, Num() $r, Num() $g, Num() $b, Int() $width --> Image)`

    Draw a bounding box on the current image with specified box, color, and optional width

  * *box_grayscale*

    `box_grayscale(Int() $x1, Int() $y1, Int() $x2, Int() $y2, Num() $v --> Image)`

    Draw a box on the current image with specified coordinates and grayscale value

  * *circle*

    `circle(Int() $x, Int() $y, Int() $r, Num() $red, Num() $green, Num() $blue --> Image)`

    `circle(Int() $x, Int() $y, Int() $radius,Int() $thickness, Num() $r, Num() $g,Num() $b, --> Image)`

    Draw a circle on the current image with specified coordinates, radius, color, and optional thickness.

  * *crop*

    `crop(Int() $x, Int() $y, Int() $w, Int() $h --> Image)`

    Crop the current image with specified coordinates and dimensions

  * *random_crop*

    `random_crop(Int() $w, Int() $h --> Image)`

    Randomly crop the current image with specified dimensions

  * *random_augment*

    `random_augment(Num() $angel, Num() $aspect, Int() $low, Int() $high, Int() $size --> Image)`

    Randomly augment the current image with specified parameters.

  * *add_pixel*

    `add_pixel(Int() $x, Int() $y, Int() $c, Num() $v --> Image)`

    Add a constant value to a pixel at the given location. This value must be set between 0..1 such as 0.7.

  * *rgb_to_bgr*

    `rgb_to_bgr(--> Image)`

    Change the RGB colorspace of a given image to the BGR colorspace.

  * *bgr_to_rgb*

    `bgr_to_rgb(--> Image)`

    Change the BGR colorspace of a given image to the RGB colorspace.

  * *rgb_to_hsv*

    `rgb_to_hsv(--> Image)`

    Change the RGB colorspace of a given image to the HSV colorspace.

  * *hsv_to_rgb*

    `hsv_to_rgb(--> Image)`

    Change the HSV colorspace of a given image to the RGB colorspace.

  * *yuv_to_rgb*

    `yuv_to_rgb(--> Image)`

    Change the YUV colorspace of a given image to the RGB colorspace.

  * *rgb_to_yuv*

    `rgb_to_yuv(--> Image)`

    Change the RGB colorspace of a given image to the YUV colorspace.

AUTHOR
======



Khalid Elborai <elboraikhalid@gmail.com>

