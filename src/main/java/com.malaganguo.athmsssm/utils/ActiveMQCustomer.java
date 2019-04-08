package com.malaganguo.athmsssm.utils;

import com.google.gson.Gson;
import com.lyw.serialPort.model.Model;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.web.socket.WebSocketSession;

import javax.jms.*;

public class ActiveMQCustomer {

    public static Model m ;
    private static MessageConsumer consumer ;
    private static Session session;
    private static Connection connection;
    private static Gson gson = new Gson();

    public static void start(){
        try {
            ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
            connectionFactory.setTrustAllPackages(true);  //允许接收所有的数据
            connection = connectionFactory.createConnection();
            connection.start();
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            Queue queue = session.createQueue("MymessageQueue");
            consumer = session.createConsumer(queue);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void activeMQConsumerQueue(WebSocketSession session) throws Exception{

        consumer.setMessageListener(new MessageListener() {
            @Override
            public void onMessage(Message message) {
                if(message instanceof ObjectMessage){//对象信息
                    ObjectMessage objectMessage = (ObjectMessage)message;
                    try {
                        System.out.println((Model)(objectMessage.getObject()));
                        m = (Model)(objectMessage.getObject());

                        session.sendMessage(new org.springframework.web.socket.TextMessage(gson.toJson(m)));

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if(message instanceof TextMessage){//文本信息
                    TextMessage textMessage = (TextMessage)message;
                    try {
                        System.out.println(textMessage.getText());
                    } catch (JMSException e) {
                        e.printStackTrace();
                    }
                }
            }

        });
        System.in.read();

    }

    public static void close(){

            if(null != consumer){
                try {
                    consumer.close();
                } catch (JMSException e) {
                    e.printStackTrace();
                }
                consumer = null;
            }
            if (null != session){
                try {
                    session.close();
                } catch (JMSException e) {
                    e.printStackTrace();
                }
                session = null;
            }
            if(null != connection){
                try {
                    connection.close();
                } catch (JMSException e) {
                    e.printStackTrace();
                }
                connection = null;
            }
    }
}
