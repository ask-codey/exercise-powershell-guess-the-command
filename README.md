# Exercise: Guess the Command

Exercise code for the lesson **Exercise: Guess the Command** in PowerShell in Depth on [ask-codey.com](https://www.ask-codey.com).

The owner of Maple Street Bikes, a small bike shop, has left eight questions about the shop's laptop. Each one asks for a PowerShell command, or a fact about one. You'll guess each command from its verb and noun, then check your guess with `Get-Command`, `Get-Alias` and `Get-Help`, and write the answers in `answers.txt`. A Pester check tells you which answers are right.

Every command you run for this exercise only looks. Question 4 asks you to *find* a command that changes something: find it, and don't run it.

## What's here

- `answers.txt`: one line for each question, waiting for your answer. For you to finish.
- `Check.Tests.ps1`: the check that reads your answers. You don't need to change it.

## What to do

Open PowerShell 7 in this folder: in File Explorer, right-click the folder and choose **Open in Terminal**, or type `Set-Location` followed by the folder's path. Answer each question with the commands from the *Commands That Explain Themselves* chapter: guess a verb-noun name, then check it with `Get-Command` (exact names, `-Noun`, `-Verb` or a `*` wildcard), `Get-Alias` and `Get-Help`, and use Tab and Ctrl+Space to see a command's parameters. Write each answer after its number in `answers.txt`, on the same line, for example `1) Get-Date`.

1. The laptop is slow. Which command lists the programs that are running?
2. Which command shows the text that's on the clipboard right now?
3. A tutorial the owner found uses `gsv`. What's its full command name?
4. Which command would stop a running program? Find it; don't run it.
5. How many commands on your computer have the noun `Service`?
6. Which module does `Get-Clipboard` come from?
7. Which parameter of `Get-Help` shows only a command's examples?
8. Write the whole command that shows the Windows Audio service by its short name, `Audiosrv`, with the parameter's name written out.

## Check your work

The check needs Pester 5 or newer. Install it once, if you haven't already:

```powershell
Install-PSResource Pester
```

Then, from this folder:

```powershell
Invoke-Pester
```

At first every test fails: that is expected. Each answer you write turns its test green. A failing test's message says which question it is and where to look.

If PowerShell says the check *cannot be loaded because running scripts is disabled* or *is not digitally signed*, the folder came from a download that Windows marked as from the internet. Unblock its files once with `Get-ChildItem -Recurse | Unblock-File`, from this folder, and run `Invoke-Pester` again. *Why a Script Won't Run: The Execution Policy*, in Module 5, explains what that does.

## Tips

- Guess first: what do you want to do (the verb), and what do you want to do it to (the noun)? Then check the guess with `Get-Command`.
- `Get-Command` only looks commands up. It never runs them, so it's safe for question 4.
- For question 5, the answer is the number of rows on your own computer.
- For question 8, try your command at the prompt before you write it down. If it shows Windows Audio, it's right.

## Hand it in

When it works, push your solution to a public repo of your own on GitHub, then paste that repo's address into **Submit your exercise** on the lesson page at [ask-codey.com](https://www.ask-codey.com). That's what completes the lesson. The lesson page shows the Git commands, step by step.
