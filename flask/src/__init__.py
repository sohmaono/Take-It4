from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

app = Flask(__name__, template_folder = '../templates')
app.config['SECRET_KEY'] = 'secret key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///ctext.sqlite3'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config['JSON_AS_ASCII'] = False #日本語を利用

#SQLAlchemyでデータベース定義
db = SQLAlchemy(app)
ma = Marshmallow(app)

import src.db_Collection
import src.db_CPic
import src.db_CText
