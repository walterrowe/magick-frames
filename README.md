# Magick Frames

Magick Frames applies a decorative border and shadow around an image, and places logo or text below the image or places a logo inside the image at a specified edge. One of the significant features of Magick Frames is that it scales and positions your logo or text automatically based on your image dimensions, aspect ratio, and orientation. Square, vertical, and horizontal images all look as expected. The script has been tested on images as small as 300 pixels and as large as full size 45MP images with over 8000 pixels on the long edge.

Options for decorating the border of your image and applying text or a logo include:

- shadow around all the edges or a drop shadow bottom right
- add picture frame of 1-pixel black border + 10-pixels white border
- place a two-row text label or an image-based logo below the image
- place an image-based logo inside the image near a specified edge
- set a default logo watermark file and label text inside the script
- specify an alternate logo watermark file on the command line

# What Is Magick Frames

Magick Frames is a combination of a macOS/Linux shell script [frame_it](frame_it) and a macOS AppleScript [frame_it.applescript](frame_it.applescript) Droplet. The frame_it shell script uses the [ImageMagick](https://imagemagick.org/) image manipulation package to apply a professional looking decoration to a selection of image files.

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
- (macOS) Open [frame_it.applescript](frame_it.applescript), set `frame_it_options`, and save as a Droplet.

# Creating The AppleScript Droplet

1. Open frame_it.applescript script in macOS AppleScript Editor
1. Look for `frame_it_options` and set your desired options
1. Go to File > Export, choose type Application, and save a Droplet where you can run it

You can choose different `frame_it_options` and save the AppleScript as different names to make different styles available via macOS Droplet or for use in image editing software export configurations.

NOTE: These are the default `frame_it_options` distributed with the package.

- OVERWRITE the source files (`--overwrite` or `-o`)
- apply a thin picture frame (`--picture` or `-p`)
- center your logo BELOW the image (`--logo` or`-l`)

Look at the comments inside the frame_it AppleScript script to see where to change the options passed to the frame_it shell script. Look inside the frame_it shell script to see all of the available options. Some other example configurations are:

- set `frame_it_options` to `—o -l —p` and save as application frame\_it
    - `-o` overwrites the named source file
    - `-l` applies a logo below the image
    - `-p` adds a thin surrounding picture frame
- set `frame_it_options` to `—o —t —p` and save as application label\_it
    - `-o` overwrites the named source file
    - `-t` applies two-row text below the image
    - `-p` adds a thin surrounding picture frame
- set `frame_it_options` to `—o -p —g=southeast —w=~/Pictures/watermark_white.png` and save as application watermark\_it
    - `-o` overwrites the named source file
    - `-p` adds a thin surrounding picture frame
    - `-g` applies logo on image at this edge
    - `-w` specifies the logo to apply to the image

See the command line section below for a description of all the supported style options.

# How To Use

## In macOS Finder

The Droplet included with this package works like any other macOS application that lets you drag-n-drop items onto the application.

1. Use macOS Finder to select the images you want to decorate
2. Drag-n-drop the selected images onto your Droplet

The frame_it shell script options you specified in `frame_it_options` in the Droplet control how the images files you drop onto the Droplet are decorated.

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

-t | --text               specifies to use a two-line text logo underneath the image

-l | --logo               specifies to use an image file as a logo / watermark
                          this is the default style

-w=your_logo |            specifies the image file to use as the watermark logo that
--watermark=your_logo     that is placed on or below the image.

-g=placement |            places a logo watermark inside the image at the specified
--gravity=placement       edge location (gravity). The following are accepted values
                          for placement. Logos are inset from their nearest edge(es).

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

# Recommendation

Make test copies of output files and use the shell script from the command line to experiment with how different styling options look. This will help you determine which options you want to use in your Droplet(s).

# Origins

The frame_it shell script originates from Apple’s Recursive Image File Processing Droplet template. You can read more about it in the [Mac Automation Scripting Guide to Process Dropped Files and Folders](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ProcessDroppedFilesandFolders.html).

1. Open Apple ScriptEditor
2. Navigate to menu option File > New from Template > Droplets > Recursive Image File Processing Droplet

The frame_it AppleScript executes the `frame_it` shell script to decorate the selected image files.

The frame_it shell script uses the [ImageMagick](https://imagemagick.org/) image manipulation tool set with specific options to decorate your image files.
