import os
from flask import Flask
app = Flask(__name__)

@app.route("/")
def main():
    return '''
        <html>
            <head>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                        margin: 0;
                    }
                    .container {
                        text-align: center;
                        background-color: #4CAF50;
                        color: white;
                        padding: 50px;
                        border-radius: 10px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    h1 {
                        font-size: 36px;
                    }
                    p {
                        font-size: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Welcome this is my simple Python project using Python and Flask!</h1>
                    <p>Enjoy exploring the project!</p>
                </div>
            </body>
        </html>
    '''

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5005)
