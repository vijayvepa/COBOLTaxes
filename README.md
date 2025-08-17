# COBOL Tax Calculator

This project calculates taxes for a list of savings account balances using COBOL.

## Files
- `tax_calculator.cob`: COBOL source code for the tax calculator
- `balances.txt`: Input file with one savings account balance per line
- `taxes.txt`: Output file with balances and calculated taxes

## How to Run
1. Ensure you have a COBOL compiler (e.g., GnuCOBOL) installed.
2. Compile the program:
   
   ```sh
   cobc -x tax_calculator.cob
   ```
3. Place your input balances in `balances.txt`, one per line (e.g., `1000.00`).
4. Run the program:
   
   ```sh
   ./tax_calculator.exe
   ```
5. Check `taxes.txt` for the results.

## Example
**Input (`balances.txt`):**
```
1000.00
2500.50
500.75
12000.00
```

**Output (`taxes.txt`):**
```
1000.00      100.00
2500.50      250.05
500.75       50.08
12000.00     1200.00
```
