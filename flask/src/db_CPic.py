from src import app, db, ma
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, desc
import datetime

# DBの作成
class CPic(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    num1 = db.Column(db.Float)
    num2 = db.Column(db.Float)
    num3 = db.Column(db.Float)
    num4 = db.Column(db.Float)
    comment = db.Column(db.String)
    time = db.Column(db.DateTime, default = datetime)
    likedNum = db.Column(db.Integer) # default値は0だけどそれの設定は可能？
    imageRatio = db.Column(db.Float) # default値は1だけどそれの設定は可能？
     # image = db.Column()  imageはどうすればよい
    """
    positionのクラスを作る必要あり
    position_x = db.Column(db.Float)
    position_y = db.Column(db.Float)
    """
    # colorArray = db.Column() 配列はどうすれば良い

# APIに初めてリクエストが送信されたときにだけデータベースの作成を行う
@app.before_request
def init():
    db.create_all()

class CPicSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CPic
        
cpic_schema = CPicSchema(many = True)

# jsonifyに変える必要がありそう？
@app.route("/cPic", methods = ["GET"])
def getAllPic():
    data = CPic.query.all()
    return jsonify(cpic_schema.dump(data))
    
@app.route("/cPic/<int:id>", methods = ["GET"])
def getPic(id):
    data = CPic.query.filter_by(id=id).all()
    return jsonify(cpic_schema(data))

#POST(登録)
@app.route('/cPic', methods=["POST"])
def post_CPic():
    entry = CPic()
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json

    entry.num1 = data["num1"]
    entry.num2 = data["num2"]
    entry.num3 = data["num3"]
    entry.num4 = data["num4"]
    entry.comment = data["comment"]
    entry.time = data["created_at"]
    entry.likedNum = data["likedNum"]
    entry.imageRatio = data["imageRatio"]
    """
    image, position, colorArrayは解決してからコメントアウトを消す
    entry.image = data['image']
    entry.position_x = data["position_x"]
    entry.position_y = data["position_y"]
    entry.colorArray = data["colorArray"]
    """

    db.session.add(entry)
    db.session.commit()
    db.session.close()

    # latestdataが何を示しているのかを調べたい
    latestdata= CPic.query.order_by(desc(CPic.id)).first()   
    return redirect('/cPic/' + str(latestdata.id))

#PUT(更新)
@app.route('/cpic/<int:id>', methods = ["PUT"])
def Put_CPic(id):
    entry = CPic.query.get(id)
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json

    entry.num1 = data["num1"]
    entry.num2 = data["num2"]
    entry.num3 = data["num3"]
    entry.num4 = data["num4"]
    entry.comment = data["comment"]
    entry.time = data["created_at"]
    entry.likedNum = data["likedNum"]
    entry.imageRatio = data["imageRatio"]
    """
    image, position, colorArrayは解決してからコメントアウトを消す
    entry.image = data['image']
    entry.position_x = data["position_x"]
    entry.position_y = data["position_y"]
    entry.colorArray = data["colorArray"]
    """
    
    db.session.merge(entry)
    db.session.commit()
    db.session.close()

    return redirect('/cpic/' + str(id))

#DELETE(削除)
@app.route('/cpic/<int:id>', methods=["DELETE"])
def delete_CPic(id):
    entry = CPic.query.get(id)
    db.session.delete(entry)
    db.session.commit()    
    db.session.close()

    return '', 204