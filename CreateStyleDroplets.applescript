(*
	AUTHOR

	Author: Walter Rowe
	Contact: walter@walterrowe.com

	Created: 25-Jul-2022
	Updated: 04-Dec-2024

	DESCRIPTION

	The droplets created from this AppleScript work like any other macOS app. You
	can drag-n-drop onto them in Finder,  double-click them to choose files to decorate,
	and as a named app in an export configuration in image editing tools.

	Modifying The Styles List:

	* Look below for the property "styleDroplets" to create your own styles for droplets
	* Read the frame_it shell script to see the options available for styling your images
	* The included styles create NEW files with "-" and style name appended to the name.
		* example: my-image.jpg -> my-image-logo_light.jpg

	Use the CreateStyleDroplets script to create droplets for all the included styles.

	PREREQUISITES

	See the README.md markdown file for detailed instructions on installation and use

	1) install ImageMagick (install with homebrew)
	2) copy the frame_it script to /usr/local/bin	
*)

property version : "6.0"


use AppleScript version "2.8"
use scripting additions

(* TO FILTER FOR IMAGE FILES, LOOK FOR QUICKTIME SUPPORTED IMAGE FORMATS *)
property type_list : {"JPEG", "TIFF", "PNGf", "8BPS", "BMPf", "GIFf"}
property extension_list : {"jpg", "jpeg", "tif", "tiff", "png", "psd", "bmp", "gif"}
property typeIDs_list : {"public.jpeg", "public.tiff", "public.png", "com.adobe.photoshop-image", "com.microsoft.bmp", "com.compuserve.gif", "com.adobe.pdf", "com.apple.pict"}

-- save this script as an app named one of the items below (ig "logo_white_frame") it will use the selected options for frame_it
--
-- you can add your own styles names and options, and save as a new app named for your style to use your chosen options
--
-- CRITICAL -- continued lines must end with ampersand plus OPT+RETURN

