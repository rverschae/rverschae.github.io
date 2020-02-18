# PV & Sky data
##############################
## Rodrigo Verschae
## Matsuyama Lab
## Kyoto University
## 2017/01/31
##############################
## (tested in OS X)

## Extract data:
################

1. Unzip file with videos (e.g 20161210-20170124T172146Z.zip)
Each video (MP4) contains 10 minutes of data (600 frames).

2. Extract JPG images from the MP4 videos(requires ffmpeg)
> sh extract.sh
You need to set the variable "videodate" in the script.
Each extracted image contains 4 frames, corresponding to 4 exposures times ({1, 8, 16, 24} × 11ms)
There is one JPG image per second.

3. Unzip the file capture_20161210.csv.gz
This file contains the timestamps of each exposure

4. The file PV.csv contains the PV data
The alignment of PV and Sky image data will be updated later.

## Lens Calibration
################

1. The lens was calibrated using OCamCalib. See https://sites.google.com/site/scarabotix/ocamcalib-toolbox.

2. The obtained calibration results can be found in "calib_results.txt" and the corresponding mat file in fisheyelens_calib-20170131T010836Z.zip. The images used for calibration are also included.

3. To load the parameters in Matlab, run the script "ocam_calib", then click "load". This will load the results from the file "Omni_Calib_Results.mat" (see OCamCalib for details).

## Color Calibration
#### TO DO


