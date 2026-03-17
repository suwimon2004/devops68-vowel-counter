const express = require('express');
const app = express();

app.get('/count', (req, res) => {
  const { text } = req.query;
  if (!text) return res.status(400).json({ error: 'Missing text parameter' });
  
  const vowels = (text.match(/[aeiouAEIOU]/g) || []).length;
  const consonants = (text.match(/[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/g) || []).length;
  
  res.json({ text, vowels, consonants });
});

app.listen(3012, () => console.log('Vowel Counter API on port 3012'));
