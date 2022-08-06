# Word game api

Simple API created to serve my [Countdown Rails App](https://github.com/tsunghotang/countdown-word-game).

The API is hosted on heroku so initial load may take some time.

## Endpoints
The API has two endpoints:

* Query -
`https://countdown-word-game-api.herokuapp.com/:word`

* Solve - `https://countdown-word-game-api.herokuapp.com/solve/:letters`

### Query endpoint
`https://countdown-word-game-api.herokuapp.com/:word`

The query endpoint can be used to check if a word is valid. It works by matching `:word` with this [word list](#word-list)

#### Example
```
https://countdown-word-game-api.herokuapp.com/hello

returns:
{ valid: true, word: word, length: word.length }
```
```
https://countdown-word-game-api.herokuapp.com/zzzz

returns:
{"valid":false,"word":"zzzz","error":"word not found"}
```

### Solve endpoint
`https://countdown-word-game-api.herokuapp.com/:solve/`

The Solve endpoint is used to solve anagrams.

The api takes in a set of letters and returns words that can be made from the letters.

By default the API returns the best possible words that can be made from the letters passed in.

#### Example
```
https://countdown-word-game-api.herokuapp.com/solve/EAUPTDMAD

<!-- returns -->

[{"word":"updated","length":7,"conumdrum":false},{"word":"adapted","length":7,"conumdrum":false}]
```

Passing the `varaiance` param will change the number of results returned. It represents the variance in the lenth of the possible solutions.

e.g. if the best solution has 7 characters and we have a variance of 2, the array will also include solutions of 5 and 6 characters. A variance of -1 will include all possible solutions. 0 will return only the best solutions.
```
https://countdown-word-game-api.herokuapp.com/solve/EAUPTDMAD?variance=1

<!-- returns -->

[
  {"word":"updated","length":7,"conumdrum":false},
  {"word":"temadau","length":7,"conumdrum":false},
  {"word":"adapted","length":7,"conumdrum":false},
  {"word":"update","length":6,"conumdrum":false},
  {"word":"tamped","length":6,"conumdrum":false},
  {"word":"tadema","length":6,"conumdrum":false},
  {"word":"pedata","length":6,"conumdrum":false},
  {"word":"maddeu","length":6,"conumdrum":false},
  {"word":"dumped","length":6,"conumdrum":false},
  {"word":"dauted","length":6,"conumdrum":false},
  {"word":"daudet","length":6,"conumdrum":false},
  {"word":"damped","length":6,"conumdrum":false},
  {"word":"amated","length":6,"conumdrum":false},
  {"word":"adempt","length":6,"conumdrum":false}
]
```

## Word List
The API uses the word list shared by dwyl found [here](https://github.com/dwyl/english-words)
