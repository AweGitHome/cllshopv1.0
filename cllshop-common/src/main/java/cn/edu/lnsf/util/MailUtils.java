package cn.edu.lnsf.util;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailUtils {

    static final String SEND_MAIL_ADDRESS = "awe8025@126.com";

    static final String PASSWORD = "cllshop666";

    static final String MY_SMTP_HOST = "smtp.126.com";

    public static void main(String[] args){
        try {
            String code = CodeUtils.getCode();
            String content = "您的验证码为<span style='color:red;'>"+code+"</span>,请于30分钟内完成注册，感谢您的配合";
            sendMail("2715979423@qq.com",content);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void sendMail(String mail,String content) throws Exception{
        // 1. 创建一封邮件
        Properties props = new Properties();                // 用于连接邮件服务器的参数配置（发送邮件时才需要用到）
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", MY_SMTP_HOST);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

        Session session= Session.getInstance(props);        // 根据参数配置，创建会话对象（为了发送邮件准备的）
        session.setDebug(true);
        //创建一封简单文本邮件
        MimeMessage message = createMimeMessage(session, mail, content);
        //获取传输通道
        Transport transport = session.getTransport();
        //使用授权码连接发件人邮箱
        transport.connect(SEND_MAIL_ADDRESS, PASSWORD);
        //选中接收人并发送消息
        transport.sendMessage(message, message.getAllRecipients());
        //关闭通道
        transport.close();
    }


    public static MimeMessage createMimeMessage(Session session, String receiveMail, String content) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(SEND_MAIL_ADDRESS, "cllshop注册中心", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "XX用户", "UTF-8"));

        // 4. Subject: 邮件主题
        message.setSubject("欢迎注册", "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）
        message.setContent(content, "text/html;charset=UTF-8");
        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }
}
