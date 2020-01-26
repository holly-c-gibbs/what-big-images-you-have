// from https://imagej.net/BigStitcher_Headless
// stitches together tiles from a single .czi tiled acquisition
// example run from command line
// Applications/Fiji.app/Contents/MacOS/ImageJ-macosx --headless -macro
// Users/hollygibbs/Desktop/clearing-workshop/FIJI/stitching-example/czi-headless-stitching.ijm
// "/Users/hollygibbs/Desktop/clearing-workshop/FIJI/stitching-example/ thoracic-488-NUEN-2-tiles.czi"

// get dataset path, filename as commandline arguments
args = getArgument()
args = split(args, " ");

myPath = args[0]
//myPath = "/Users/hollygibbs/Desktop/clearing-workshop/FIJI/stitching-example/"
myFile = args[1]
//myFile = "thoracic-488-NUEN-2-tiles.czi"

// define dataset
run("Define dataset ...", "define_dataset=[Automatic Loader (Bioformats based)] project_filename=dataset.xml" +
" path=" + myPath + myFile + " exclude=10" +
" bioformats_series_are?=Tiles bioformats_channels_are?=Channels" +
" move_tiles_to_grid_(per_angle)?=[Do not move Tiles to Grid (use Metadata if available)]" +
" how_to_load_images=[Re-save as multiresolution HDF5] dataset_save_path=" + myPath +
" check_stack_sizes subsampling_factors=[{ {1,1,1}, {2,2,1}, {4,4,1}, {8,8,1}, {16,16,2}, {32,32,4} }]" +
" hdf5_chunk_sizes=[{ {32,32,4}, {32,32,4}, {16,16,16}, {16,16,16}, {16,16,16}, {16,16,16} }]" +
" timepoints_per_partition=1 setups_per_partition=0 use_deflate_compression" +
" export_path=" + myPath + "dataset");

// calculate pairwise shifts
run("Calculate pairwise shifts ...", "select=" + myPath + "dataset.xml process_angle=[All angles]" +
" process_channel=[All channels] process_illumination=[All illuminations]" +
" process_tile=[All tiles] process_timepoint=[All Timepoints] method=[Phase Correlation]" +
" downsample_in_x=4 downsample_in_y=4 downsample_in_z=1");

// filter shifts with 0.7 corr. threshold
run("Filter pairwise shifts ...", "select=" + myPath + "dataset.xml" +
" filter_by_link_quality min_r=0.7 max_r=1 max_shift_in_x=0 max_shift_in_y=0 max_shift_in_z=0" +
" max_displacement=0");

// do global optimization
run("Optimize globally and apply shifts ...", "select=" + myPath + "dataset.xml process_angle=[All angles]" +
" process_channel=[All channels] process_illumination=[All illuminations] process_tile=[All tiles]" +
" process_timepoint=[All Timepoints] relative=2.500 absolute=3.500" +
" global_optimization_strategy=[Two-Round using Metadata to align unconnected Tiles] fix_group_0-0");

// fuse and save images as zipped .tif stack
// run("Fuse dataset ...", "select=" + myPath + "dataset.xml process_angle=[All angles]" +
//" process_channel=[All channels] process_illumination=[All illuminations] process_tile=[All tiles]" +
//" process_timepoint=[All Timepoints] bounding_box=[Currently Selected Views] downsampling=1" +
//" pixel_type=[16-bit unsigned integer] interpolation=[Linear Interpolation]" +
//" image=Virtual interest_points_for_non_rigid=[-= Disable Non-Rigid =-] blend preserve_original" +
//" produce=[Each timepoint & channel] fused_image=[Save as (compressed) TIFF stacks]" +
//" output_file_directory=" + myPath + " filename_addition=fused lossless");

// quit headless FIJI
eval("script", "System.exit(0);");
