package com.kh.dungjip.common.websocket.server;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private final WebsocketAskServer WebsocketAskServer;
    

    public WebSocketConfig(WebsocketAskServer WebsocketAskServer) {
        this.WebsocketAskServer = WebsocketAskServer;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(WebsocketAskServer, "/path/to/websocket")
                .setAllowedOrigins("*");
              /*  .setMaxTextMessageBufferSize(1024000)  // 최대 텍스트 메시지 크기
                .setMaxBinaryMessageBufferSize(1024000); // 최대 바이너리 메시지 크기
    }*/

}
}