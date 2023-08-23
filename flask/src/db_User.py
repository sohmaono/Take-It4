from src import app, db, ma
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, desc, ARRAY

class User(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    sample = db.Column(ARRAY(db.String))


# APIに初めてリクエストが送信されたときにだけデータベースの作成を行う
@app.before_request
def init():
    db.create_all()

class UserSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = User
        
User_schema = UserSchema(many = True)

@app.route("/user", methods = ["GET"])
def getAllUser():
    data = User.query.all()
    return jsonify(User_schema.dump(data))

@app.route("/user/<int:id>", methods = ["GET"])
def getUser(id):
    data = User.query.filter_by(id=id).all()
    return jsonify(User_schema.dump(data))

#POST(登録)
@app.route('/user', methods=["POST"])
def post_User():
    entry = User()
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json
    
    entry.sample = data["sample"]

    db.session.add(entry)
    db.session.commit()
    db.session.close()

    # latestdataが何を示しているのかを調べたい
    latestdata= User.query.order_by(desc(User.id)).first()   
    return redirect('/user/' + str(latestdata.id))

#PUT(更新)
@app.route('/user/<int:id>', methods = ["PUT"])
def Put_User(id):
    entry = User.query.get(id)
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json

    entry.sample = data["sample"]
    db.session.merge(entry)
    db.session.commit()
    db.session.close()

    return redirect('/user/' + str(id))

#DELETE(削除)
@app.route('/user/<int:id>', methods=["DELETE"])
def delete_user(id):
    entry = User.query.get(id)
    db.session.delete(entry)
    db.session.commit()    
    db.session.close()

    return '', 204