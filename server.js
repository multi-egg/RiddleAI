const express = require("express");
const OpenAI = require("openai");

const app = express();
app.use(express.json());

const client = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
});

app.post("/solve", async (req, res) => {
  try {
    const question = req.body.question;

    const response = await client.responses.create({
      model: "gpt-5-nano",
      input: `Answer this riddle with only the answer: ${question}`
    });

    res.json({ answer: response.output_text.trim() });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on ${PORT}`);
});