// server.js

import { Configuration, OpenAIApi } from "openai";

import express from 'express';
const app = express();


const configuration = new Configuration({
  apiKey: "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",
});

const openai = new OpenAIApi(configuration);


app.get('/GiveAnswer', async (req, res) => {
    const question = req.query.question;
    const response = await openai.createCompletion({
    model: "text-davinci-003",
          prompt: question,
          temperature: 0.6,
    });
    
    const completion = response.data;
    
    const answer = completion.choices[0].text.trim();
    res.send(answer);
});


app.listen(3000, function () {
  console.log('Server listening on port 3000');
});
