//
//  BottomSheetView.swift
//  HealthManager
//
//  Created by C.A.V.S.S on 7/9/24.
//

import SwiftUI

struct BottomSheetView<GetView: View>: ViewModifier {
    
    @Binding var isOpen: Bool
    @ViewBuilder private let getContent: GetView

    init(
        isOpen: Binding<Bool>,
        @ViewBuilder setContent: @escaping () -> GetView
    ) {
        self._isOpen = isOpen
        self.getContent = setContent()
    }
    
    @GestureState private var translation: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var isDragging = false

    @ViewBuilder private func bottomSheetUI() -> some View {
        ZStack{
            Color.gray.opacity(0.01)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isOpen = false
                    }
                }
           
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack {
                        self.getContent
                    }
                    .padding(
                        EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5)
                    )
                    .background(Color.clear)
                    .clipShape(TopRoundedRectangle(radius: 20, corners: [.topLeft, .topRight]))
                    .overlay(
                        TopRoundedRectangle(radius: 20, corners: [.topLeft, .topRight])
                            .stroke(Color.black, lineWidth: 0.5)
                    )
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: min(geometry.size.height - geometry.safeAreaInsets.top, geometry.size.height * 0.9),
//                                maxHeight: .infinity,
                        alignment: .bottom
                    )
                    .transition(.move(edge: .bottom))
                    .offset(y: max(offset, 0))
                    .animation(isDragging ? .none : .easeInOut, value: offset) // Apply animation based on dragging state
                }
                
                
                .padding(
                    EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                )
                .gesture(
                    DragGesture()
                        .updating($translation) { value, state, _ in
                            state = value.translation.height
                        }
                        .onChanged { value in
                            if value.translation.height > 0 {
                                offset = value.translation.height
                                isDragging = true
                            }
                        }
                        .onEnded { value in
                            if offset > geometry.size.height / 3 {
                                withAnimation {
                                    isOpen = false
                                }
                            } else {
                                withAnimation {
                                    offset = 0
                                }
                            }
                            isDragging = false
                        }
                )
                .onDisappear(perform: {
                    offset = 0
                })
            }
        }
        .background(
            BackgroundBlurView()
                .edgesIgnoringSafeArea(.all)
        )
        
    }
    
    func body(content : Content) -> some View {
        content
            .fullScreenCover(
                isPresented: $isOpen,
                content: {
                    bottomSheetUI()
                }
            )
    }
    
}

struct TopRoundedRectangle: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
            
        )
        return Path(path.cgPath)
    }
}


struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


extension View {
    func bottomSheet<GetView: View>(
        isOpen: Binding<Bool>,
        @ViewBuilder setContent: @escaping () -> GetView
    ) -> some View {
        self.modifier(
            BottomSheetView(
                isOpen: isOpen,
                setContent: setContent
            )
        )
    }
}
