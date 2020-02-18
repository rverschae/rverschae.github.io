They contain the PV data and the corresponding image frames (there is one CSV file per video). See the file README_CSV.txt for a description of the format. 

Key points:
+ There is 1 sample per second (note that in some cases there is no PV data, and in other cases the image frame is not valid)
+ The second column indicates the PV power. A value equals to -1000 indicates that no PV data was captured.
+ The last column indicates if there is a valid image frame associated to the PV data (a zero means there is no valid image frame; also the image name should be invalid). 

*Also note that for this PV cell, the PV output jumps from zero to values larger than ~250 Watts*.

Format:
<TimeStamp (epoch)> <PV power (Watts), -1000 == NO data> <DATE> <Hours: 0-23> <10-minute (dizaine): 0-5> <frame index (within video): 0-600> <imgname.jpg> <JPG image exists = 1>

Where:
Frame name = <DATE><Hoursx10+dizaine>/frame-<Frame index>.jpeg

Examples of valid frame: 
1481278201 433.0 20161209 10 01 001 20161209-101/frame-001.jpeg 1

1481285051, 992.0, 20161209, 12, 0, 251, 20161209-120/frame-251.jpeg, 1

Example of invalid frame (NO frame associated to the PV data): 
1481285052, 995.5, 20161209, 12, 0, 000, 20161209-120/frame-.jpeg, 0
