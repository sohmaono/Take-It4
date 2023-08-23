from src import app, db, ma
from flask import Flask, render_template, request, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, desc

# DBの作成
class CText(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    font_scale = db.Column(db.Float)
    font_weight = db.Column(db.Float)
    line_spacing = db.Column(db.Float)
    font_type = db.Column(db.String)
    # position_x = db.Column(db.Float)
    # position_y = db.Column(db.Float)
    italic = db.Column(db.Integer)  #booleanの扱いがわからないからそこを調べる必要あり

# APIに初めてリクエストが送信されたときにだけデータベースの作成を行う
@app.before_request
def init():
    db.create_all()

class CTextSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CText
        
ctext_schema = CTextSchema(many = True)

@app.route("/ctext", methods = ["GET"])
def getAllText():
    data = CText.query.all()
    return jsonify(ctext_schema.dump(data))

@app.route("/ctext/<int:id>", methods = ["GET"])
def getText(id):
    data = CText.query.filter_by(id=id).all()
    return jsonify(ctext_schema.dump(data))

#POST(登録)
@app.route('/ctext', methods=["POST"])
def post_CText():
    entry = CText()
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json
    
    entry.font_scale = data["font_scale"]
    entry.font_weight = data["font_weight"]
    entry.line_spacing = data["line_spacing"]
    entry.font_type = data["font_type"]
    # entry.position_x = data["position_x"]
    # entry.position_y = data["position_y"]
    # entry.italic = data["italic"]

    db.session.add(entry)
    db.session.commit()
    db.session.close()

    # latestdataが何を示しているのかを調べたい
    latestdata= CText.query.order_by(desc(CText.id)).first()   
    return redirect('/ctext/' + str(latestdata.id))

#PUT(更新)
@app.route('/ctext/<int:id>', methods = ["PUT"])
def Put_CText(id):
    entry = CText.query.get(id)
    # jsonリクエストから値取得
    json = request.get_json()
    if type(json) == list:
        data = json[0]
    else:
        data = json

    entry.font_scale = data["font_scale"]
    entry.font_weight = data["font_weight"]
    entry.line_spacing = data["line_spacing"]
    entry.font_type = data["font_type"]
    # entry.position_x = data["position_x"]
    # entry.position_y = data["position_y"]
    # entry.italic = data["italic"]
    
    db.session.merge(entry)
    db.session.commit()
    db.session.close()

    return redirect('/ctext/' + str(id))

#DELETE(削除)
@app.route('/ctext/<int:id>', methods=["DELETE"])
def delete_CText(id):
    entry = CText.query.get(id)
    db.session.delete(entry)
    db.session.commit()    
    db.session.close()

    return '', 204