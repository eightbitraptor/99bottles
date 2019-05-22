Started off with shameless green. Copy pasted the first verse right into the method when making the test pass.

Future tests where made green by extracting the parts of the verse that change at that time, of which there's a clear progression as you go down the list of tests.

we have:

1. test the highest verse
2. change the number to another mid number from the series
3. test the case changes when going from 2 to 1
4. test the whole quantity part changes when going from 1 to 0
5. test that we can loop back round to 99, and that the action changes
6. test generating a couple of consecutive verses (it's a trap)
7. test generating more than two verses
8. test the whole song

So my appraoch was

1. hardcode the verse

2. remove the hardcoded number, recognise that we always need number and number
   - 1. Replace with expressions.

3. replace the interpolated variable with a method that switches on the number
   passed and returns a string representing the number of bottles. This expands
   on 1. to also take care of the pluralisation as part of the method.

4. realise that this change also works for zero - and I can just add another
   branch to my case statement to handle 0 ("no more bottles").

5. add a check for the bottle phrase method that checks if our number passed is
   below zero. If it is set it to 99. Hope there's not a requirement coming
   down the line to have either negative verses or two start counting up rather
   than down. Get frustrated that the test is still failing because the initial
   "no more bottles" needs to be in sentance case. Hope I'm not going to have
   to add another branch or make this method super complex. Remember that Ruby
   added "String#capitalize" in 2.4 and breath a sigh of relief that I can get
   away with it here despite it's slightly wonky behaviour

6. Write a method that wraps the `verse` method and maps over the numbers
   passed and generates the verse for them. It's a trap

7. Realise that the two numbers passed are the start and end verse, not a list
   of verses to generate. Refactor verses to be a `downto` loop.

8. implement the song method to wrap verses. realise it's a factory method and
   smile a little.

9. Refactor the case statements to be lookup tables using Hash#fetch, just
   because I think it's more elegant.


