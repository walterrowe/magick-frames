![Magick Frames](assets/magick-frames.png)

# Donations

If you like this package and would like to donate to support it, buy me a coffee - as many coffees as you like! I really like coffee!!!

[Buy Me A Coffee](https://buymeacoffee.com/walterrowe)

Look at the [Buy Me A Coffee Extras](https://buymeacoffee.com/walterrowe/extras) page to get one-on-one help setting this up and using it.

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

You must name a default logo file and enter the two-row label text in the `frame_it` shell script. You can specify an alternate logo file on the command line or in different macOS droplet styles. The two-row label text cannot be overridden on the command line at this time.

# Assumptions

This is not a simple click-install utility. Installation and configuration requires using a Terminal window to type in commands at a command prompt. You have to install the ImageMagick open source software suite, and edit and copy a Unix shell script. macOS users also will want to run an included AppleScript.

If these are unfamiliar terms, ask me for assistance. You can use the [Buy Me A Coffee](https://buymeacoffee.com/walterrowe/extras) page to contact me and schedule one-on-one online video call. I have decades of experience with macOS and Unix and can help.

# What Is Magick Frames

Magick Frames applies a professional looking decoration to a selection of image files. It adds a pleasing outer edge shadow, a logo or text below or inside the image, and a light or dark matte around the edges. The included Unix shell script run [ImageMagick](https://imagemagick.org/) commands to decorate your image. The included StyleDroplet AppleScript simply runs the Unix shell script with different predefined options that I created. There are instructions later in this document for adding your own styles.

The StyleDroplet AppleScript only runs on macOS. The ImageMagick tools and `frame_it` Unix shell script run on macOS and Linux.

By default the `frame_it` Unix shell script preserves your input file by saving the decorated image to a new output file with `-frame` inserted  before the extension in the output filename. An input file named `my-image.jpg` will have an output a file named `my-image-frame.jpg`. The output file is always placed in the same folder as the input file. You can tell the shell script to overwrite your input file by adding the `-o` or `--overwrite` option.

The `frame_it` shell script offers numerous options to tailor the style of decoration around your images. The StyleDroplet AppleScript includes a list of predefined options documented below. See the command line options section at the end for a detailed descriptione of these options.

# Installation and Configuration

## Create Logo Watermarks

My logo image file is made with these specifications based on a 3000w x 2400h pixel image file:

- 900 pixels wide and 250 pixels tall
- use a transparent background
- save your logo image files as PNG files
- make a light colored logo for dark mattes and image areas (`watermark_light.png`)
- make a dark colored logo for light mattes and image areas (`watermark_dark.png`)
- place your logos in your Pictures folder
- DEFAULT: the default watermark logo filename in `frame_it` is `~/Pictures/watermark_dark.png`

## Install ImageMagick

Installation and use of this package requires saving AppleScript scripts as macOS droplets, installing the open source [ImageMagick](https://imagemagick.org/) software using a tool such as [HomeBrew](https://brew.sh/), and using a macOS Terminal or Linux shell window to copy a script to your system's /usr/local/bin directory.

## Install The Shell Script

First you need to edit the [frame_it](frame_it) shell script to set default label text (`label1`, `label2`) and the logo file (`watermark`) you created. Copy the edited [frame_it](frame_it) shell script into your system's /usr/local/bin folder.

After installing ImageMagick and copying `frame_it` to /usr/local/bin, you need to test `frame_it`. You will need a test image to use for this. Open a Terminal window to test the `frame_it` script to ensure it can access the ImageMagick tools.

```shell
% frame_it my-image.jpg
```

You should see an output file such as `my-image-frame.jpg` in the folder containing your test image.

If the `frame_it` script says it cannot find the `identify` or `magick` command, this indicates that the folder containing the ImageMagick tools is not in the script’s environment path. Locate the directory containing the ImageMagick tools, then edit the `frame_it` script and look for these lines. Here you will add the folder containing the ImageMagic tools so the script can find them.

```shell
# ADD IMAGEMAGICK BINARY PATH HERE and uncomment
# export PATH=/path/to/your/imagemagick:$PATH
```

In the line above containing `export`, replace `/path/to/your/imagemagick` with the folder containing the ImageMagick tools, uncomment the line (remove the `# ` at the beginning), and re-save the file. You will need to re-copy the script to the /usr/local/bin folder.

## Create The Style Droplets

The Style Droplets work on macOS only. Each Style Droplet you create becomes a macOS app that lets you:

- drag-n-drop files onto the droplet using Finder to decorate the selected files
- double-click the droplet to open a file chooser and decorate the selected files
- add to an export recipe of an image editing tool to decorate images on export

There are two ways to create the droplets for macOS.

1. Open the StyleDroplet AppleScript file in Script Editor and export as an app.
1. Open the CreateStyleDroplets AppleScript file in ScriptEditor and run it.

The [StyleDroplet](StyleDroplet.applescript) AppleScript is a style droplet runs the `frame_it` script to decorate your image files. The StyleDroplet AppleScript includes a set of predefined styles. The names of these included styles are in a property list called `styleDroplets`. Export the script in Script Editor as an app named for one of the included styles.

The [CreateStyleDroplets](CreateStyleDroplets.applescript) AppleScript creates style droplets for all the predefined styles in the StyleDroplet script.

When a style droplet runs it looks for it's own name in the styles property list and runs the `frame_it` script with the associated options for that style to decorate the selected or dropped images. If you export the StyleDroplet as logo_dark, when it runs it will look for logo_dark in the style list and use the frame_it options for logo_dark to decorate your image. Export the StyleDroplet as different style names from the `styleDroplets` list to create multiple droplets that decorate your images in different styles.

### Export Individual Style Droplets

You can create individual style droplets for only the styles you want to use.

1. Open [StyleDroplet](StyleDroplet.applescript) script in the macOS AppleScript Editor
1. Look at the `styleDroplets` property of included styles and their associated options
1. Use File > Export, choose type Application, and save a Droplet as each of your desired style names

SPEED TIP: Once you create one droplet, use Finder to copy-n-paste as names of other defined styles. This is faster than exporting the script multiple times from the AppleScript Script Editor.

### Create All Style Droplets

Use the [CreateStyleDroplets](CreateStyleDroplets.applescript) AppleScript to create style droplets for all of the styles in the `styleDroplets` property list. It lets you select the folder where you want your droplets to be created and creates a droplet for each of the included styles. When it is finished it opens the selected folder in Finder so you can see all the droplets.

The AppleScript droplet originates from Apple’s Recursive Image File Processing Droplet template. Find more information in the [Mac Automation Scripting Guide to Process Dropped Files and Folders](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ProcessDroppedFilesandFolders.html).

### Included Styles

Below is a list of all the styles included in the script and their options. See the command line section at the bottom for a complete description of all the supported options.

**NOTE**: the included styles preserve the source image. Edit the StyleDroplet AppleScript and add option `-o` or `--overwrite` to overwrite the source.

- styles with `text` in the name use the two-row text-based labels for watermarking
- styles with `logo` in the name use the image-based logo for watermarking (logo-based is the default)
- styles with `over` in the name place the text or logo "over" (inside) the image (centered below is the default)
- styles with `drop` in the name use a drop-shadow vs shadow on all edges (all edges is the default)
- styles with `pic` in the name add the picture frame to the images (no picture frame is the default)
- styles with `white` in the name use a white background (matte color) (white matte color is the default)
- styles with `gray` in the name use a gray background (matte color)
- styles with `-g` use this option to specify placement inside them image (see `gravity` in command line options)
- styles with a `watermark_light.png` use a transparent watermark with light logo for dark backgrounds
- styles with a `watermark_dark.png` use a transparent watermark with dark logo for light backgrounds

**Logo Inside Image, White Background, Light Logo (assumes logo goes in dark image area)**

- logo_over_light: -ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_light_drop: -ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_light_pic: -ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_light_drop_pic: -ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png

**Logo Inside Image, Gray Background, Light Logo (assumes logo goes in dark image area)**

- logo_over_dark: -ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_dark_drop: -ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_dark_pic: -ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png
- logo_over_dark_drop_pic: -ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png

**Logo Below Image, White Background, Dark Logo (for light matte color below image)**

- logo_light: -l -mc=#ffffff -w=~/Pictures/watermark_dark.png
- logo_light_drop: -l -d -mc=#ffffff -w=~/Pictures/watermark_dark.png
- logo_light_pic: -l -p -mc=#ffffff -w=~/Pictures/watermark_dark.png
- logo_light_drop_pic: -l -d -p -mc=#ffffff -w=~/Pictures/watermark_dark.png

**Logo Below Image, Gray Background, Light Logo (for dark matte color below image)**

- logo_dark: -l -mc=#383838 -w=~/Pictures/watermark_light.png
- logo_dark_drop: -l -d -mc=#383838 -w=~/Pictures/watermark_light.png
- logo_dark_pic: -l -p -mc=#383838 -w=~/Pictures/watermark_light.png
- logo_dark_drop_pic: -l -d -p -mc=#383838 -w=~/Pictures/watermark_light.png

**Text Inside Image, White Background, Light Text (assumes text goes in dark image area)**

- text_over_light: -ot -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_light_drop: -ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_light_pic: -ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0
- text_over_light_drop_pic: -ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0

**Text Inside Image, Gray Background, Light Text (assumes text goes in dark image area)**

- text_over_dark: -ot -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_dark_drop: -ot -d -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_dark_pic: -ot -p -mc=#383838 -g=south -d -tc=#E0E0E0
- text_over_dark_drop_pic: -ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0

**Text Below Image, White Background, Dark Text (for light matte color below image)**

- text_light: -t -mc=#ffffff -tc=#383838
- text_light_drop: -t -d -mc=#ffffff -tc=#383838
- text_light_pic: -t -p -mc=#ffffff -tc=#383838
- text_light_drop_pic: -t -d -p -mc=#ffffff -tc=#383838

**Text Below Image, Gray Background, Light Text (for dark matte color below image)**

- text_dark: -t -mc=#383838 -tc=#E0E0E0
- text_dark_drop: -t -d -mc=#383838 -tc=#E0E0E0
- text_dark_pic: -t -p -mc=#383838 -tc=#E0E0E0
- text_dark_drop_pic: -t -d -p -mc=#383838 -tc=#E0E0E0

### Create Custom Styles

**WARNING**: You MUST use Script Editor to add custom styles. The `styleDroplets` property list uses OPT+[RETURN] to continue the list across multiple lines. Other code editing tools such as Visual Studio Code and Atom are unable to insert this special form of line continuation.

If you feel comfortable with the AppleScript Script Editor, you can add your own styles to the style list. You will see entries for "formatting". These are simply fillers to make it easier to read and group together the defined styles with similar looks.

The property list uses `key:value` pairs where the style name is the key and the `frame_it` style options is the value. Use `frame_it` from the command line to test different options and develop your own custom style settings. Run `frame_it` with NO options to see a complete list of style options. Once you have an options set you like, add a new entry to the property list with unique name and the options you choose, and export a new droplet named for your custom style(s).

```applescript
	{your_style_name:"-your -style -options"} & ¬
```

When you drop files onto or double-click the `logo_over_dark_drop` droplet, the droplet will construct a separate shell command line for each image file as follows:

```text
frame_it -ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png <your image file>
```

This is the `styleDroplets` property list included with `StyleDroplet` and `CreateStyleDroplets` scripts that represent all of the included styles described above.

```applescript
property styleDroplets : {formatting:"filler"} & ¬
	{logo_over_light:"-ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_light_drop:"-ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_light_pic:"-ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_light_drop_pic:"-ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{formatting:"filler"} & ¬
	{logo_over_dark:"-ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_dark_drop:"-ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_dark_pic:"-ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{logo_over_dark_drop_pic:"-ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & ¬
	{formatting:"filler"} & ¬
	{logo_light:"-l -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & ¬
	{logo_light_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & ¬
	{logo_light_pic:"-l -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & ¬
	{logo_light_drop_pic:"-l -d -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & ¬
	{formatting:"filler"} & ¬
	{logo_dark:"-l -mc=#383838 -w=~/Pictures/watermark_light.png"} & ¬
	{logo_dark_drop:"-l -d -mc=#383838 -w=~/Pictures/watermark_light.png"} & ¬
	{logo_dark_pic:"-l -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & ¬
	{logo_dark_drop_pic:"-l -d -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & ¬
	{formatting:"filler"} & ¬
	{text_over_light:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_light_drop:"-ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_light_pic:"-ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_light_drop_pic:"-ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & ¬
	{formatting:"filler"} & ¬
	{text_over_dark:"-ot -mc=#383838 -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_dark_drop:"-ot -d -mc=#383838 -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_dark_pic:"-ot -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & ¬
	{text_over_dark_drop_pic:"-ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & ¬
	{formatting:"filler"} & ¬
	{text_light:"-t -mc=#ffffff -tc=#383838"} & ¬
	{text_light_drop:"-t -d -mc=#ffffff -tc=#383838"} & ¬
	{text_light_pic:"-t -p -mc=#ffffff -tc=#383838"} & ¬
	{text_light_drop_pic:"-t -d -p -mc=#ffffff -tc=#383838"} & ¬
	{formatting:"filler"} & ¬
	{text_dark:"-t -mc=#383838 -tc=#E0E0E0"} & ¬
	{text_dark_drop:"-t -d -mc=#383838 -tc=#E0E0E0"} & ¬
	{text_dark_pic:"-t -p -mc=#383838 -tc=#E0E0E0"} & ¬
	{text_dark_drop_pic:"-t -d -p -mc=#383838 -tc=#E0E0E0"} & ¬
	{formatting:"filler"}
```

Carefully follow the instructions above the `styleDroplets` style list inside both the StyleDroplet and CreateStyleDroplets scripts. Use the instructions above to create droplets for individual styles for all the styles including your own custom styles. Custom style droplets should produce the same behavior as the included styles.

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
