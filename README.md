# Vowel Counter API

Count vowels and consonants in text.

## Endpoint

### GET `/count`

**Parameters:**
- `text` (required): Text to analyze

**Example Request:**
```
http://localhost:3012/count?text=hello
```

**Example Response:**
```json
{
  "text": "hello",
  "vowels": 2,
  "consonants": 3
}
```
