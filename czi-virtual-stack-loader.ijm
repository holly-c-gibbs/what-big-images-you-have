#@ File (label="What file do you want to import?") myFile
run("Bio-Formats Importer", "open=" + myFile + " color_mode=Composite group_files open_all_series display_metadata" +
"display_ome-xml display_rois rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack contains=[]" +
"name=" + myFile);
run("Tile");