property presetDroplets : {Â
	{styleName:"logo_transparent", styleOptions:"-l -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_transparent_drop", styleOptions:"-l -d -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_transparent_frame", styleOptions:"-l -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_transparent_drop_frame", styleOptions:"-l -d -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_transparent_over", styleOptions:"-ol -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_transparent_over_drop", styleOptions:"-ol -d -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_transparent_over_frame", styleOptions:"-ol -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_transparent_over_drop_frame", styleOptions:"-ol -d -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light", styleOptions:"-l -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_drop", styleOptions:"-l -d -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_frame", styleOptions:"-l -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_drop_frame", styleOptions:"-l -d -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_bevel", styleOptions:"-l -b -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_picture", styleOptions:"-l -p -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_light_over", styleOptions:"-ol -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light_over_drop", styleOptions:"-ol -d -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light_over_frame", styleOptions:"-ol -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light_over_drop_frame", styleOptions:"-ol -d -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light_over_bevel", styleOptions:"-ol -b -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_light_over_picture", styleOptions:"-ol -p -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark", styleOptions:"-l -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_drop", styleOptions:"-l -d -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_frame", styleOptions:"-l -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_drop_frame", styleOptions:"-l -d -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_bevel", styleOptions:"-l -b -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_picture", styleOptions:"-l -p -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over", styleOptions:"-ol -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over_drop", styleOptions:"-ol -d -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over_frame", styleOptions:"-ol -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over_drop_frame", styleOptions:"-ol -d -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over_bevel", styleOptions:"-ol -b -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_dark_over_picture", styleOptions:"-ol -p -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"text_transparent", styleOptions:"-t -mc=transparent -tc=#313131"}, Â
	{styleName:"text_transparent_drop", styleOptions:"-t -d -mc=transparent -tc=#313131"}, Â
	{styleName:"text_transparent_frame", styleOptions:"-t -f -mc=transparent -tc=#313131"}, Â
	{styleName:"text_transparent_drop_frame", styleOptions:"-t -d -f -mc=transparent -tc=#313131"}, Â
	{styleName:"text_transparent_over", styleOptions:"-ot -mc=transparent -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_transparent_over_drop", styleOptions:"-ot -d -mc=transparent -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_transparent_over_frame", styleOptions:"-ot -f -mc=transparent -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_transparent_over_drop_frame", styleOptions:"-ot -d -f -mc=transparent -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_light", styleOptions:"-t -mc=#ffffff -tc=#313131"}, Â
	{styleName:"text_light_drop", styleOptions:"-t -d -mc=#ffffff -tc=#313131"}, Â
	{styleName:"text_light_frame", styleOptions:"-t -f -mc=#ffffff -tc=#313131"}, Â
	{styleName:"text_light_drop_frame", styleOptions:"-t -d -f -mc=#ffffff -tc=#313131"}, Â
	{styleName:"text_light_bevel", styleOptions:"-t -b -mc=#ffffff -tc=#333333"}, Â
	{styleName:"text_light_picture", styleOptions:"-t -p -mc=#ffffff -tc=#333333"}, Â
	{styleName:"text_light_over", styleOptions:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"}, Â
	{styleName:"text_light_over_drop", styleOptions:"-ot -d -mc=#ffffff -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_light_over_frame", styleOptions:"-ot -f -mc=#ffffff -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_light_over_drop_frame", styleOptions:"-ot -d -f -mc=#ffffff -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_light_over_bevel", styleOptions:"-ot -b -mc=#ffffff -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_light_over_picture", styleOptions:"-ot -p -mc=#ffffff -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark", styleOptions:"-t -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_drop", styleOptions:"-t -d -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_frame", styleOptions:"-t -f -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_drop_frame", styleOptions:"-t -d -f -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_bevel", styleOptions:"-t -b -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_picture", styleOptions:"-t -p -mc=#313131 -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over", styleOptions:"-ot -mc=#313131 -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over_drop", styleOptions:"-ot -d -mc=#313131 -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over_frame", styleOptions:"-ot -f -mc=#313131 -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over_drop_frame", styleOptions:"-ot -d -f -mc=#313131 -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over_bevel", styleOptions:"-ot -b -mc=#313131 -g=south -tc=#E0E0E0"}, Â
	{styleName:"text_dark_over_picture", styleOptions:"-ot -p -mc=#313131 -g=south -tc=#E0E0E0"} Â
		}

property solidDroplets : {Â
	{styleName:"solid_dark", styleOptions:"-so -oc=#313131 -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_dark_logo", styleOptions:"-sl -oc=#313131 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_dark_darklogo_overlay", styleOptions:"-slo -oc=#222222 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_dark_lightlogo_overlay", styleOptions:"-slo -oc=#222222 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_dark_text", styleOptions:"-st -oc=#222222 -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_dark_darktext_over", styleOptions:"-sto -oc=#222222 -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_dark_lighttext_over", styleOptions:"-sto -oc=#222222 -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_light", styleOptions:"-so -oc=#ffffff -ic=#222222 -g=south "}, Â
	{styleName:"solid_light_logo", styleOptions:"-sl -oc=#ffffff -ic=#222222 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_light_darklogo_overlay", styleOptions:"-slo -oc=#ffffff -ic=#222222 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_light_lightlogo_overlay", styleOptions:"-slo -oc=#ffffff -ic=#222222 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_light_text", styleOptions:"-st -oc=#ffffff -ic=#222222 -g=south -tc=#222222"}, Â
	{styleName:"solid_light_darktext_over", styleOptions:"-sto -oc=#ffffff -ic=#222222 -g=south -tc=#222222"}, Â
	{styleName:"solid_light_lighttext_over", styleOptions:"-sto -oc=#ffffff -ic=#222222 -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_pink", styleOptions:"-so -oc=#FBE7EC -ic=#ffffff -g=south"}, Â
	{styleName:"solid_pink_logo", styleOptions:"-sl -oc=#FBE7EC -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_pink_darklogo_overlay", styleOptions:"-slo -oc=#FBE7EC -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_pink_lightlogo_overlay", styleOptions:"-slo -oc=#FBE7EC -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_pink_text", styleOptions:"-st -oc=#FBE7EC -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_pink_lighttext_over", styleOptions:"-sto -oc=#FBE7EC -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_pink_darktext_over", styleOptions:"-sto -oc=#FBE7EC -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_babyblue", styleOptions:"-so -oc=#B5C8D7 -ic=#222222 -g=south"}, Â
	{styleName:"solid_babyblue_logo", styleOptions:"-sl -oc=#B5C8D7 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_babyblue_darklogo_overlay", styleOptions:"-slo -oc=#B5C8D7 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_babyblue_lightlogo_overlay", styleOptions:"-slo -oc=#B5C8D7 -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_babyblue_text", styleOptions:"-st -oc=#B5C8D7 -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_babyblue_darktext_over", styleOptions:"-sto -oc=#B5C8D7 -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_babyblue_lighttext_over", styleOptions:"-sto -oc=#B5C8D7 -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_teal", styleOptions:"-so -oc=#17342E -ic=#ffffff -g=south"}, Â
	{styleName:"solid_teal_logo", styleOptions:"-sl -oc=#17342E -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_teal_darklogo_overlay", styleOptions:"-slo -oc=#17342E -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"solid_teal_lightlogo_overlay", styleOptions:"-slo -oc=#17342E -ic=#ffffff -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"solid_teal_text", styleOptions:"-st -oc=#17342E -ic=#ffffff -g=south -tc=#F0F0F0"}, Â
	{styleName:"solid_teal_darktext_over", styleOptions:"-sto -oc=#17342E -ic=#ffffff -g=south -tc=#222222"}, Â
	{styleName:"solid_teal_lighttext_over", styleOptions:"-sto -oc=#17342E -ic=#ffffff -g=south -tc=#F0F0F0"} Â
		}

property colorDroplets : {Â
	{styleName:"logo_green_drop_frame", styleOptions:"-l -d -f -mc=#106043 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_green_picture", styleOptions:"-l -p -mc=#106043 -bc=#106043 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_green_picture_on_sw", styleOptions:"-ol -p -mc=#106043 -bc=#106043 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_green_frame_on_sw", styleOptions:"-ol -f -mc=#106043 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_mauve_frame_north", styleOptions:"-f -fc=#958898 -mc=#453848 -l -g=north -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_mauve_frame_south", styleOptions:"-f -fc=#958898 -mc=#453848 -l -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_mauve_picture_south", styleOptions:"-p -bc=#958898 -mc=#453848 -l -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"text_mauve_frame_south", styleOptions:"-f -fc=#958898 -mc=#453848 -t -tc=#958898 -g=south"}, Â
	{styleName:"text_mauve_picture_south", styleOptions:"-p -bc=#958898 -mc=#453848 -t -tc=#958898 -g=south"}, Â
	{styleName:"logo_teal_picture_on_sw", styleOptions:"-p -ol -bc=#17342E -mc=#17342E -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_teal_picture_below", styleOptions:"-p -l -bc=#17342E -mc=#17342E -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_teal_frame_on_sw", styleOptions:"-f -ol -bc=#17342E -mc=#17342E -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_teal_frame_below", styleOptions:"-f -l -bc=#17342E -mc=#17342E -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_on_sw", styleOptions:"-ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_below", styleOptions:"-l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_frame_on_sw", styleOptions:"-f -ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_frame_below", styleOptions:"-f -l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_picture_on_sw", styleOptions:"-p -ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_khaki_picture_below", styleOptions:"-p -l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_pink_on_sw", styleOptions:"-ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_pink_below", styleOptions:"-l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_pink_frame_on_sw", styleOptions:"-f -ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_pink_frame_below", styleOptions:"-f -l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_pink_picture_on_sw", styleOptions:"-p -ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_pink_picture_below", styleOptions:"-p -l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"text_pink_on_sw", styleOptions:"-ot -bc=#FBE7EC -mc=#FBE7EC -g=southwest -tc=#e0e0e0"}, Â
	{styleName:"text_pink_below", styleOptions:"-t -bc=#FBE7EC -mc=#FBE7EC -g=south -tc=#222222"}, Â
	{styleName:"text_pink_frame_on_sw", styleOptions:"-f -ot -bc=#FBE7EC -mc=#FBE7EC -g=southwest -tc=#e0e0e0"}, Â
	{styleName:"text_pink_frame_below", styleOptions:"-f -t -bc=#FBE7EC -mc=#FBE7EC -g=south -tc=#222222"}, Â
	{styleName:"text_pink_picture_on_sw", styleOptions:"-p -ot -bc=#FBE7EC -mc=#FBE7EC -g=southwest -tc=#e0e0e0"}, Â
	{styleName:"text_pink_picture_below", styleOptions:"-p -t -bc=#FBE7EC -mc=#FBE7EC -g=south -tc=#222222"}, Â
	{styleName:"logo_blue_on_sw", styleOptions:"-ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_blue_below", styleOptions:"-l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_blue_frame_on_sw", styleOptions:"-f -ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_blue_frame_below", styleOptions:"-f -l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_blue_picture_on_sw", styleOptions:"-p -ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_blue_picture_below", styleOptions:"-p -l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_slate_on_sw", styleOptions:"-ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_slate_below", styleOptions:"-l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_slate_frame_on_sw", styleOptions:"-f -ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_slate_frame_below", styleOptions:"-f -l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_slate_picture_on_sw", styleOptions:"-p -ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_slate_picture_below", styleOptions:"-p -l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_picture_below", styleOptions:"-p -l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_picture_on_sw", styleOptions:"-p -ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_frame_on_sw", styleOptions:"-f -ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_frame_below", styleOptions:"-f -l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_below", styleOptions:"-l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_chestnut_on_sw", styleOptions:"-ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_picture_below", styleOptions:"-p -l -mc=#AE4B11 -bc=#8E4220 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_picture_on_sw", styleOptions:"-p -ol -mc=#AE4B11 -bc=#8E4220 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_frame_on_sw", styleOptions:"-f -ol -mc=#AE4B11 -bc=#8E4220 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_frame_below", styleOptions:"-f -l -mc=#AE4B11 -bc=#8E4220 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_below", styleOptions:"-l -mc=#AE4B11 -bc=#8E4220 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_autumn_on_sw", styleOptions:"-ol -mc=#AE4B11 -bc=#8E4220 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_goldenrod_picture_on_sw", styleOptions:"-p -ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_goldenrod_frame_on_sw", styleOptions:"-f -ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_goldenrod_frame_below", styleOptions:"-f -l -bc=#EDD290 -mc=#DAA520 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_goldenrod_on_sw", styleOptions:"-ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_goldenrod_below", styleOptions:"-l -bc=#EDD290 -mc=#DAA520 -g=south -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"text_seashell_picture_on_south", styleOptions:"-p -ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south"}, Â
	{styleName:"text_seashell_frame_on_south", styleOptions:"-f -ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south"}, Â
	{styleName:"text_seashell_frame_below", styleOptions:"-f -t -tc=#807A77 -mc=#FFF5EE -g=south"}, Â
	{styleName:"text_seashell_on_south", styleOptions:"-ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south"}, Â
	{styleName:"text_seashell_below", styleOptions:"-t -tc=#807A77 -mc=#FFF5EE -g=south"}, Â
	{styleName:"logo_babyblue_picture_on_sw", styleOptions:"-p -ol -bc=#BFB8B3 -mc=#B5C8D7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_babyblue_picture_below", styleOptions:"-p -l -bc=#BFB8B3 -mc=#B5C8D7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_babyblue_frame_on_sw", styleOptions:"-f -ol -mc=#B5C8D7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_babyblue_frame_below", styleOptions:"-f -l -mc=#B5C8D7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"logo_babyblue_on_sw", styleOptions:"-ol -mc=#B5C8D7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"logo_babyblue_below", styleOptions:"-l -mc=#B5C8D7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"text_babyblue_picture_on_south", styleOptions:"-p -ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#B5C8D7 -g=south"}, Â
	{styleName:"text_babyblue_picture_below", styleOptions:"-p -t -tc=#434949 -mc=#B5C8D7 -g=south"}, Â
	{styleName:"text_babyblue_frame_on_south", styleOptions:"-f -ot -tc=#FFE5F3 -mc=#B5C8D7 -g=south"}, Â
	{styleName:"text_babyblue_frame_below", styleOptions:"-f -t -tc=#434949 -mc=#B5C8D7 -g=south"}, Â
	{styleName:"text_babyblue_on_south", styleOptions:"-ot -tc=#FFE5F3 -mc=#B5C8D7 -g=south"}, Â
	{styleName:"text_babyblue_below", styleOptions:"-t -tc=#434949 -mc=#B5C8D7 -g=south"} Â
		}

property customDroplets : {Â
	{styleName:"light_matte_dark_logo", styleOptions:"-l -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"dark_matte_light_logo", styleOptions:"-l -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"light_matte_light_logo_over", styleOptions:"-ol -g=southwest -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"light_matte_dark_logo_over", styleOptions:"-ol -g=southwest -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"dark_matte_light_logo_over", styleOptions:"-ol -g=southwest -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"}, Â
	{styleName:"dark_matte_dark_logo_over", styleOptions:"-ol -g=southwest -f -mc=#313131 -w=~/Pictures/watermarks/watermark_dark.png"}, Â
	{styleName:"text_light_academy", styleOptions:"-t -mc=#ffffff -tc=#313131 -tf=Academy-Engraved-LET-Plain:1.0"}, Â
	{styleName:"text_light_frame_academy", styleOptions:"-t -f -mc=#ffffff -tc=#313131 -tf=Academy-Engraved-LET-Plain:1.0"}, Â
	{styleName:"text_dark_academy", styleOptions:"-t -mc=#313131 -tc=#E0E0E0 -tf=Academy-Engraved-LET-Plain:1.0"}, Â
	{styleName:"text_dark_frame_academy", styleOptions:"-t -f -mc=#313131 -tc=#E0E0E0 -tf=Academy-Engraved-LET-Plain:1.0"} Â
		}

property styleDroplets : presetDroplets & solidDroplets & colorDroplets & customDroplets


-- get the list of style names
on getStyleNames()
	set styleNames to {} as list
	repeat with styleItem in styleDroplets
		set end of styleNames to styleName of styleItem
	end repeat
	return sortList(styleNames) as list
end getStyleNames

-- get the options for a specific style
on getStyleOptions(styleName as text)
	repeat with styleDroplet in styleDroplets
		if (styleName of styleDroplet) is styleName then return styleOptions of styleDroplet as text
	end repeat
	return false as boolean
end getStyleOptions

-- split a string based on a specific delimiter
on joinText(theText as list, theDelimiter as text)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText as text
	set AppleScript's text item delimiters to ""
	return theTextItems
end joinText

-- split a string based on a specific delimiter
on splitText(theText as text, theDelimiter as text)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

-- sort a list
on sortList(theList as list)
	set theIndexList to {}
	set theSortedList to {}
	repeat (length of theList) times
		set theLowItem to ""
		repeat with a from 1 to (length of theList)
			if a is not in theIndexList then
				set theCurrentItem to item a of theList as text
				if theLowItem is "" then
					set theLowItem to theCurrentItem
					set theLowItemIndex to a
				else if theCurrentItem comes before theLowItem then
					set theLowItem to theCurrentItem
					set theLowItemIndex to a
				end if
			end if
		end repeat
		set end of theSortedList to theLowItem
		set end of theIndexList to theLowItemIndex
	end repeat
	return theSortedList
end sortList

-- "on run" executes when you double-click a droplet in Finder
on run
	set createStyleDroplets to "CreateStyleDroplets"
	
	-- get path:to:me.app: and "me"
	set appPath to path to me as text -- path:to:me.app: alias format
	set appName to name
	
	-- if we are running as the name "CreateStyleDroplets", create a droplet for all the known styles
	if appName is createStyleDroplets then
		createDroplets()
		return
	end if
	
	-- either run a style-named droplet or choose from list of styles
	set styleNames to getStyleNames()
	
	set styleList to {} as list
	if styleNames contains appName then
		-- if run as a style-named droplet, use that style name
		set styleList to appName as list
	else
		-- if run from Script Editor, choose from list of known styles
		set styleList to choose from list styleNames with multiple selections allowed
	end if
	
	-- styleList will be false if 'Cancel' pressed on choose from list
	if styleList is not false then
		-- styleList will be false if 'Cancel' pressed on choose from list
		set selected_items to choose file with prompt "Select the images to decorate: " of type {"public.image"} with multiple selections allowed
		
		repeat with styleName in styleList
			-- get desired frame_it options based on invoked app name
			set styleOptions to getStyleOptions(styleName)
			process_items(selected_items, styleOptions, styleName)
		end repeat
	end if
end run

-- "on open" processes items dropped onto it in Finder or sent to it via "open app with parameters"
on open dropped_items
	set filler to "formatting"
	
	-- convert path:to:me.app: into "me" (note the trailing colon this -2 below)
	set appPath to path to me as string -- path:to:me.app: alias format
	set appName to name
	
	-- either run a style-named droplet or choose from list of styles
	set styleNames to getStyleNames()
	
	if styleNames contains appName then
		-- if run as a style-named droplet, use that style name
		set styleList to appName as list
	else
		-- if run from Script Editor, choose from list of known styles
		set styleList to choose from list styleNames with multiple selections allowed
	end if
	
	-- styleList will be false if 'Cancel' pressed on choose from list
	if styleList is not false then
		repeat with styleName in styleList
			-- get desired frame_it options based on invoked app name
			set styleOptions to getStyleOptions(styleName)
			process_items(dropped_items, styleOptions, styleName)
		end repeat
	end if
end open

-- create the frame_it commands and execute them
on process_items(the_items, styleOptions, styleName)
	repeat with this_item in the_items
		-- get the POSIX path of the current file we are processing
		set this_path to quoted form of POSIX path of this_item
		-- build the frame_it command line
		set frame_it to "eval $(/usr/libexec/path_helper -s); frame_it " & styleOptions & " -s=" & styleName & " " & this_path
		-- run frame_it on the named file
		try
			do shell script frame_it
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & POSIX path of this_item
		end try
	end repeat
end process_items

-- create the style droplets
on createDroplets()
	
	set styleNames to getStyleNames()
	
	-- add unstyled droplet to list of droplet names
	set unStyledDroplet to "Style Chooser"
	set end of styleNames to unStyledDroplet
	
	
	-- select the droplet folder and droplet script with Finder 
	tell application "Finder"
		set dropletFolder to POSIX path of (choose folder with prompt "Select the folder for your Magick Frames droplets: ")
		set dropletSource to POSIX path of (path to me)
		set iconSource to (POSIX path of ((folder of (path to me)) as string)) & "/droplet.icns"
	end tell
	
	
	-- set the initial progress bar information
	set dropletCount to length of styleNames
	set progress total steps to dropletCount
	set progress completed steps to 0
	set progress description to "Creating droplets..."
	set progress additional description to "Preparing to process."
	
	repeat with dropletNum from 1 to count of styleNames
		-- set destination droplet name
		set dropletName to item dropletNum of styleNames
		set droplet to dropletFolder & dropletName & ".app"
		
		set iconTarget to droplet & "/Contents/Resources/"
		
		-- set shell command to create the droplet
		set createDroplet to "osacompile -x -o " & quoted form of droplet & " " & quoted form of dropletSource
		set copyIcon to "/bin/cp " & quoted form of iconSource & " " & quoted form of iconTarget
		
		-- Update the progress detail
		set progress additional description to "Creating droplet " & dropletNum & " of " & dropletCount
		
		-- execute the shell command to build the droplet
		try
			do shell script createDroplet
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & droplet
		end try
		
		-- execute the shell command to build the droplet
		try
			do shell script copyIcon
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & droplet
		end try
		
		-- Increment the progress
		set progress completed steps to dropletNum
		
	end repeat
	
	-- tell the user how many droplets were created, where they were created, and their names
	display dialog "Created " & ((count of styleNames) as string) & " droplets in: " & return & dropletFolder
	-- open the droplet folder for the user
	tell application "Finder" to open (POSIX file dropletFolder as alias)
	
end createDroplets