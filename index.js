const http = require("http")
const https = require("https")
const fs = require("fs")
const express = require('express')
const app = express()

app.get('/', (req, res) => {
    res.send('Hello World!')
})

const credentials = {
    key: fs.readFileSync("cert-key.pem"),
    cert: fs.readFileSync("cert.crt"),
}

const httpsServer = https.createServer(credentials, app)
const httpServer = http.createServer(app)

httpServer.listen(3000, () => console.log("Http Server listening on port 3000"))
httpsServer.listen(443, () => console.log("Https Server listening on port 443"))



