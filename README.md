# Sales receipts

## Problem Statement
This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets

## Requirements

* Sales tax is applicable at a rate of 10%
* Sales tax 0% on books, food, and medical.
* Import Fee 5% on all goods.
* Output per item should include prices with tax and fee
* Output tax row should only include tax amounts added.
* Total should include the sum on all items with taxes.

## Expected Output Example
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```


### NOTE
In the example shown on the problem description where it says "Output 3", the lines:
```
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
```

do not match the logic of sale tax and import tax, according to the item (chocolate) is food, so no sale tax applies, but as is imported, 5% applies, each item is 11.25, so import fee is 0.5625, all 3 items add up to 3 * (11.25 + 0.5625) = 35.4375, rounded up to 35.44 no idea how it got to 35.55, considering this, the sales taxes won't add up to 7.9 but 6.65.


## Project running

To run this project, you must use a command line, see the example below for command line parameters

`ruby main.rb spec/fixtures/input3.txt`

OR

`ruby main.rb spec/fixtures/input3.txt debug` for debug output

OR

`ruby main.rb spec/fixtures/input1.txt`

OR

`ruby main.rb spec/fixtures/input2.txt`

the debug option can be used on all, as a second parameter AFTER the file name
