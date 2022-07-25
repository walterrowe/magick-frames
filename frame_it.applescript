(*
  Original: Walter Rowe in 2022

  2017: ported to latest Capture One and macOS version, modified border styling
  2022: copied to 'frame_it' and modified to use frame_it (script that uses the ImageMagick Suite vs sips)

  The application you create from this AppleScript can be used directly in Finder via drag-n-drop.
  Select a number of image files, and drag-n-drop them on the application. It will decorate the
  dropped files.

  WARNING: the default configuration below OVERWRITES the source files sent to it.

  Modifying The Frame Style:
  * Look for the variable "frame_it_options" to change the command line options
  * Look in the frame_it shell script to see the options available styling your images
  * Remove the "--no-keep" option to create NEW files with "-frame" inserted before extension.
    * example: my_image.jpg -> my_image-frame.jpg

  You can set different options and export this as different applications. I have three
  different exported versions of this. One creates a text-based label, one creates a logo
  based label, and another applies a watermark ON the image itself.

  Package Requirements:
  * The frame_it shell script only supports macOS and Linux
  * The frame_it AppleScript only supports macOS
  * Install ImageMagick using Home Brew or Linux package manager
  * Copy the frame_it shell script into your /usr/local/bin directory
  * Edit the frame_it shell script and set the value for "logo" to your logo file
  * Edit the frame_it shell script and set the value for "label1" and "label2"

  Droplet App Installation:
  * Open this in AppleScript Editor and File > Export as an Application
  * OPTION: Add the application to the Open With field of a Capture One Export Recipe

  To see the origins of this script
  1) open Script Editor
  2) File > New from Template > Droplets > Recursive Image File Processing Droplet

  https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/ProcessDroppedFilesandFolders.html
*)

(* TO FILTER FOR IMAGE FILES, LOOK FOR QUICKTIME SUPPORTED IMAGE FORMATS *)
property type_list : {"JPEG", "TIFF", "PNGf", "8BPS", "BMPf", "GIFf", "PDF ", "PICT"}
property extension_list : {"jpg", "jpeg", "tif", "tiff", "png", "psd", "bmp", "gif", "jp2", "pdf", "pict", "pct", "sgi", "tga"}
property typeIDs_list : {"public.jpeg", "public.tiff", "public.png", "com.adobe.photoshop-image", "com.microsoft.bmp", "com.compuserve.gif", "public.jpeg-2000", "com.adobe.pdf", "com.apple.pict", "com.sgi.sgi-image", "com.truevision.tga-image"}

(*
  FRAME_IT_OPTIONS: options for the frame_it script

  examples:
  property frame_it_options : "-o -t"            (* overwrite source file, place text-based labels BELOW the image *)
  property frame_it_options : "-o -g=bottom"    (* overwrite source, place image-based logo bottom center ON image *)
  property frame_it_options : "-l"              (* don't overwrite source, place image-based logo BELOW the image *)

  default: -o (overwrite original files), -l (center logo below image), -picture (add a thin picture frame)
*)
property frame_it_options : "-o -l -p"

on open these_items
  repeat with this_item in these_items

    set item_info to info for this_item

    (* get the name of the current file we are processing *)
    try
      set this_filename to name of item_info
    on error
      set this_filename to ""
    end try

    (* get the extension of the current file we are processing *)
    try
      set this_extension to name extension of item_info
    on error
      set this_extension to ""
    end try

    (* get the type of the current file we are processing *)
    try
      set this_filetype to file type of item_info
    on error
      set this_filetype to ""
    end try

    (* get the type ID of the current file we are processing *)
    try
      set this_typeID to type identifier of item_info
    on error
      set this_typeID to ""
    end try

    (* get the POSIX path of the current file we are processing *)
    set this_path to quoted form of POSIX path of this_item


    (* build the frame.sh command line *)
    set frame_it to "eval $(/usr/libexec/path_helper -s); frame_it " & frame_it_options & " " & this_path

    (* only process if we support the image type *)
    if ((this_filetype is in type_list) or (this_extension is in extension_list) or (this_typeID is in typeIDs_list)) then
      try
        (* run frame.sh on the named file  *)
        do shell script frame_it

      on error errStr number errorNumber
        display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & this_filename
      end try

    end if
  end repeat
end open
