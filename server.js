// Create express app
var express = require("express")
var app = express()

const UCL = require("./ucl")
var ucl = new UCL('../data.sqlite')

// Server port
var HTTP_PORT = 8092

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);

    next();
});

// Start server
app.listen(HTTP_PORT, () => {
    console.log("Server running on port %PORT%".replace("%PORT%", HTTP_PORT))
});

// Root endpoint
app.get("/", (req, res, next) => {
    res.json({ "message": "Ok" })
});

// Insert here other API endpoints
app.get("/api/clubParticipants", (req, res, next) => {
    if (req.params.clubParticipants == "All") {
        ucl.clubParticipants(req.params._seasonkey)
            .then((clubParticipants) => {
                res.json({
                    "message": `Clubs Participated ${req.params._seasonkey}`,
                    "data": clubParticipants
                })
            })
            .catch((err) => {
                res.status(400).json({ "error": err.message });
                return;
            })
    }
});

// Default response for any other request
app.use(function (req, res) {
    res.status(404);
});
