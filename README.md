# Speed Typing Test 🚀 

## Description 📝
A terminal-based typing speed test application built with Python and Curses. Test your typing speed and accuracy with randomly selected text passages.

## Features ✨
- Real-time Words Per Minute (WPM) calculation 📊
- Color-coded text input (green for correct, red for incorrect) 🟢🔴
- Randomly selected text from a text file 🎲
- Escape key to exit at any time 🚪

## Prerequisites 🛠️
- Python 3.x
- Windows: `windows-curses` library
- Unix/Mac: Built-in Curses library

## Installation 💻
1. Install dependencies:
   ```
   pip install windows-curses
   ```

## Setup 🔧
1. Create a `text.txt` file in the same directory
2. Add multiple lines of text to type in the file

## Running the Program ▶️
```
python speed_typing_test.py
```

## How to Play 🎮
- Press any key to start
- Type the displayed text as quickly and accurately as possible
- WPM updates in real-time
- Complete the text or press ESC to exit

## Customization 🎨
- Edit `text.txt` to change typing passages
- Modify color pairs in `main()` function to change text colors

## Requirements 📋
- `curses` module
- `time` module
- `random` module
