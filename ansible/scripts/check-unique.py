import sys

if len(sys.argv[1:]) == len(set(sys.argv[1:])):
    print("NO DUPLICATES")
    sys.exit(0)
print("DUPLICATES")
sys.exit(1)