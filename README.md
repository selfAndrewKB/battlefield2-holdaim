# Hold-to-aim (hold button to ADS) controls in Battlefield 2

**Author:** Andrew Bryant (a.k.a SelfAndrewKB)

[Battlefield 2](https://en.wikipedia.org/wiki/Battlefield_2) only has toggle-to-aim controls, which many people find clumsy. This Autohotkey script adds industry-standard hold-to-aim controls to the game HOPEFULLY without interrupting the other functions that the Aim button also performs in the game. 

The script does this by differentiating between taps and holds, so you can still tap the Right Mouse to do the game's original things, and then hold to aim whenever you like. This also means that you have a choice between toggle-to-aim **and** hold-to-aim. Choosing between them is entirely contextual based on how long you hold the button down (adjustable), it feels very natural.

This is the result of crawling through AutoHotkey's documentation, gradually learning whatever needed over the course of a day, to repurpose a script originally made for another game. Might not be the most refined, but works well.



## Usage

Download the newest release from [the Releases section](https://github.com/selfAndrewKB/battlefield2-holdaim/releases/). You can put the files anywhere you like.

Run `BF2_Hold-to-Aim.exe` (either before or after running Battlefield 2 seems to be fine) and you should find its icon in your system tray. **The script works with the default binding of Right Mouse to Aim/Alt Fire.**

_Fair warning:_ Scanning the executable with [VirusTotal](https://www.virustotal.com) raises warnings in 4 out of 66 anti-virus engines. These are, IMO, false positives caused by the file being new. 

If you prefer to run an uncompiled script (and even alter it yourself in case your keybinds are different), then you can install [Autohotkey](https://www.autohotkey.com/) and run `BF2_Hold-to-Aim.ahk`.



## Note about potential issues

While I've managed to fine-tune this script and get it working pretty smoothly for the most part, it is still ultimately simulating true "hold to aim down sights" via clever use of inhumanly fast virtual mouse clicks.
Therefore, it is prone to occasionally becoming "confused" about whether you want to raise your sights or lower them. Two predictable scenarios are: 
1) Panicked, rapid mashing of both mouse buttons.
2) Holding down the right mouse button while reloading.

In the 2nd case, BF2 ignores input from the Aim key during a weapon reload. So if you are holding the Aim key upon finishing the reload animation, the script will trigger ADS once you release the key (instead of lowering your sights which is what you'd normally want).

In either case, and other similar situations, a quick tap of the mouse key should quickly get everything back on track. 

When it comes to vehicles, one discovered quirk is losing the fully automatic fire of a tank's turret. Two options are to rebind the function to a new key in the game's options menu, or to suspend the script by pressing the "0" key (assigned key can be easily changed in the 'BF2_Hold-to-Aim.ahk' file and recompiled back into an .exe file). Jets and Helicopters seems to be fine.


## Acknowledgements

- Huge and special thanks to Desi Quintans, [whose script for EYE Divine Cybermancy](https://github.com/DesiQuintans/eye-holdaim) I used as a foundation and inspiration for my BF2 version.

- The BF2 icon for the compiled executable comes from the BF2 executable itself.