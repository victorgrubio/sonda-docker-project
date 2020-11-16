from argparse import ArgumentParser
import time
import pandas as pd

def process_historic_csv(modes):
    # Load dataframes
    dict_dataframes_modes = {}
    result_df = pd.DataFrame()
    for mode in modes: 
        dict_dataframes_modes[mode] = pd.read_csv('{}.csv'.format(mode))
    
    for key, df in dict_dataframes_modes.items():
        mos_mean_mode = df.groupby("program_name")["mos"].mean()
        result_df["{}_mos".format(key)] = mos_mean_mode
    
    result_df.to_csv("processed_historic_csv_{}.csv".format(int(time.time())),
              index=True, header=True)



if __name__ == "__main__":
    parser = ArgumentParser(description='Process historic results')
    parser.add_argument('--modes', type=str, nargs='*', help="Modes to process")
    args = vars(parser.parse_args())
    process_historic_csv(args["modes"])
        
    
    
    
    