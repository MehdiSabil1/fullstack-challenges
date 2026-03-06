## Before you start

For the Weather API challenge, you will need an API key to make calls to the OpenWeatherMap API. Sometimes Open Weather takes a little while to activate the key, particularly when a bunch of students make keys from the same location 🙀 To avoid this problem, **share your API key with your buddy** to limit the number of keys needed.

Let's request one now to avoid any delay later on! Make sure to write it down somewhere safe so you're ready for that challenge later 💪

Go to [OpenWeatherMap API](https://home.openweathermap.org/) and create an account to get your API key. You should find it [here](https://home.openweathermap.org/api_keys). 

## Background & Objectives

A quick challenge to warmup! Let's rehearse how to bind a DOM event to some action in JavaScript!

It's always the same 3-step process:

- **Select** the element you want to make interactive
- **Listen** to some event on the element
- Write the **callback** (the code that runs when the event occurs)

## Specs

As usual, open the html page in your browser on `localhost:8000` with:

```bash
serve
```

You should see a big green button saying `Click me!`. The goal of this challenge is to display an [`alert`](https://developer.mozilla.org/en-US/docs/Web/API/Window/alert) saying `Thank you!` when you click on it.

Open the `lib/index.js` and follow the pseudo-code!

There aren't any tests for this exercise, but we check your style! So run `rake`.
