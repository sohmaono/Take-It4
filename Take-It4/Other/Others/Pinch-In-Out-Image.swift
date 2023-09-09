//
//  Pinch-In-Out-Image.swift
//  Take-It3
//
//  Created by 小野聡真 on 2023/07/30.
//

import SwiftUI

struct PinchInOutImage: View {
    
    @Binding var scale: CGFloat
    
    var picture: String = "porche1"
    
    var body: some View {
        VStack{
            Image(picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .addPinchZoom(scale: $scale)
        }
    }
}

extension View{
    func addPinchZoom(scale: Binding<CGFloat>)->some View{
        return PinchZoomContent(scale:scale) {
            self
        }
    }
}

struct PinchZoomContent<Content: View>:View{
    
    @State var offset: CGPoint = .zero
    @Binding var scale: CGFloat
    @State var scalePosition: CGPoint = CGPoint(x:0.5,y:0.5)
//    @Binding var boolPinching: Bool
    
    var content: Content
    
    init(scale:Binding<CGFloat>,@ViewBuilder content:@escaping ()->Content){
        self.content = content()
        self._scale = scale
    }
    
    var body: some View{
        content
            .offset(x:offset.x,y:offset.y)
            .overlay(
                GeometryReader{
                    proxy in
                    let size = proxy.size
                    
                    ZoomGesture(size: size, scale: $scale, offset: $offset, scalePosition: $scalePosition)
                }
            )
            .scaleEffect(scale > 1.3 ? 2.3 : 1 + (scale < 0 ? 0 : scale),anchor: .init(x: scalePosition.x, y: scalePosition.y))
            .onChange(of: scale) { newValue in
                if scale == -1{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                        scale = 0
                    }
                }
            }
    }
}

struct ZoomGesture: UIViewRepresentable{
    
    var size: CGSize
    @Binding var scale:CGFloat
    @Binding var offset: CGPoint
    
    @Binding var scalePosition: CGPoint
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent:self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let Pinchgesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinch(sender:)))
        
        let Pangesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePan(sender:)))
        
        Pangesture.delegate = context.coordinator
        
        view.addGestureRecognizer(Pinchgesture)
        view.addGestureRecognizer(Pangesture)
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator:NSObject,UIGestureRecognizerDelegate{
        
        var parent: ZoomGesture
        
        init(parent:ZoomGesture){
            self.parent = parent
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
        
        @objc
        func handlePan(sender: UIPanGestureRecognizer){
            
            sender.maximumNumberOfTouches = 2
            
            if (sender.state == .began || sender.state == .changed) && parent.scale > 0{
                if let view = sender.view{
                    let translation = sender.translation(in: view)
                    parent.offset = translation
                }
            }else {
                withAnimation(.easeInOut(duration: 0.35)){
                    parent.offset = .zero
                }
                withAnimation(.linear(duration: 0.35)){
                    parent.scalePosition = .init(x: 0.5, y: 0.5)
                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
//                    self.parent.scalePosition = .zero
//                }
            }
        }
        
        @objc
        func handlePinch(sender: UIPinchGestureRecognizer){
            if sender.state == .began || sender.state == .changed{
                
                parent.scale = (sender.scale - 1)
                
                let scalePoint = CGPoint(x: sender.location(in: sender.view).x / sender.view!.frame.size.width, y: sender.location(in: sender.view).y / sender.view!.frame.size.height)
                parent.scalePosition = (parent.scalePosition == CGPoint(x: 0.5, y: 0.5) ? scalePoint : parent.scalePosition)
            }else{
                withAnimation(.easeInOut(duration: 0.35)){
                    parent.scale = -1
                }
            }
        }
    }
}

//struct Pinch_In_Out_Image_Previews: PreviewProvider {
//    static var previews: some View {
//        PinchInOutImage()
//    }
//}
