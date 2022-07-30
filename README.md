![Magick Frames](assets/magick-frames.png)

# Magick Frames

Magick Frames applies a decorative border and shadow around an image, and places text or an image logo either below the image or inside the image at a specified edge. A significant feature of Magick Frames is that it scales and positions your text or logo based on your image dimensions, aspect ratio, and orientation. Square, vertical, and horizontal images all look as expected. The script has been tested on images from as small as 300 pixels to as large as full size 45MP with over 8000 pixels on the long edge.

Options for decorating your image and applying text or a logo include:

- optionally add a picture frame of 1-pixel dark + 10-pixels light
- choose either a shadow on all the edges or a drop shadow bottom right
- choose either a two-row text-based label or an image-based logo
- choose whether to place the text label or logo inside or below the image
- choose where inside the image to place the text or image logo
- choose the matte color of the background to use for the output file
- choose the text color of the text-based label added to the output file
- choose the font of the text-based label added to the output file
- choose an alternate logo watermark file on the command line

You can name a default logo file and enter the two-row label text in the script. An alternate logo file can be named on the command line. The two-row label text cannot be overridden on the command line at this time.

Options for the macOS AppleScript droplet include:

- drag-n-drop files onto the droplet using Finder to decorate the selected files
- double-click the droplet to open a file chooser and decorate the selected files
- add to an export recipe of an image editing tool to decorate images on export

# What Is Magick Frames

