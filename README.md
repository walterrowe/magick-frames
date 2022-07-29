![Magick Frames](assets/magick-frames.png)

# Magick Frames

Magick Frames applies a decorative border and shadow around an image, and places logo or text below the image or places a logo inside the image at a specified edge. One of the significant features of Magick Frames is that it scales and positions your logo or text automatically based on your image dimensions, aspect ratio, and orientation. Square, vertical, and horizontal images all look as expected. The script has been tested on images as small as 300 pixels and as large as full size 45MP images with over 8000 pixels on the long edge.

Options for decorating the border of your image and applying text or a logo include:

- add a shadow around all the edges or a drop shadow bottom right
- add picture frame of 1-pixel black + 10-pixels white border
- apply either a two-row text-based label or an image-based logo
- place the text label or logo either inside or below the image
- specify where inside the image to place the text or logo image
- specify the color of the background to use for the output file
- specify the color of the text-based label for the output file
- specify the font of the text-based label for the output file
- specify a default logo file and two-row label text in the script
- specify an alternate logo watermark file on the command line

Options for the macOS AppleScript droplet include:

- drag-n-dropping files onto the droplet using Finder will decorate the selected files
- double-clicking the droplet will open a file chooser and decorate the selected files
- referencing in an export recipe of an image editing tool to decorate images on export

# What Is Magick Frames

