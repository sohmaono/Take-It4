
    //        VStack(spacing:0){
    //            if contInfo.selectedPicInfo != nil && editPicData.startEditPicture{
    //                VStack(spacing:5){
    //                    HStack{
    //                        Text(editPicData.editPictureData.changeEditAddingPicture ? "Edit":"Adding Picture...")
    //                            .foregroundColor(editPicData.editPictureData.changeEditAddingPicture ? .blue:.black)
    //                            .font(.system(size: 20))
    //                            .italic(editPicData.editPictureData.changeEditAddingPicture)
    //                            .fontWeight(.heavy)
    //                            .offset(
    //                                x:editPicData.editPictureData.changeEditAddingPicture ? 5:0,
    //                                y:editPicData.editPictureData.openEditingMode ? 20:0)
    //                            .padding(.horizontal,20)
    //
    //                        Spacer()
    //
    //                        Button{
    //                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
    //                            DispatchQueue.main.async{
    //                                editPicData.editPictureData.changeEditAddingPicture.toggle()
    //                            }
    //                            withAnimation(.linear(duration: 0.1)){
    //                                editPicData.editPictureData.openEditingMode.toggle()
    //                            }
    //                        } label: {
    //                            Image(systemName: !editPicData.editPictureData.openEditingMode ? "pencil.circle.fill":"paperclip.circle.fill")
    //                                .font(.system(size: editPicData.editPictureData.openEditingMode ? 31:29))
    //                                .foregroundColor(.gray)
    //                                .padding(.horizontal,18)
    //                        }
    //                        .offset(y:10)
    //                    }
    //                    Image(uiImage: contInfo.selectedPicInfo!.image)
    //                        .resizable(resizingMode: .stretch)
    //                        .aspectRatio(contentMode: .fit)
    //                        .saturation(1+contInfo.selectedPicInfo!.num1*0.3)
    //                        .brightness(-contInfo.selectedPicInfo!.num2*0.03)
    //                        .contrast(1+contInfo.selectedPicInfo!.num3/9)
    //                        .grayscale(contInfo.selectedPicInfo!.num4*0.25)
    //                        .colorMultiply(Color(
    //                            red: contInfo.selectedPicInfo!.colorArray[0],
    //                            green: contInfo.selectedPicInfo!.colorArray[2],
    //                            blue: contInfo.selectedPicInfo!.colorArray[1]))
    //                        .overlay{
    //                            ClippingPicture(editPicData: editPicData)
    //                        }
    //                        .frame(width:320,
    //                               height:320)
    //                        .padding(.vertical,20)
    //                }
    //
    //                if editPicData.editPictureData.openEditingMode{
    //
    //                    VStack(spacing:15){
    //                        HStack{
    //                            Spacer()
    //                            Button(action:{
    //                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
    //                                DispatchQueue.main.async {
    //                                    editPicData.editPictureData.forPlusMinusButtonAnimation.toggle()
    //                                }
    //                                withAnimation(.linear(duration: 0.2)){
    //                                    editPicData.editPictureData.openFilterCircle.toggle()
    //                                }
    //                            }){
    //                                Image(systemName:editPicData.editPictureData.forPlusMinusButtonAnimation ? "minus":"plus")
    //                                    .font(.system(size: 20))
    //                                    .aspectRatio(contentMode: .fit)
    //                                    .foregroundColor(Color.black)
    //                                    .padding(.horizontal,30)
    //                            }
    //                            .offset(x:editPicData.editPictureData.openFilterCircle ? -40 : 10,y:editPicData.editPictureData.forPlusMinusButtonAnimation ? 5 : 0)
    //                        }
    //
    //                        if !editPicData.editPictureData.openFilterCircle{
    //                            VStack(spacing: 19){
    //                                HStack(spacing: 35){
    //                                    ZStack{
    //                                        RoundedRectangle(cornerRadius: 20)
    //                                            .foregroundColor(.blue)
    //                                            .opacity(0.6)
    //                                            .frame(width: 63, height: 15)
    //                                        Text("saturation")
    //                                            .font(.system(size: 10))
    //                                            .foregroundColor(.white)
    //                                    }
    //                                    PictureFilterBar(selectedNum: $editPicData.editPictureData.num1)
    //                                        .onChange(of: editPicData.editPictureData.num1) { newValue in
    //                                            contInfo.selectedPicInfo!.num1 = newValue
    //                                        }
    //                                }
    //                                .offset(x: -15)
    //                                HStack(spacing: 35){
    //                                    ZStack{
    //                                        RoundedRectangle(cornerRadius: 20)
    //                                            .foregroundColor(.blue)
    //                                            .opacity(0.6)
    //                                            .frame(width: 63, height: 15)
    //                                        Text("brightness")
    //                                            .font(.system(size: 10))
    //                                            .foregroundColor(.white)
    //                                    }
    //                                    PictureFilterBar(selectedNum: $editPicData.editPictureData.num2)
    //                                        .onChange(of: editPicData.editPictureData.num2) { newValue in
    //                                            contInfo.selectedPicInfo!.num2 = newValue
    //                                        }
    //                                }
    //                                .offset(x: -15)
    //                                HStack(spacing: 35) {
    //                                    ZStack{
    //                                        RoundedRectangle(cornerRadius: 20)
    //                                        //                                        .stroke(lineWidth: 1.5)
    //                                            .foregroundColor(.blue)
    //                                            .opacity(0.6)
    //                                            .frame(width: 63, height: 13.5)
    //                                        Text("contrast")
    //                                            .font(.system(size: 10))
    //                                            .foregroundColor(.white)
    //                                    }
    //                                    PictureFilterBar(selectedNum: $editPicData.editPictureData.num3)
    //                                        .onChange(of: editPicData.editPictureData.num3) { newValue in
    //                                            contInfo.selectedPicInfo!.num3 = newValue
    //                                        }
    //                                }
    //                                .offset(x: -15)
    //                                HStack(spacing: 35) {
    //                                    ZStack{
    //                                        RoundedRectangle(cornerRadius: 20)
    //                                        //                                        .stroke(lineWidth: 1.5)
    //                                            .foregroundColor(.blue)
    //                                            .opacity(0.6)
    //                                            .frame(width: 63, height: 15)
    //                                        Text("grayscale")
    //                                            .font(.system(size: 10))
    //                                            .foregroundColor(.white)
    //                                    }
    //                                    PictureFilterBar(selectedNum: $editPicData.editPictureData.num4)
    //                                        .onChange(of: editPicData.editPictureData.num4) { newValue in
    //                                            contInfo.selectedPicInfo!.num4 = newValue
    //                                        }
    //                                }
    //                                .offset(x: -15)
    //                            }
    //                        } else {
    //                            PictureFilterCircle(contInfo: contInfo,editPicData: editPicData)
    //                        }
    //                    }
    //                    .frame(height:125,alignment: .top)
    //                } else {
    //                    VStack(spacing: 40){
    //                        CaptionTextFieldView(editPicData: editPicData)
    //                            .padding(.horizontal,60)
    //                            .onChange(of: editPicData.editPictureData.comment) { newValue in
    //                                contInfo.selectedPicInfo!.comment = newValue
    //     k                       }
    //                            .onAppear{
    //                                editPicData.editPictureData.comment = contInfo.selectedPicInfo!.comment
    //                            }
    //                        Button(action: {
    //                            editPicData.showProgressView = true
    //                            DispatchQueue.main.async {
    //                                if let image = cropImage(
    //                                    contInfo.selectedPicInfo!.image,
    //                                    Position(x: editPicData.clippingPicData.clippedWidth,
    //                                             y: editPicData.clippingPicData.clippedHeight),
    //                                    Position(x: editPicData.clippingPicData.left,
    //                                             y: editPicData.clippingPicData.top),
    //                                    320){
    //                                    contInfo.selectedPicInfo!.image = image
    //                                }
    //                                editPicData.showProgressView = false
    //                                editPicData.startEditPicture = false
    //                                editPicData.finishEdit()
    //                            }
    //                        }){
    //                            Text("Post")
    //                                .font(.system(size: 15))
    //                                .bold()
    //                                .italic()
    //                                .foregroundColor(.white)
    //                                .padding(.horizontal,13)
    //                                .padding(.vertical,6)
    //                                .background(editPicData.editPictureData.comment.isEmpty ? Color.gray : Color.blue)
    //                                .animation(.linear(duration:0.3), value: editPicData.editPictureData.comment)
    //                                .clipShape(RoundedRectangle(cornerRadius: 8))
    //                        }
    //                    }
    //                }
    //            } else if editPicData.showProgressView {
    //                ProgressView()
    //            }
    //        }
    //        .padding(.horizontal,10)
    //        .padding(.bottom,70)
    //        .padding(.top,60)
    //        .background(Color.white)
    //        .clipShape(RoundedRectangle(cornerRadius: 15))
    //        .padding(20)
    //        .padding(.top,80)
