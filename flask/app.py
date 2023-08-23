from flask import Flask, render_template, redirect, url_for
import sys
sys.dont_write_bytecode = True

from src import app

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/ctext', methods = ["POST", "GET"])
def CText():
    return render_template('ctext.html')

@app.route('/cpic', methods = ["POST", "GET"])
def CPic():
    return render_template('cpic.html')

if __name__ == '__main__':
    app.run(debug=True)