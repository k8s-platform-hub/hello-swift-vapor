FROM swift:3.1.0

WORKDIR /swift-vapor
ADD swift-vapor /swift-vapor
RUN swift build 

CMD .build/debug/swift-vapor
