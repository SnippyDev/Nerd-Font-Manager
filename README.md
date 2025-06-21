# Nerd Font Manager  
*Nerd Font Manager is a simple shell script that helps you install and remove Nerd Fonts easily.*

---

## ✅ How to Install

### 🧩 Step 1: Download the script
Run this command in your terminal:
```bash
wget https://raw.githubusercontent.com/SnippyDev/Nerd-Font-Manager/refs/heads/main/nerdfontmanager.sh
```
**What it does:**  
This command downloads the script file `nerdfontmanager.sh` from GitHub to your current folder.

---

### 🔓 Step 2: Make it executable
Before you can run the script, you need to give it permission to run:
```bash
chmod +x ./nerdfontmanager.sh
```
**What it does:**  
This command marks the file as “executable,” meaning you can now run it like a program.

---

### ▶️ Step 3: Run the script
Now you can run the script like this:
```bash
./nerdfontmanager.sh
```

---

## 🌍 (Optional) Make it work from anywhere

If you want to be able to run `nerdfontmanager` from any folder, you need to move it to a special folder that’s always in your terminal’s search path.

### 📦 Option 1: Make it global (for all users)
```bash
sudo mv ./nerdfontmanager.sh /bin/nerdfontmanager
```
**What it does:**  
Moves the script into `/bin`, which is a system folder for programs. Now **any user** can run it by typing `nerdfontmanager`.

---

### 👤 Option 2: Make it local (just for your user)

#### 1. Create a local bin folder if it doesn't exist:
```bash
mkdir -p ~/.local/bin
```
**What it does:**  
Makes a `bin` folder inside your home directory. This is your personal place to keep scripts.

#### 2. Move the script into it:
```bash
mv ./nerdfontmanager.sh ~/.local/bin/nerdfontmanager
```
**What it does:**  
Moves the script into your personal `bin` folder and renames it to `nerdfontmanager`.

#### 3. Make sure it's in your PATH  
To check if your system looks in `~/.local/bin`, run:
```bash
echo $PATH | grep -q "$HOME/.local/bin" && echo "✅ You're good!" || echo "⚠️ Not in PATH — add it to your shell config"
```

If not in your path, add this to the end of your `~/.bashrc` (or `~/.zshrc`, depending on your shell):
```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then reload:
```bash
source ~/.bashrc
```

---

You’re all set! Now you can type `nerdfontmanager` from anywhere and it will work.
