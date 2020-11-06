import argparse


def parze():
    parser = argparse.ArgumentParser()
    parser.add_argument("-f", "--files", help = "comma separated list of files to compare")
    args = parser.parse_args()
    return args


def combine_files(files):
    fl = files.split(',')
    fl = [fi.strip() for fi in fl]
    results = {}
    for fil in fl:
        with open(fil, "r") as f:
            txt = f.read()
            txt = txt.strip().lstrip('[').rstrip(']')
            lines = txt.split(',')
            for ind, line in enumerate(lines):
                try:
                    results[f"line-{ind}"].append(line.strip())
                except KeyError:
                    results[f"line-{ind}"] = [line.strip()]
    return results


def compare_files(combined_results):
    diffs = []
    for key in combined_results.keys():
        for ind, line in enumerate(combined_results[key]):
            if ind == 0:
                first_line = line
            if line != first_line:
                diffs.append({"line": key, 'first_line': first_line, 'diff_line': line})
    print(f"The lines that are different are:\n{diffs}")


def main():
    args = parze()
    compare_files(combine_files(args.files))


main()