Magick Frames is a combination of a macOS/Linux shell script [frame_it](frame_it) and a macOS AppleScript [logo_white_pic.applescript](logo_white_pic.applescript) Droplet. The frame_it shell script uses the [ImageMagick](https://imagemagick.org/) image manipulation package to apply a professional looking decoration to a selection of image files.

By default the `frame_it` shell script preserves your input files and creates new output files as the decorated versions. The text `-frame` is inserted into the output filenames before the extension. For example, an input file named `my-image.jpg` will have an output a file named `my-image-frame.jpg`. The output file is written to the same folder as the input file.

You can choose instead to overwrite your input file by providing the option `-o` or `--overwrite`.

The AppleScript app can be used as a stand alone macOS Droplet where you drag-n-drop files selected in Finder onto the Droplet and it decorates them, or as an "Open With" app in export settings of your favorite image editing tool such as Capture One Pro.

With Capture One Pro it works like this.

1. Add the Finder Droplet to the Open With field of an Export Recipe
1. Export your selected files with your configured Export Recipe

What really happens is this:

1. The Export Recipe writes your desired output files
1. The Export Recipe passes each output filename to the Droplet
1. The Droplet passes your options and output filename to the frame_it shell script
1. The frame_it shell script decorates your output file using your chosen frame_it options

While this may look complicated it works quickly and invisibly. If you have your output folder open in Finder in Icon view as your images are exported, you can watch the undecorated files appear in the folder, and then see their icons change as they become decorated.

The AppleScript Droplet only works on macOS. The frame_it shell script should work on macOS and Linux.

The frame_it shell script offers numerous options to tailor the style of the decoration. See the command line options section near the bottom for a detailed descriptione of these options.

# Installation

Installation and use of this package requires saving AppleScript scripts as macOS Droplets, installing the open source [ImageMagick](https://imagemagick.org/) software using a tool such as [Home Brew](https://brew.sh/), and using a macOS Terminal or Linux shell window to copy a script to your system's /usr/local/bin directory.

- Install the [ImageMagick](https://imagemagick.org/) software package on your system (e.g. `brew install imagemagick`)
- Edit [frame_it](frame_it) shell script to set default label text (`label1`, `label2`) and logo file (`watermark`)
- Copy the edited [frame_it](frame_it) shell script into your system's /usr/local/bin folder
- (macOS) Open [logo_white_pic.applescript](logo_white_pic.applescript), and save as a Droplet named after one of the styles in the `optionsList` property list.

# Creating The AppleScript Droplet

The AppleScript script is distributed as "[logo_white_pic.applescript](logo_white_pic.applescript)". This is one of the predefined styles. The script has a list of predefined styles in a property called  `optionsList`. Save the script as an app with one of the predefined style names, and images will be decorated with the options associated with that named style. Save with different predefined names to have multiple droplets available.

1. Open [logo_white_pic.applescript](logo_white_pic.applescript) script in the macOS AppleScript Editor
1. Look at the `optionsList` property of predefined styles and their associated options
1. Use File > Export, choose type Application, and save a Droplet as each of your desired style names

Save the script as an app with one of predefined style names and you get a macOS Droplet, a click-able app that opens a file chooser, and an app that can be opened by image editing software for each file that is exported.

If you feel comfortable with AppleScript Script Editor, you can add your own custom styles to the style list. Carefully follow the instructions inside the script above the style list. Save the script as an app with your custom style name(s) and you will get the same behavior for your custom styles as you get with the predefined styles distributed in the script.

## Predefined Styles

See the command line section at the bottom for a description of all the supported options.

NOTE - ALL PREDEFINED STYLES OVERWRITE THE SOURCE IMAGE (option `-o` or `--overwrite`)

### Logo Inside Image, White Background

- logo_over_white: -o -ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_drop: -o -ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_pic: -o -ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_white_drop_pic: -o -ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png

### Logo Inside Image, Gray Background

- logo_over_gray: -o -ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_drop: -o -ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_pic: -o -ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png
- logo_over_gray_drop_pic: -o -ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png

### Logo Below Image, White Background

- logo_white: -o -l -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_drop: -o -l -d -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_pic: -o -l -p -mc=#ffffff -w=~/Pictures/watermark_gray.png
- logo_white_drop_pic: -o -l -d -p -mc=#ffffff -w=~/Pictures/watermark_gray.png

### Logo Below Image, Gray Background

- logo_gray: -o -l -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_drop: -o -l -d -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_pic: -o -l -p -mc=#383838 -w=~/Pictures/watermark_white.png
- logo_gray_drop_pic: -o -l -d -p -mc=#383838 -w=~/Pictures/watermark_white.png

### Text Inside Image, White Background

- text_over_white: -o -ot -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_drop: -o -ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_pic: -o -ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_white_drop_pic: -o -ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0

### Text Inside Image, Gray Background

- text_over_gray: -o -ot -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_drop: -o -ot -d -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_pic: -o -ot -p -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_gray_drop_pic: -o -ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0

### Text Below Image, White Background

- text_white: -o -t -mc=#ffffff -tc=#383838
- text_white_drop: -o -t -d -mc=#ffffff -tc=#383838
- text_white_pic: -o -t -p -mc=#ffffff -tc=#383838
- text_white_drop_pic: -o -t -d -p -mc=#ffffff -tc=#383838

### Text Below Image, Gray Background

- text_gray: -o -t -mc=#383838 -tc=#E0E0E0
- text_gray_drop: -o -t -d -mc=#383838 -tc=#E0E0E0
- text_gray_pic: -o -t -p -mc=#383838 -tc=#E0E0E0
- text_gray_drop_pic: -o -t -d -p -mc=#383838 -tc=#E0E0E0

# How To Use

The scaling and placement of logos and text were developed using an image with dimensions 3000 wide by 2400 tall, a font of 64 points, and an image logo with dimensions 900 wide by 250 tall pixels. When creating your logo you may want one with dark text for light backgrounds and one with white text for dark backgrounds.

## In macOS Finder

The Droplet included with this package works like any other macOS application. It lets you drag-n-drop items onto the application or opens a file chooser dialog.

1. Drag-n-drop files onto the droplet using Finder to decorate the selected files
1. Double-click the droplet to open a file chooser and decorate the selected files

The droplet name will control how the images you drop or select are decorated.

## In Capture One Export Recipes

The Droplet included with this package works like any other macOS application you can configure into a Capture One Pro Export Recipe.

1. Go to `Open With` field in a Capture One Export Recipe
1. Choose `Other` from the `Open With` drop-down menu
1. Navigate to and select your Dropletlication
1. Select and check the configured Export Recipe
1. Select images to process and press `CMD+D` to export

The frame_it shell script options you specified in `frame_it_options` in the Droplet control how the images files you drop onto the Droplet are decorated.

## At The Command Line

The [frame_it](frame_it) shell script also can be used from the command line on macOS and Linux if you are comfortable with that.

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

# Troubleshooting

If you get an error that the `frame_it` script cannot find the `identify` command, this indicates that the folder where ImageMagick binaries are installed is not in the environment path. Find the directory where the ImageMagick binaries such as `identify` and `magick` are installed. You can edit the script `frame_it` and add that directory to the path. Look for these lines in the `frame_it` script.

```
# ADD IMAGEMAGICK BINARY PATH HERE and uncomment
# export PATH=/path/to/your/imagemagick:$PATH
```

# Recommendation

Make test copies of output files and use the shell script from the command line to experiment with how different styling options look. This will help you determine which options you want to use in your Droplet(s).

# Origins

The frame_it shell script originates from Apple’s Recursive Image File Processing Droplet template. You can read more about it in the [Mac Automation Scripting Guide to Process Dropped Files and Folders](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ProcessDroppedFilesandFolders.html).

1. Open Apple ScriptEditor
2. Navigate to menu option File > New from Template > Droplets > Recursive Image File Processing Droplet

The frame_it AppleScript executes the `frame_it` shell script to decorate the selected image files.

The frame_it shell script uses the [ImageMagick](https://imagemagick.org/) image manipulation tool set with specific options to decorate your image files.
