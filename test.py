# -*- coding: utf-8 -*-

import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--foo", nargs='*')
    args = parser.parse_args()
    # args = parser.parse_known_args()
    print(args.foo)

if __name__ == "__main__":
    main()
