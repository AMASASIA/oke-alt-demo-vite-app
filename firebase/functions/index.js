const functions = require("firebase-functions")
const { GoogleGenerativeAI } = require("@google/generative-ai")

const genAI = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY)

exports.aiHandler = functions.https.onRequest(async (req, res) => {
  try {
    const model = genAI.getGenerativeModel({ model: "gemini-pro" })
    const result = await model.generateContent(req.body.prompt || "Hello from OKE!")
    res.json({ reply: result.response.text() })
  } catch (err) {
    res.status(500).send(err.message)
  }
})
