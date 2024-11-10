
// Q1 – What type of state do you need to keep?
// The type of state which is to be keep in this case is the current index of the image being displayed. This means it is necessary to always know which image is currently being viewed and refresh it whenever the user flips through the gallery.

// Q2 – Look at the current widget tree: which widget will you warp into your stateful widget?
// In the Current setup, MyApp widget in it is entirely Stateful Widget, therefore you may retain it as the stateful widget handling the image gallery state.

// When it comes to the circular carousel, one of the ways to manage this is to incorporate the modulo operator % to deal with the changing of indexes cyclically. 
