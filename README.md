# Tomb of the Assembly

Tomb of the Mask fan game written in the assembly language of the ICMC 16 bit
processor and played on the GTK simulator that ships with it. The original
game is by Happymagenta, the assembly version started as the 2021 practical
assignment of Gabriel Victor Cardoso Fernandes, Gabriel Alves Kuabara and
Lourenco de Salles Roselino, and this fork is the final project of Group 1 for
CS 003 Computer Architecture and Organization at the Technological Institute
of the Philippines, Quezon City.

## What this fork adds

- A main menu with NORMAL MODE, ENDLESS MODE and SETTINGS, navigated with the
  arrow keys or WASD and confirmed with Enter.
- Five hand built campaign levels with keys and doors, plates and gates,
  levers, bombs, shields, pushable crates and lethal traps.
- Endless mode with seeded procedural rooms. Six room templates are mirrored
  with a random bit, decorated with coins, shields and traps on pre-screened
  cells, and the trap count grows with the room depth.
- Exits are openings in the outer wall with a scrolling room transition, and
  endless rooms are entered through an aligned entrance gate that opens as
  the tomb steps in and shuts behind it.
- A quick restart on the grave key, an icon legend on H or Tab, an in game
  settings screen with dash speed presets, and a game over screen with the
  run totals.
- Level design fixes: the pressure gates guard the exits, deadly lanes were
  cleared, one way pockets were removed, and every coin can be collected.
- A patched simulator that forwards the arrow keys and Tab, and translated
  the remaining menu labels to English.

## How to build and run

The assembler and the simulator sources are part of this repository. The game
is `Simulador/tomb_of_mask.asm`, it compiles to `Simulador/tomb_of_mask.mif`,
and the simulator runs that file together with `Simulador/charmap.mif`.

Windows, using the prebuilt tools:

```
cd Simulador
Versao_05_2013\32_bits\Montador.exe tomb_of_mask.asm tomb_of_mask.mif
Versao_05_2013\simulador_fonte\simulador.exe tomb_of_mask.mif charmap.mif
```

If you change the simulator sources, rebuild `simulador.exe` in Dev-C++ with
`Versao_05_2013/simulador_fonte/Makefile.win`, which is already set up with
the needed include paths and optimization flags.

Linux:

```
cd NovaInstrucao/codigoCPU
gcc main.c parser.c montador.c structs.c -o montador -lm
./montador ../../Simulador/tomb_of_mask.asm ../../Simulador/tomb_of_mask.mif
cd ../../Simulador/Versao_05_2013/simulador_fonte
bash compila.sh
cd ../..
./Versao_05_2013/simulador_fonte/sim tomb_of_mask.mif charmap.mif
```

The Linux build needs the GTK 2 development packages, curses and pthreads.
The simulator reads the mif file once at launch, so close and reopen it after
recompiling the game. Keep both files in the same folder as above because the
simulator opens them by the names given on the command line.

Simulator shortcuts that stay untouched: Home switches to automatic mode,
End runs a single step, Insert resets the simulator. The game itself runs in
automatic mode.

## Controls

- WASD or the arrow keys dash in that direction and the tomb keeps sliding
  until a wall stops it.
- B uses one bomb to break the gray weak walls around the player.
- R or the grave key restarts the current level, in endless mode it restarts
  the current room and rolls the coins back to the room start.
- H or Tab opens the icon legend, M returns to the title screen, Enter starts
  the game and confirms menu choices.
- In the menu and settings, move with the arrow keys or WASD and press Enter
  to select.

## Modes

Normal mode plays the five hand built levels in order and ends with a win
screen after the fifth exit. Endless mode generates rooms forever, shows the
room number on the HUD, raises the trap count with depth, and ends the run
when the player touches a trap without a shield. Settings holds three dash
speed presets, slow, normal and fast, and the SOUND FX and GAME MUSIC rows
which are reserved for a future update because the processor model has no
audio output.

## Repository layout

- `Simulador/` the game source, the compiled mif, the character map and the
  simulator sources under `Versao_05_2013/`.
- `NovaInstrucao/` the new instruction deliverable and the assembler sources
  and a terminal model of the CPU.
- `Simulador/Versao_05_2013/Manual/` the original ICMC processor and
  simulator manuals.

The development helpers (a level solver, a headless CPU emulator that runs
74 scenario checks, the map fixer and the endless template builder) live in
the `tools` folder next to this repository.

## Quality checks

Every level and every generated room is checked by the solver before it is
committed: the exit must stay reachable, no reachable position may strand the
player, no trap may sit on a forced path, the pressure gates and key doors
must actually block the exit while locked, and every coin, key and shield
must be collectible, even with all the traps of a room placed at once. The
game logic itself is exercised by a headless emulator of the ICMC processor
that replays scripted keys and asserts the results.

## Credits

The original game Tomb of the Mask is by Happymagenta. The assembly version
was created by Gabriel Victor Cardoso Fernandes, Gabriel Alves Kuabara and
Lourenco de Salles Roselino for the Practical Assignment in Computer
Organization in August 2021, and it is published at
`gabrielvictorcf/tomb-of-the-assembly`. This fork grew out of
`tunafishyummy/tomb-of-the-assembly`, and the changes listed above were made
by Garcia, Lamio, Ramos, Rufino, Suyo and Timmalog for the CS 003 final
project.

Thank you @GKuabara for the original game and for keeping the assembly source
readable.
