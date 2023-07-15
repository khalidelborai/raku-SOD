use v6.d;

use NativeCall;
use LibraryMake;

class CImage is repr('CStruct') {
	has int32 $.h;
	has int32 $.w;
	has int32 $.c;
	HAS Pointer[num32] $.data;

	method DESTROY {
		free_image(self);
	}
}

class Box is repr('CStruct') is export {
	has int32 $.x;
	# The x-coordinate of the upper-left corner of the rectangle
	has int32 $.y;
	# The y-coordinate of the upper-left corner of the rectangle
	has int32 $.w;
	# The width of the rectangle
	has int32 $.h;
	# The height of the rectangle
	has num32 $.score;
	# Confidence threshold.
	has str $.zName handles <label>;
	# Detected object name. I.e. person, face, dog, car, plane, cat, bicycle, etc.
	has Pointer $.pUserData handles <data>;
	# External pointer used by some modules such as the face landmarks, NSFW classifier, pose estimator, etc.
}


constant LIB_PATH = %?RESOURCES<libraries/sod>.absolute;

# constant LIB_PATH = "$*CWD/sod/";

sub free_image(CImage) is native(LIB_PATH) is export {*}

sub make_empty_image(int32,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub make_zeros_image(int32,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub make_random_image(int32,int32,int32,) returns CImage is native(LIB_PATH) is export {*}

sub copy_image(CImage) returns CImage is native(LIB_PATH) is export {*}

sub load_image(Str,int32,) returns CImage is native(LIB_PATH) is export {*}

sub save_as_png(CImage,Str,--> int8) is native(LIB_PATH) is export {*}

sub save_as_jpeg(CImage,Str,int32--> int8) is native(LIB_PATH) is export {*}

sub save_as_bmp(CImage,Str,--> int8) is native(LIB_PATH) is export {*}

sub get_pixel(CImage,int32,int32,int32) returns num32 is native(LIB_PATH) is export {*}

sub set_pixel(CImage,int32,int32,int32,num32) returns num32 is native(LIB_PATH) is export {*}

sub resize(CImage,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub resize_max(CImage,int32) returns CImage is native(LIB_PATH) is export {*}

sub resize_min(CImage,int32) returns CImage is native(LIB_PATH) is export {*}

sub rotate_crop(CImage,num32,num32,int32,int32,num32,num32,num32) returns CImage is native(LIB_PATH) is export {*}

sub rotate(CImage,num32) returns CImage is native(LIB_PATH) is export {*}

sub translate(CImage,num32) is native(LIB_PATH) is export {*}

sub scale(CImage,num32) is native(LIB_PATH) is export {*}

sub normalize(CImage) is native(LIB_PATH) is export {*}

sub transpose(CImage) is native(LIB_PATH) is export {*}

sub draw_box(CImage,int32,int32,int32,int32,num32,num32,num32) is native(LIB_PATH) is export {*}

sub draw_bbox(CImage,Box,num32,num32,num32) is native(LIB_PATH) is export {*}

sub draw_bbox_width(CImage,Box,int32,num32,num32,num32) is native(LIB_PATH) is export {*}

sub draw_box_grayscale(CImage,int32,int32,int32,int32,num32) is native(LIB_PATH) is export {*}

sub draw_circle(CImage,int32,int32,int32,num32,num32,num32) is native(LIB_PATH) is export {*}

sub draw_circle_thickness(CImage,int32,int32,int32,int32,num32,num32,num32) is native(LIB_PATH) is export {*}

sub crop(CImage,int32,int32,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub random_crop(CImage,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub random_augment(CImage,num32,num32,int32,int32,int32) returns CImage is native(LIB_PATH) is export {*}

sub add_pixel(CImage,int32,int32,int32,num32) is native(LIB_PATH) is export {*}

sub get_layer(CImage,int32) returns CImage is native(LIB_PATH) is export {*}

sub rgb_to_hsv(CImage) is native(LIB_PATH) is export {*}

sub hsv_to_rgb(CImage) is native(LIB_PATH) is export {*}

sub rgb_to_bgr(CImage) is native(LIB_PATH) is export {*}

sub bgr_to_rgb(CImage) is native(LIB_PATH) is export {*}

sub yuv_to_rgb(CImage) is native(LIB_PATH) is export {*}

sub rgb_to_yuv(CImage) is native(LIB_PATH) is export {*}
