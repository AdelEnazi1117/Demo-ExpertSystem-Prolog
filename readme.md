# Report: Expert System for Computer Troubleshooting

**Authors:** Adel Enazi - Salman Alfaify.

**Student ID:** 441008911 - 441003788.

**Course:** Ai.

**Date:** NOV 2025.

---

## 1. Introduction

### Problem Description

When a computer has problems, most people don't know what's wrong or how to fix it. Common issues include:

- **Computer won't start** - Is it the power supply? The motherboard? Something else?
- **Blue screen errors** - What do the error codes mean?
- **Slow performance** - Is it overheating? Not enough RAM? A virus?
- **Hard drive problems** - How do you know if the hard drive is failing?

Diagnosing computer problems requires technical knowledge that most people don't have. Without help, people might:

- Try the wrong solutions and waste time
- Spend money on unnecessary repairs
- Give up and buy a new computer when a simple fix would work

### Necessity of Developing an Expert System

An expert system solves this problem by:

- **Storing expert knowledge**: The system contains knowledge from computer technicians about what symptoms mean and how to fix them
- **Always available**: Works 24/7, no need to wait for a technician
- **Consistent answers**: Always gives the same diagnosis for the same symptoms
- **Easy to use**: Just describe your symptoms, and the system tells you what's wrong and how to fix it
- **Cost-effective**: Helps you fix problems yourself or know when you need professional help

This expert system demonstrates how we can use computer programs to make technical knowledge accessible to everyone.

---

## 2. Knowledge Sources

The facts and rules in this expert system come from:

1. **Common Computer Problems**: Based on the most frequent issues people experience
2. **Error Code Meanings**: Standard Windows error codes (like BSOD codes) and their meanings
3. **Troubleshooting Guides**: Information from computer repair manuals and online guides
4. **Technical Support Knowledge**: Common solutions from computer manufacturers and IT support

All this knowledge has been organized into simple rules that the computer can use to diagnose problems.

---

## 3. Facts

Facts are the basic information the system knows. They are organized into groups:

### 3.1 Symptom Facts

These are the problems users can report:

```prolog
symptom(wont_start).
symptom(no_power).
symptom(blue_screen).
symptom(slow_performance).
symptom(overheating).
```

**Description**: These represent the 5 main symptoms users might experience. When a user reports a symptom, the system can use it to diagnose the problem.

### 3.2 Error Message Facts

These are specific error codes that provide diagnostic information:

```prolog
error_message(bsod_0x00000050).
error_message(boot_device_not_found).
```

**Description**: Error messages give specific clues about what's wrong. For example, `bsod_0x00000050` is a Blue Screen of Death code that often indicates RAM problems.

---

## 4. Rules

Rules are the logic that connects symptoms to problems and problems to solutions.

### 4.1 Diagnosis Rules

These rules determine what problem you have based on your symptoms:

#### Rule 1: Power Supply Failure

```prolog
diagnose(power_supply_failure) :-
    symptom(no_power),
    symptom(wont_start).
```

**Meaning**: If you have no power AND the computer won't start, the problem is likely a power supply failure.

#### Rule 2: RAM Failure

```prolog
diagnose(ram_failure) :-
    symptom(blue_screen),
    error_message(bsod_0x00000050).
```

**Meaning**: If you see a blue screen with error code 0x00000050, the problem is likely RAM failure.

#### Rule 3: Hard Drive Failure

```prolog
diagnose(hard_drive_failure) :-
    symptom(wont_start),
    error_message(boot_device_not_found).
```

**Meaning**: If the computer won't start and shows "boot device not found", the hard drive is likely failing.

#### Rule 4: CPU Overheating

```prolog
diagnose(cpu_overheating) :-
    symptom(overheating),
    symptom(slow_performance).
```

**Meaning**: If the computer is overheating AND running slowly, the CPU is likely overheating.

### 4.2 Solution Rules

These rules provide the solution for each problem:

```prolog
provide_solution(replace_power_supply, power_supply_failure).
provide_solution(test_replace_ram, ram_failure).
provide_solution(replace_hard_drive, hard_drive_failure).
provide_solution(clean_cpu_heatsink, cpu_overheating).
```

**Description**: Each problem has a corresponding solution. For example, if RAM failure is diagnosed, the solution is to test and possibly replace the RAM.

### 4.3 User Interface Rule

This rule provides a simple way to get diagnosis and solution:

```prolog
diagnose_and_solve :-
    write('=== Computer Troubleshooting Expert System ==='), nl, nl,
    (diagnose(Problem) ->
        find_solution(Problem),
        write('---'), nl
    ;
        write('No problem diagnosed with current symptoms.'), nl
    ).
```

**Description**: This rule runs the diagnosis and displays both the problem and solution in a user-friendly format.

---

## How to Use the System

### Step 1: Load the System

```prolog
?- consult('expert_system.pl').
```

### Step 2: Report Your Symptoms

```prolog
?- assert(symptom(blue_screen)).
?- assert(error_message(bsod_0x00000050)).
```

### Step 3: Get Diagnosis and Solution

```prolog
?- diagnose_and_solve.
```

### Example Output:

```
=== Computer Troubleshooting Expert System ===

Problem: ram_failure
Solution: test_replace_ram
---
```

---

## Summary

This expert system demonstrates how we can use Prolog to create a simple but effective diagnostic tool. It shows:

- How to represent knowledge as facts
- How to create rules that make decisions
- How to provide solutions based on diagnosis
- How to make technical knowledge accessible to non-experts

The system demonstrates the core concepts of expert systems.
