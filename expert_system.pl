% ============================================================================
% Expert System for Computer Troubleshooting
% Author: Adel Enazi
% Student ID: 441008911
% ============================================================================

:- dynamic symptom/1.
:- dynamic error_message/1.

% ============================================================================
% SECTION 1: SYMPTOM FACTS
% ============================================================================

symptom(wont_start).
symptom(no_power).
symptom(blue_screen).
symptom(slow_performance).
symptom(overheating).

% ============================================================================
% SECTION 2: ERROR MESSAGE FACTS
% ============================================================================

error_message(bsod_0x00000050).
error_message(boot_device_not_found).

% ============================================================================
% SECTION 3: DIAGNOSIS RULES
% ============================================================================

diagnose(power_supply_failure) :-
    symptom(no_power),
    symptom(wont_start).

diagnose(ram_failure) :-
    symptom(blue_screen),
    error_message(bsod_0x00000050).

diagnose(hard_drive_failure) :-
    symptom(wont_start),
    error_message(boot_device_not_found).

diagnose(cpu_overheating) :-
    symptom(overheating),
    symptom(slow_performance).

% ============================================================================
% SECTION 4: SOLUTION RULES
% ============================================================================

provide_solution(replace_power_supply, power_supply_failure).
provide_solution(test_replace_ram, ram_failure).
provide_solution(replace_hard_drive, hard_drive_failure).
provide_solution(clean_cpu_heatsink, cpu_overheating).

% ============================================================================
% SECTION 5: USER QUERY INTERFACE
% ============================================================================

find_solution(Problem) :-
    provide_solution(Solution, Problem),
    write('Problem: '), write(Problem), nl,
    write('Solution: '), write(Solution), nl.

diagnose_and_solve :-
    write('=== Computer Troubleshooting Expert System ==='), nl, nl,
    (diagnose(Problem) ->
        find_solution(Problem),
        write('---'), nl
    ;
        write('No problem diagnosed with current symptoms.'), nl
    ).
