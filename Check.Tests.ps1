# Checks your answers in answers.txt, one test per question.
# Run it from this folder with: Invoke-Pester
# You don't need to change this file.

BeforeAll {
    $script:answers = @{}
    foreach ($line in Get-Content (Join-Path $PSScriptRoot 'answers.txt')) {
        if ($line -match '^\s*(\d+)\)\s*(.*)$') {
            $script:answers[[int]$Matches[1]] = $Matches[2].Trim()
        }
    }

    # An answer in quotes reads the same as one without them.
    $script:plain = @{}
    foreach ($number in $script:answers.Keys) {
        $script:plain[$number] = $script:answers[$number].Trim("'", '"', '`').Trim()
    }

    # Several spaces read the same as one.
    function ConvertTo-OneSpace([string] $text) {
        ($text -replace '\s+', ' ').Trim()
    }
}

Describe 'Exercise: Guess the Command at Maple Street Bikes' {

    It '1) the command that lists the running programs' {
        $plain[1] | Should -Not -BeNullOrEmpty -Because 'question 1 has no answer yet. What do you want to do (a verb), and to what (a noun)?'
        $plain[1] | Should -Be 'Get-Process' -Because 'you want to get the processes, and the noun is singular'
    }

    It '2) the command that shows the clipboard' {
        $plain[2] | Should -Not -BeNullOrEmpty -Because 'question 2 has no answer yet. Guess it, then check your guess with Get-Command'
        $plain[2] | Should -Be 'Get-Clipboard' -Because 'you want to get the clipboard: Get-Command *Clipboard* shows the two commands for it'
    }

    It '3) the full name of gsv' {
        $plain[3] | Should -Not -BeNullOrEmpty -Because 'question 3 has no answer yet. Get-Alias gsv shows what it runs'
        $plain[3] | Should -Be 'Get-Service' -Because 'Get-Alias gsv shows the full name after the arrow'
    }

    It '4) the command that would stop a running program' {
        $plain[4] | Should -Not -BeNullOrEmpty -Because 'question 4 has no answer yet. Get-Command -Noun Process lists every command for processes. Find it; don''t run it'
        $plain[4] | Should -Be 'Stop-Process' -Because 'the verb that ends something is Stop, and a running program is a process'
    }

    It '5) how many commands have the noun Service' {
        $plain[5] | Should -Not -BeNullOrEmpty -Because 'question 5 has no answer yet. Get-Command -Noun Service lists them; count the rows'
        $expected = [string] @(Get-Command -Noun Service).Count
        $plain[5] | Should -Be $expected -Because 'Get-Command -Noun Service lists one row for each command, and that is the number on your computer'
    }

    It '6) the module Get-Clipboard comes from' {
        $plain[6] | Should -Not -BeNullOrEmpty -Because 'question 6 has no answer yet. Get-Command Get-Clipboard shows it in the Source column'
        $expected = (Get-Command Get-Clipboard).Source
        $plain[6] | Should -Be $expected -Because 'the Source column names the module, the package of commands it comes from'
    }

    It '7) the Get-Help parameter that shows only the examples' {
        $plain[7] | Should -Not -BeNullOrEmpty -Because 'question 7 has no answer yet. Type Get-Help Get-Service - and press Ctrl+Space to see Get-Help''s parameters'
        $plain[7].TrimStart('-') | Should -Be 'Examples' -Because 'the parameter is named after what it shows'
    }

    It '8) the whole command for the Windows Audio service' {
        $answers[8] | Should -Not -BeNullOrEmpty -Because 'question 8 has no answer yet. Write the command, the parameter and its value, then try it at the prompt'
        $answer = ConvertTo-OneSpace $answers[8]
        $answer | Should -Match '^Get-Service -Name ' -Because 'it starts with the command, then the parameter name written out: Get-Service -Name'
        $answer | Should -Match '^Get-Service -Name ([''"]?)Audiosrv\1$' -Because 'the value after -Name is the service''s short name, Audiosrv'
    }
}
