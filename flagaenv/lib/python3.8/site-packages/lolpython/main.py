from __future__ import print_function, division
import sys
import os
from math import sin, pi
import argparse

# import psutil
import re


def detect_windows_terminal():
    """
    Returns True if detects to be running in a powershell, False otherwise.
    """
    return sys.platform == 'win32' and os.environ.get('WT_SESSION', None) is not None

def supports_color():
    """
    Returns True if the running system's terminal supports color, and False
    otherwise.
    """
    plat = sys.platform
    supported_platform = (plat != 'Pocket PC' and ('ANSICON' in os.environ)) \
                        or (plat.lower() == 'linux' and os.environ.get('TERM', '').endswith('256color'))
    is_wnd_term = detect_windows_terminal()
    # isatty is not always implemented, #6223.
    is_a_tty = hasattr(sys.stdout, 'isatty') and sys.stdout.isatty()
    if (not supported_platform and is_wnd_term and is_a_tty):
        return True
    if not supported_platform or not is_a_tty:
        return False
    return True

def rainbow(freq, i):
    """Creates RGB values, inspired from https://github.com/busyloop/lolcat
    
    Args:
        freq (int): Frequency, more the value; more the colours
        i (int): Current character position, used to set colours at character level
    
    Returns:
        tuple: Contains integers R, G, B
    """
    red = sin(freq * i + 0) * 127 + 128
    green = sin(freq * i + 2*pi/3) * 127 + 128
    blue = sin(freq * i + 4*pi/3) * 127 + 128
    # return "%0x"%(int(red)), "%0x"%(int(green)), "%0x"%(int(blue))
    return int(red), int(green), int(blue)

def print_rainbow_text(text, freq=220, end="\n"):
    """Prints rainbow text if terminal support for colour text is detected, 
       else falls back to default terminal settings.
    
    Args:
        text (str/list(str)): String or list of str. Provide list to make the whole
                              paragraph look consistent
        freq (int, optional): Frequency determines rate of colour change. It's a sine wave so 
                              changing values on extremes might not help. Sweet spot is 220,
                              stick to it.
        end (str, optional): Similar to `end` param in print function
    """
    if not supports_color():
        # print to stderr so doesn't mess with IO redirections.
        sys.stderr.write("No support for colour on this terminal. Try bash/cygwin." + os.linesep)        
        if type(text) == list:
            print("".join(text), end=end)
        else:
            print(text, end=end)
        return
    for i,c in enumerate(text):
        if type(text) != list:
            r,g,b = rainbow(freq, i)
            color2 = "\033[38;2;%d;%d;%dm"%(r,g,b)
            print(color2+c+"\033[0m", end="")
        else:
            for j, cagain in enumerate(c):
                # this formula helps colours spread on whole paragraph. 
                r,g,b = rainbow(freq, i*10 + j)
                color2 = "\033[38;2;%d;%d;%dm"%(r,g,b)
                print(color2+cagain+"\033[0m", end="")
    print(end=end)
 
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--inp-file", help="Input file to read and display. If not provided, reads from stdin", default=None)
    parser.add_argument("--freq", help="Frequency used to affect the rate of colour change.", type=int, default=220)    
    args = parser.parse_args()
    freq = args.freq # 220 best
    if args.inp_file == None:
        text = sys.stdin
    else:        
        text = open(args.inp_file, "r") 
    # colourtxt = "\x1b[{}m{}\x1b[0m".format(str(colour), txt)
    print_rainbow_text(text.readlines(), freq=args.freq)
    try:
        text.close()
    except Exception:
        pass
    print()

if __name__ == "__main__":
    main()