import curses
from curses import wrapper
import time
import random


def start_screen(scr):
	scr.clear()
	scr.addstr("Welcome to the Speed Typing Test!")
    scr.addstr("Know your WPM and challenge your friends!")
    scr.addstr("\nPress any key to begin!")
	scr.refresh()
	scr.getkey()

def display_text(scr, target, current, wpm=0):
scr.addstr(target)
scr.addstr(1, 0, f"WPM: {wpm}")

	for i, char in enumerate(current):
		correct_char = target[i]
		color = curses.color_pair(1)
		if char != correct_char:
			color = curses.color_pair(2)

		scr.addstr(0, i, char, color)

def load_text():
	with open("text.txt", "r") as f:
		lines = f.readlines()
		return random.choice(lines).strip()

def wpm_test(scr):
	target_text = load_text()
	current_text = []
	wpm = 0
	start_time = time.time()
	scr.nodelay(True)

	while True:
		time_elapsed = max(time.time() - start_time, 1)
		wpm = round((len(current_text) / (time_elapsed / 60)) / 5)

		scr.clear()
		display_text(scr, target_text, current_text, wpm)
		scr.refresh()

		if "".join(current_text) == target_text:
			scr.nodelay(False)
			break

		try:
			key = scr.getkey()
		except:
			continue

		if ord(key) == 27:
			break

		if key in ("KEY_BACKSPACE", '\b', "\x7f"):
			if len(current_text) > 0:
				current_text.pop()
		elif len(current_text) < len(target_text):
			current_text.append(key)


def main(scr):
	curses.init_pair(1, curses.COLOR_GREEN, curses.COLOR_BLACK)
	curses.init_pair(2, curses.COLOR_RED, curses.COLOR_BLACK)
	curses.init_pair(3, curses.COLOR_WHITE, curses.COLOR_BLACK)

	start_screen(scr)
	while True:
		wpm_test(scr)
		scr.addstr(2, 0, "You completed the text! Press any key to continue...")
		key = scr.getkey()
		
		if ord(key) == 27:
			break

wrapper(main)