Magick Frames is a combination of a macOS/Linux shell script and a macOS AppleScript droplet. The shell script uses the [ImageMagick](https://imagemagick.org/) image manipulation package to apply a professional looking decoration to a selection of image files.

By default the `frame_it` shell script preserves your input files by creating new output files with `-frame` is inserted  before the extension in the output filename. An input file named `my-image.jpg` will have an output a file named `my-image-frame.jpg`. The output file is always placed in the same folder as the input file.You can tell the shell script to overwrite your input file by adding the `-o` or `--overwrite` option.

The AppleScript droplet only works on macOS. The frame\_it shell script should work on macOS and Linux.

The frame\_it shell script offers numerous options to tailor the style of the decoration. See the command line options section near the bottom for a detailed descriptione of these options.

# Installation

Installation and use of this package requires saving AppleScript scripts as macOS droplets, installing the open source [ImageMagick](https://imagemagick.org/) software using a tool such as [Home Brew](https://brew.sh/), and using a macOS Terminal or Linux shell window to copy a script to your system's /usr/local/bin directory.

- Install the [ImageMagick](https://imagemagick.org/) software package on your system (e.g. `brew install imagemagick`)
- Edit [frame_it](frame_it) shell script to set default label text (`label1`, `label2`) and your logo file (`watermark`)
- Copy the edited [frame_it](frame_it) shell script into your system's /usr/local/bin folder
- (macOS) Open [logo_white_pic.applescript](logo_white_pic.applescript), and save as a droplet named one of the styles in the `optionsList` property list.

Use a Terminal command line to test the `frame_it` script to ensure it can access the ImageMagick tools. If the `frame_it` script says it cannot find the `identify` or `magick` command, this indicates that the folder containing the ImageMagick tools is not in the script’s environment path. Locate the directory where the ImageMagick tools are installed.

Edit the `frame_it` script and look for these lines.

```
# ADD IMAGEMAGICK BINARY PATH HERE and uncomment
# export PATH=/path/to/your/imagemagick:$PATH
```

In the line containing `export`, replace `/path/to/your/imagemagick` with the folder where your ImageMagick tools reside, uncomment the line (remove the `# ` at the beginning), and save the file.

# Creating The AppleScript Droplet

The AppleScript script is distributed as "[logo_white_pic.applescript](logo_white_pic.applescript)". This is the name of one of the included styles. See the names of all the included styles in a property called `optionsList`. Save the script as an app named one of these included styles and images will be decorated with the options associated with the named style. Save the AppleScript as multiple different included style names to create multiple droplets for use.

1. Open [logo_white_pic.applescript](logo_white_pic.applescript) script in the macOS AppleScript Editor
1. Look at the `optionsList` property of predefined styles and their associated options
1. Use File > Export, choose type Application, and save a Droplet as each of your desired style names

SPEED TIP: Once you create one droplet, use Finder to copy-n-paste as names of other defined styles. This is faster than exporting the script multiple times from the AppleScript Script Editor.

If you feel comfortable with the AppleScript Script Editor, you can add your own styles to the style list. Carefully follow the instructions above the `optionsList` style list inside the script. Save the script as a droplet with your custom style name(s) and test it. You should get the same behavior with your custom style as you get with the included styles.

The AppleScript droplet originates from Apple’s Recursive Image File Processing Droplet template. Find more information in the [Mac Automation Scripting Guide to Process Dropped Files and Folders](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ProcessDroppedFilesandFolders.html).

Below is a list of all the styles included in the script and their options. See the command line section at the bottom for a complete description of all the supported options.

**NOTE**: the predefined styles preserve the source image. Add option `-o` or `--overwrite` to overwrite the source.

### Logo Inside Image, White Background

- logo_over_white: -ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_drop: -ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_pic: -ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_drop_pic: -ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png

### Logo Inside Image, Gray Background

- logo_over_gray: -ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_drop: -ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_pic: -ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_drop_pic: -ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png

### Logo Below Image, White Background

- logo_white: -l -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_drop: -l -d -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_pic: -l -p -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_drop_pic: -l -d -p -mc=#ffffff -w=~/Pictures/watermark_gray.png

### Logo Below Image, Gray Background

- logo_gray: -l -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_drop: -l -d -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_pic: -l -p -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_drop_pic: -l -d -p -mc=#383838 -w=~/Pictures/watermark_white.png

### Text Inside Image, White Background

- text_over_white: -ot -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_drop: -ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_pic: -ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_drop_pic: -ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0

### Text Inside Image, Gray Background

- text_over_gray: -ot -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_drop: -ot -d -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_pic: -ot -p -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_drop_pic: -ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0

### Text Below Image, White Background

- text_white: -t -mc=#ffffff -tc=#383838
- text_white_drop: -t -d -mc=#ffffff -tc=#383838
- text_white_pic: -t -p -mc=#ffffff -tc=#383838
- text_white_drop_pic: -t -d -p -mc=#ffffff -tc=#383838

### Text Below Image, Gray Background

- text_gray: -t -mc=#383838 -tc=#E0E0E0
- text_gray_drop: -t -d -mc=#383838 -tc=#E0E0E0
- text_gray_pic: -t -p -mc=#383838 -tc=#E0E0E0
- text_gray_drop_pic: -t -d -p -mc=#383838 -tc=#E0E0E0

# How To Use

The scaling and placement of logos and text were developed using an image with dimensions 3000 wide by 2400 high pixels, a font of 64 points, and an image logo with dimensions 900 wide by 250 high pixels. When creating your own logo make one with dark text for light backgrounds and another with light text for dark backgrounds.

## In macOS Finder

The AppleScript droplet included with this package works like any other macOS application.

- drag-n-drop files onto the droplet using Finder to decorate the selected files
- double-click the droplet to open a file chooser and decorate the selected files
- add to an export recipe of an image editing tool to decorate images on export

The droplet name controls how the selected images are decorated as described above.

## In Capture One Export Recipes

The droplet included with this package can configured into a Capture One Pro Export Recipe like any other application.

1. Go to `Open With` field in a Capture One Export Recipe
1. Choose `Other` from the `Open With` drop-down menu
1. Navigate to and select one of your droplet applications
1. Select and check the configured Export Recipe
1. Select images to export and press `CMD + D` or the Export button

The droplet name controls how the exported images are decorated.

This is what really happens is on export.

1. The Export Recipe exports your selected images to your designated folder
1. The Export Recipe passes each output filename to the droplet named in "Open with"
1. The droplet passes the correct options and output filename to the frame\_it shell script
1. The frame\_it shell script decorates your output file using the chosen frame\_it options

This process may seem complicated, but it works quickly and invisibly. Open your output folder in Finder icon view before you export, watch as the exported files appear in the folder, and then notice the previews change as they are decorated by frame\_it.

## At The Command Line

The [frame_it](frame_it) shell script can be used from the command line on macOS and Linux.

DEFAULTS: When no options are provided, the default behavior is:

- center the image over a shadowed background
- do not apply a picture frame to the image
- place an image-based logo beneath the image
- write the decorated output to a separate file

Place the [frame_it](frame_it) shell script in /usr/local/bin and run it with no options to see a usage message showing all of the available styling options.

```text
usage: frame_it [ OPTIONS ] image [ .. ]

OPTIONS:

-d | --dropshadow         specifies a drop shadow (offset bottom and right) vs
                          the default that centers the image in an all-edges shadow

-o | --overwrite          specifies to overwrite the original files vs the default
                          of keeping them and writing new files with "-frame" inserted
                          before the suffix

-p | --picture            add a 1-pixel black inner border + 10-pixel white outer border

-f=font |                 specify the font to use for the two-row label text logo
--font=font

-t | --text               specifies to use a two-line text logo underneath the image

-ot | --overlaytext       specifies to use a two-line text logo inside the image

-tc=color |               specifies the color of the two-line text logo
--textcolor=color         default #383838 below image, #E0E0E0 inside image

-l | --logo               specifies to place an image-based logo underneath the image
                          DEFAULT style when no options are specified

-ol | --overlaylogo       specifies to place an image-based logo inside the image

-mc=color |               specifies the color of the matte background (default white)
--mattecolor=color

-w=your_logo |            specifies the image-based logo to use as the watermark that
--watermark=your_logo     that is placed below or inside the image.

-g=placement |            specifies which inside edge or corner of the image the logo
--gravity=placement       or text should be nearest. The following are accepted values.
                          The logo or text is inset from the specified edge or corner.
                          DEFAULT edge is south/bottom.

                            +----------------------------------------------------+
                            | topleft               top                 topright |
                            |                                                    |
                            | left                 middle                  right |
                            |                                                    |
                            | bottomleft           bottom            bottomright |
                            +----------------------------------------------------+

                            +----------------------------------------------------+
                            | northwest            north               northeast |
                            |                                                    |
                            | west                 center                   east |
                            |                                                    |
                            | southwest            south               southeast |
                            +----------------------------------------------------+
```

Make test copies of image files and use the shell script from the command line to experiment with how different styles decorate your test images. This will help you choose which options you want to use in your droplet(s).
