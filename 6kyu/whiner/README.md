Description:
------------

Write a function `solution:whiner/1`, describing a process, which will await `{awake}` message, 
and - after getting it - will start sending `Parent` process `{whine, "Is anybody out there?"}` 
message, every 1000ms. 
It should do so infinitely, or stop and exit alltogether, should it receive `{give_up}` message.

Be aware; she may be a whiner, but this function is damn diligent, so it shall read every message, 
even a malformed one!

Even when it's awake and busy sending messages to the `Parent` every 1000ms, 
it should still attend all the coming messages without delay.

# : FUNDAMENTALS 
# : ASYNCHRONOUS

