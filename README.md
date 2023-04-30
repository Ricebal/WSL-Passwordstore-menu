# WSL-passwordstore-menu
Small shell script to run menu that can select a password from your password store and copy it to the clipboard, clearing the clipboard after 45 seconds.
Expects your passwords to be stored in the default pass directory in the .gpg format and the password to be the first line in the file.
Accepts custom password directory with exported `PASSWORD_STORE_DIR` variable.

## Usage
To change the time before the clipboard clear edit the `sleep_seconds` variable or export `PASSWORD_STORE_CLIP_TIME` in your prefered shell .rc file.
To run the script call: `wt -p Ubuntu bash /path/to/passmenu.sh` where `Ubuntu` is your installed WSL distro.
You can run the script from an [AutoHotKey](https://www.autohotkey.com/) script if you're running bash like this:
```
<#+p::
{ 
    Run("wt -p Ubuntu bash /path/to/passmenu.sh")
    return
}
```
Or otherwise if you're running any other shell such as ZSH:
```
<#+p::
{ 
    Run('wt -p "Command Prompt" wsl ~/git/WSL-passwordstore-menu/passmenu.sh')
    return
}
```
Replacing <#+p with your desired keybind, this being super + shift + p.

## Requirements
- [pass](https://www.passwordstore.org/)
- [FZF](https://github.com/junegunn/fzf)
- [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) (maybe works on WSL1 but I haven't tested it)
- [Windows Terminal](https://learn.microsoft.com/en-us/windows/terminal/install)

## Credits
Inspired by and based on a script by [Gunmulka](https://github.com/gumulka) from this [article](https://gummu.de/wsl-passwords-en.html).
