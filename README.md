# Spectrum_Games
This is a repo of ZX Spectrum games following Gary Plowman's `ZX Spectrum Games Code Club` book https://www.amazon.co.uk/ZX-Spectrum-Games-Code-Club/dp/0993474454.

IDE is KLive IDE: https://dotneteer.github.io/kliveide/

BASIC is Boriel Basic https://zxbasic.readthedocs.io/en/docs/

## Current games in the repo

- tic-tac-toe
- zx breakout
- snake
- flappy bird

Note the games don't always work well as the source code is a bit buggy in places and I have tried to fix it, plus I have made some typos too copying the code, which doesn't help. 

Also running speed varies so some games are ok, some are mega fast

## Integrating the basic compiler
To integrate zxbasic compiler (https://www.boriel.com/pages/the-zx-basic-compiler.html) to the emulator:

Run the following command in the IDE:
```bash
zxb-reset "<path to zxbasic directory>\zxbasic\zxbc.exe"
```