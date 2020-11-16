from argparse import ArgumentParser
import os
import time

if __name__ == "__main__":
    parser = ArgumentParser(description='Create playlist from video folder')
    parser.add_argument('folder', type=str, help="Absolute path to video folder")
    args = vars(parser.parse_args())
    dirname = os.path.basename(args["folder"])
    playlist_file = open("playlist_{}_{}.mvs".format(dirname, int(time.time())), "a")
    for filename in sorted(os.listdir(args["folder"])):
        playlist_file.write("/tmp/videos/{}\n".format(filename))
        
    
    
    
    