(*
  Original: Walter Rowe in 2022

  2017: ported to latest Capture One and macOS version, modified border styling
  2022: copied to 'frame_it' and modified to use frame_it (script that uses the ImageMagick Suite vs sips)

  The application you create from this AppleScript can be used directly in Finder via drag-n-drop.
  Select a number of image files, and drag-n-drop them on the application. It will decorate the
  dropped files.

  WARNING: the default configuration below OVERWRITES the source files sent to it.

  Modifying The Frame Style:
  * Look below for the variable "frame_it_options" to change the command line options
  * Look in the frame_it shell script to see the options available styling your images
  * Remove the "-o" option to create NEW files with "-frame" inserted before extension.
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
property type_list : { "JPEG", "TIFF", "PNGf", "8BPS", "BMPf", "GIFf" }
property extension_list : { "jpg", "jpeg", "tif", "tiff", "png", "psd", "bmp", "gif" }
property typeIDs_list : { "public.jpeg", "public.tiff", "public.png", "com.adobe.photoshop-image", "com.microsoft.bmp", "com.compuserve.gif", "com.adobe.pdf", "com.apple.pict" }

(*
  -- FRAME_IT_OPTIONS: options for the frame_it script
  -- usage: frame_it [ OPTIONS ] image [ .. ]
  --
  -- OPTIONS:
  --
  -- -d | --dropshadow         specifies a drop shadow (offset bottom and right) vs
  --                           the default that centers the image in an all-edges shadow
  --
  -- -o | --overwrite          specifies to overwrite the original files vs the default
  --                           of keeping them and writing new files with "-frame" inserted
  --                           before the suffix
  --
  -- -p | --picture            add a 1-pixel black inner border + 10-pixel white outer border
  --
  -- -f=font |                 specify the font to use for the two-row label text logo
  -- --font=font
  --
  -- -t | --text               specifies to use a two-line text logo underneath the image
  --
  -- -ot | --overlaytext       specifies to use a two-line text logo inside the image
  --
  -- -tc=color |               specifies the color of the two-line text logo
  -- --textcolor=color         default #383838 below image, #E0E0E0 inside image
  --
  -- -l | --logo               specifies to place an image-based logo underneath the image
  --                           DEFAULT style when no options are specified
  --
  -- -ol | --overlaylogo       specifies to place an image-based logo inside the image
  --
  -- -mc=color |               specifies the color of the matte background (default white)
  -- --mattecolor=color
  --
  -- -w=your_logo |            specifies the image-based logo to use as the watermark that
  -- --watermark=your_logo     that is placed below or inside the image.
  --
  -- -g=placement |            specifies which inside edge or corner of the image the logo
  -- --gravity=placement       or text should be nearest. The following are accepted values.
  --                           The logo or text is inset from the specified edge or corner.
  --                           DEFAULT edge is south/bottom.
  --
  --                             +----------------------------------------------------+
  --                             | topleft               top                 topright |
  --                             |                                                    |
  --                             | left                 middle                  right |
  --                             |                                                    |
  --                             | bottomleft           bottom            bottomright |
  --                             +----------------------------------------------------+
  --
  --                             +----------------------------------------------------+
  --                             | northwest            north               northeast |
  --                             |                                                    |
  --                             | west                 center                   east |
  --                             |                                                    |
  --                             | southwest            south               southeast |
  --                             +----------------------------------------------------+
  --
*)

-- DEFAULT: -o (overwrite original files), -l (center logo below image), -p (add a thin picture frame)
property frame_it_options : "-o -l -p"

on open these_items
	repeat with this_item in these_items
		
		set item_info to info for this_item
		
		-- get the name of the current file we are processing
		try
			set this_filename to name of item_info
		on error
			set this_filename to ""
		end try
		
		-- get the extension of the current file we are processing
		try
			set this_extension to name extension of item_info
		on error
			set this_extension to ""
		end try
		
		-- get the type of the current file we are processing
		try
			set this_filetype to file type of item_info
		on error
			set this_filetype to ""
		end try
		
		-- get the type ID of the current file we are processing
		try
			set this_typeID to type identifier of item_info
		on error
			set this_typeID to ""
		end try
		
		-- only process if we support the image type
		if ((this_filetype is in type_list) or (this_extension is in extension_list) or (this_typeID is in typeIDs_list)) then
		
  		-- get the POSIX path of the current file we are processing
	  	set this_path to quoted form of POSIX path of this_item
				
		  -- build the frame_it command line
		  set frame_it to "eval $(/usr/libexec/path_helper -s); frame_it " & frame_it_options & " " & this_path

			-- run frame_it on the named file
			try
				do shell script frame_it
			on error errStr number errorNumber
				display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & this_filename
			end try
			
		end if
	end repeat
end open
