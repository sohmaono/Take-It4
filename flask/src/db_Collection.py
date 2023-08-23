from src import app, db, ma
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, desc
import datetime

# DBの作成
class Collection(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    # user = 
    title = db.Column(db.String)
    created_at = db.Column(db.DateTime, default = datetime)

# APIに初めてリクエストが送信されたときにだけデータベースの作成を行う
@app.before_request
def init():
    db.create_all()

class CollectionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Collection
        fields = ('id',
                  'user', 
                  'title', 
                  'created_at')
        
Collection_schema = CollectionSchema(many = True)

# jsonifyに変える必要がありそう？
@app.route("/collection", methods = ["GET"])
def getAllCollection():
    collection_list = db.session.query(Collection).all()

    if collection_list == None:
        return []
    else:
        return collection_list

# @app.route("/order", methods = ["GET"])
# def getAll():
#     data = Order.query.all()
#     return jsonify(order_schema.dump(data))

@app.route("/collection/<int:id>", methods = ["GET"])
def getCollection(id):
    data = Collection.query.filter_by(id=id).all()
    return jsonify(Collection_schema(data))

#POST(登録)
@app.route('/collection', methods=["POST"])
def post_Collection():
    entry = Collection()
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json
    entry.user = data["user"]
    entry.title = data["title"]
    entry.created_at = data["created_at"]

    db.session.add(entry)
    db.session.commit()
    db.session.close()

    # latestdataが何を示しているのかを調べたい
    latestdata= Collection.query.order_by(desc(Collection.id)).first()   
    return redirect('/Collection/' + str(latestdata.id))