# Quick Start Guide

## What You Need

- SWI-Prolog installed on your computer
- The file `expert_system.pl` in your project folder

## How to Start

### Step 1: Open Terminal

Open Terminal on your Mac (or Command Prompt on Windows).

### Step 2: Go to Your Project Folder

Type this command (press Enter after each line):

```bash
cd /Users/AdelEnazi/Documents/CursorProjects/aiproject2025nov
```

### Step 3: Start Prolog

Type:

```bash
swipl
```

You should see something like:

```
Welcome to SWI-Prolog...
?-
```

The `?-` is the Prolog prompt - this is where you type commands.

## How to Use the Expert System

### Load the System

Type this at the `?-` prompt:

```prolog
consult('expert_system.pl').
```

Press Enter. You should see:

```
true.
```

### Report Your Symptoms

```prolog
?- assert(symptom(blue_screen)).
?- assert(error_message(bsod_0x00000050)).
```

### Step 3: Get Diagnosis and Solution

```prolog
?- diagnose_and_solve.
```

## Commands

### General Prolog Commands

**File Operations:**

- `consult('filename.pl').` or `['filename.pl'].` - Load a Prolog file
- `reconsult('expert_system.pl').` - Reload a file (same as consult)

**Database Operations:**

- `assert(Fact).` - Add a fact to the database
- `asserta(Fact).` - Add a fact at the beginning
- `assertz(Fact).` - Add a fact at the end
- `retract(Fact).` - Remove a specific fact
- `retractall(Pattern).` - Remove all facts matching pattern
- `abolish(Predicate/Arity).` - Remove all clauses of a predicate

### Our Project-Specific Commands

**Loading the System:**

- `consult('expert_system.pl').` - Load the expert system

**Adding Symptoms and Error Messages:**

- `assert(symptom(blue_screen)).` - Add symptom: blue_screen
- `assert(symptom(no_power)).` - Add symptom: no_power
- `assert(symptom(wont_start)).` - Add symptom: wont_start
- `assert(symptom(slow_performance)).` - Add symptom: slow_performance
- `assert(symptom(overheating)).` - Add symptom: overheating
- `assert(error_message(bsod_0x00000050)).` - Add error message: bsod_0x00000050
- `assert(error_message(boot_device_not_found)).` - Add error message: boot_device_not_found

**Clearing Symptoms and Error Messages:**

- `retractall(symptom(_)).` - Clear all symptoms
- `retractall(error_message(_)).` - Clear all error messages
- `retractall(symptom(_)), retractall(error_message(_)).` - Clear both

**Checking Facts:**

- `symptom(X).` - Check if X is a known symptom (lists all symptoms)
- `error_message(X).` - Check if X is a known error message (lists all)
- `symptom(blue_screen).` - Check if blue_screen is a symptom
- `error_message(bsod_0x00000050).` - Check if bsod_0x00000050 is an error message

**Diagnosis Commands:**

- `diagnose(Problem).` - Get a diagnosis (returns Problem variable)
- `diagnose(ram_failure).` - Check if ram_failure can be diagnosed
- `diagnose(X).` - Find all possible diagnoses
- `diagnose_and_solve.` - Get diagnosis and solution together (formatted output)

**Solution Commands:**

- `find_solution(Problem).` - Get solution for a specific problem
- `find_solution(ram_failure).` - Get solution for RAM failure
- `provide_solution(Solution, Problem).` - Check solution mapping
- `provide_solution(X, ram_failure).` - Find solution for RAM failure
- `provide_solution(test_replace_ram, Y).` - Find problem for a solution

**Complete Workflow Example:**

```prolog
% Load system
consult('expert_system.pl').

% Clear previous data
retractall(symptom(_)), retractall(error_message(_)).

% Add symptoms
assert(symptom(blue_screen)).
assert(error_message(bsod_0x00000050)).

% Get diagnosis
diagnose(Problem).

% Get solution
find_solution(ram_failure).

% Or get both at once
diagnose_and_solve.
```

## Troubleshooting

**Problem**: "File does not exist"

- **Solution**: Make sure you're in the right folder. Type `pwd` to check your current location.

**Problem**: "Unknown procedure"

- **Solution**: Make sure you loaded the file with `consult('expert_system.pl').`

**Problem**: "No problem diagnosed"

- **Solution**: Make sure you asserted the symptoms first using `assert(symptom(...)).`

## That's It!

The system is now ready to use. Just describe your symptoms, and it will tell you what's wrong and how to fix it!
