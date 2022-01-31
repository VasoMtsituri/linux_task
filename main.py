
from helper import save_2_file, parse_args
from randomer import RandomUniqueNumberGenerator

if __name__ == '__main__':
    args = parse_args()

    numbers = RandomUniqueNumberGenerator(args.n_numbers).get_random_numbers()

    if args.mode == 1:
        print(numbers)
    if args.mode == 2:
        save_2_file(numbers)
