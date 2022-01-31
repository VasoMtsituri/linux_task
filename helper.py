import argparse
from datetime import datetime


def save_2_file(data):
    """

    :param data: data we need to store into the file
    :return: creates .txt file with data in it as an append mode
    """
    with open('numbers.txt', 'a') as f:
        f.write(f'{data} {datetime.now()}\n')


def parse_args():
    """

    :return: parses python file arguments and returns it
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("--n_numbers", help="number of unique numbers to generate",
                        type=int)
    parser.add_argument("--mode", help="mode=1: print generated number, mode=2: save into the file",
                        type=int)
    args = parser.parse_args()

    return args